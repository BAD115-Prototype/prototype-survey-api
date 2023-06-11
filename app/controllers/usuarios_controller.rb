class UsuariosController < ApplicationController
    include CurrentUserConcern
    def index
        @users=Usuario.includes(:rols).order('created_at')
        json_data = @users.as_json(include: :rols)
        render json: {
            status: 'Exitoso',
            users: json_data,
          }
    end
    def show
        @users=Usuario.includes(:rols).find(params[:id])
        json_data = @users.as_json(include: :rols)
        render json: {
            status: 'Exitoso',
            users: json_data,
          }
    end
    def update
        usuario = Usuario.find(params[:id])
        usuario.update(
            nombre_usuario:params[:nombre_usuario],
            activo: params[:activo]
        )
        
        #Eliminando roles antiguos
        usuario.rols.clear
        #Asignando roles
        roles_id=[]
        rolsAsig=params[:permisosRight]
        rolsAsig.each do |rolA|
            roles_id  << rolA['pk_rol']
        end
        usuario.rol_ids=roles_id

        render json: {
            status: 'Exitoso',
            data: usuario,
          }
    end
end
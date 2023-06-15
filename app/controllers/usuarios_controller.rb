class UsuariosController < ApplicationController
    include CurrentUserConcern
    def index
        permitido = verificar_url(request, @current_user)
        if permitido
            @users=Usuario.includes(:rols).order('created_at')
            json_data = @users.as_json(include: :rols)
            render json: {
                status: 'Exitoso',
                users: json_data,
            }
        else
            render json: { error: 'Unauthorized' }, status: :unauthorized
        end
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
    private
    def verificar_url(request, current_user)
        http_method = request.method
        current_url = "#{http_method}:#{request.fullpath}"
        permitir = false 
        if current_user
          roles = current_user['rols']        
          roles.each do |rol|
            rol['permisos'].each do |permiso|
              permiso['pantallas'].each do |pantalla|
                custom_url = pantalla['url_pantalla'].gsub("idUsuario", current_user['id'].to_s)
                if current_url == custom_url
                  permitir = true
                end
              end
            end
          end
        end   
        return permitir
    end
end
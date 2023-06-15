class PermisosController < ApplicationController
  include CurrentUserConcern
  
  def index  
    if (params[:rol_id] != nil)
      #Obteniendo permisos por rol
      rol = Rol.find(params[:rol_id])      
      @permisos = Rol.includes(:permisos).where(pk_rol: rol.pk_rol)
      json_data = @permisos.as_json(include: :permisos)

      render json: {
      status: 'Exitoso',
      message: 'Permisos Cargadas',
      data: json_data
      }, status: :ok
    
    else
      #Obteniendo permisos
      permitido = verificar_url(request, @current_user)
      if permitido
        permisos = Permiso.order('created_at')
        render json: {
          status: 'Exitoso',
          message: 'Permisos Cargadas',
          data: permisos
        }, status: :ok
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end
    
  def create
    #Creando asignacion de permisos
    if (params[:rol_id] != nil)

      rol = Rol.find(params[:rol_id]) 
      permisoRol = Permiso.includes(:rols)  
      permisosAsig=params[:permisosRight]
      permisosNoAsig=params[:permisosLeft]
      @request1 = ""
      @request2 = ""

      #Asignando permisos
      permisosAsig.each do |permisoA|
        permisoRol.each do |pr|
          if(pr["pk_permiso"] == permisoA["pk_permiso"])  
            if rol.permisos.include?(pr)
              @request1 = "Permisos ya asignados"
            else    
              rol.permisos <<  Permiso.find(permisoA["pk_permiso"])
              @request1 = "Asignadas con exito"   
            end
          end    
        end
      end

      #Permisos no asignados
      permisosNoAsig.each do |permisoNA|
        permisoRol.each do |pr|
          if(pr["pk_permiso"] == permisoNA["pk_permiso"])     
            if rol.permisos.include?(pr)
              @permi = PermisoRol.where("permiso_rols.rol_id = ? AND permiso_rols.permiso_id = ?", params[:rol_id], pr["pk_permiso"])
              if PermisoRol.destroy(@permi[0]["id"])
                @request2= "Se revocaron los permisos"
              else
                @request2= "Error al revocar permisos"
              end
            end
          end    
        end
      end

      render json: {
        status: 'Exitoso',
        message: @request1 + @request2,
      }, status: :ok
    
    else    
      #Creando nuevo permiso 
      newPermiso = Permiso.new(permisos_params)
      if newPermiso.save
        render json: {
          status: 'Exitoso',
          message: 'Permiso creado',
          data: newPermiso
        }, status: :ok
        roladmin = Rol.find_by(pk_rol: 1)
        newPermiso.rols << roladmin  
      else
        render json: {
          status: 'ERROR',
          message: 'Permiso no creado',
          data: newPermiso.errors
        }, status: :unprocessable_entity
        
      end
    end
  end

    
  def update
    permiso = Permiso.find(params[:id])
    if permiso.update(permisos_params)
      render json: {
        status: 'Exitoso',
        message: 'Permiso Actualizado',
        data: permiso
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: 'Permiso no actualizado',
        data: permiso.errors
      }, status: :unprocessable_entity
    end
  end

    
  def show
    permiso = Permiso.find(params[:id])
    render json: {
      status: 'Exitoso',
      message: 'Permiso Cargado',
      data: permiso
      }, status: :ok
  end
        
  def destroy
    permiso = Permiso.find(params[:id])
      if permiso.destroy
        render json: {
          status: 'Exitoso',
          message: 'Permiso eliminado',
          data: permiso
        }, status: :ok
      else
        render json: {
          status: 'ERROR',
          message: 'Permiso no eliminado',
          data: permiso.errors
          }, status: :unprocessable_entity
      end
  end
    
  ##Parametros de permisos
    private
    def permisos_params
      params.permit(:nombre_permiso)
    end
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

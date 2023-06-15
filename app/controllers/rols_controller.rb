class RolsController < ApplicationController
  include CurrentUserConcern

  def index
    permitido = verificar_url(request, @current_user)
    if permitido
      roles = Rol.order('created_at')
      render json: {
        status: 'Exitoso',
        message: 'Roles Cargados',
        data: roles
      }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def create
    newRol = Rol.new(rols_params)
    if newRol.save
      render json: {
        status: 'Exitoso',
        message: 'Rol creado',
        data: newRol
    }, status: :ok
    else
    render json: {
        status: 'ERROR',
        message: 'Rol no creado',
        data: newRol.errors
    }, status: :unprocessable_entity
    end
  end

  def update
    rol = Rol.find(params[:id])
    if rol.update(rols_params)
      render json: {
        status: 'Exitoso',
        message: 'Rol Actualizado',
        data: rol
    }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: 'Rol no actualizado',
        data: rol.errors
    }, status: :unprocessable_entity
    end
  end

  def show
    rol = Rol.find(params[:id])
    render json: {
    status: 'Exitoso',
    message: 'Rol Cargado',
    data: rol
    }, status: :ok
  end

  def destroy
    rol = Rol.find(params[:id])
    if rol.destroy
        render json: {
            status: 'Exitoso',
            message: 'Rol eliminado',
            data: rol
        }, status: :ok
    else
        render json: {
            status: 'ERROR',
            message: 'Rol no eliminado',
            data: rol.errors
        }, status: :unprocessable_entity
    end
  end

  ##Parametros de rol
  private
  def rols_params
    params.permit(:descripcion_rol)
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

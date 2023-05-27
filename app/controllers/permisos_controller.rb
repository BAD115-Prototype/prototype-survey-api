class PermisosController < ApplicationController
  include CurrentUserConcern

  def index
    permisos = Permiso.order('created_at')
    render json: {
      status: 'Exitoso',
      message: 'Permisos Cargadas',
      data: permisos
    }, status: :ok
  end
    
  def create
    newPermiso = Permiso.new(permisos_params)
    if newPermiso.save
      render json: {
        status: 'Exitoso',
        message: 'Permiso creado',
        data: newPermiso
      }, status: :ok
      rol = Rol.find_by(pk_rol: 1)
      newPermiso.rols << rol
    else
      render json: {
        status: 'ERROR',
        message: 'Permiso no creado',
        data: newPermiso.errors
      }, status: :unprocessable_entity
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
      
end
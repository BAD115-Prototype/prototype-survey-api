class RolsController < ApplicationController
  include CurrentUserConcern

  def index
    if Rol.find_by(descripcion_rol: "Administrador").nil?
      rol = Rol.create(descripcion_rol: "Administrador")
      usuario = Usuario.find_by(id: 1)
      rol.usuarios << usuario
      render json: {
          status: :created,
          rol: rol
      }
    end

    roles = Rol.order('created_at')
    render json: {
      status: 'Exitoso',
      message: 'Roles Cargados',
      data: roles
    }, status: :ok
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
        data: pantalla.errors
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
  
end


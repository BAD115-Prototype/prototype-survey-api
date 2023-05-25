class RolsController < ApplicationController
  def index
    rol = Rol.create(descripcion_rol: "Administrador")
    usuario = Usuario.find_by(id: 1)
    rol.usuarios << usuario
    render json: {
        status: :created,
        rol: rol
      }
  end
  def create
  end
end

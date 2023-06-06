class GenerosController < ApplicationController
  def index
    generos=Genero.all()
    render json: {
        status: 'Exitoso',
        message: 'Generos Cargadas',
        data: generos
    }, status: :ok
  end
end

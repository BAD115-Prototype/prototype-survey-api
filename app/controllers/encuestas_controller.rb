class EncuestasController < ApplicationController
    def index
        usuario = Usuario.find(params[:usuario_id])
        @encuestas = usuario.encuestas
        render json: @encuestas
    end
end
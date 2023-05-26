class PreguntasController < ApplicationController
    def index
        encuesta = Encuesta.find(params[:pk_encuesta])
        @preguntas = encuesta.preguntas
        render json: @preguntas
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

end

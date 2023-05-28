class PreguntasController < ApplicationController
    def index
        encuesta = Encuesta.find(params[:encuesta_id])
        @preguntas = encuesta.preguntas
        render json: @preguntas
    end

    def show
        @pregunta = Pregunta.find(params[:id])
        render json: @pregunta
    end

    def create
        encuesta = Encuesta.find(params[:encuesta_id])
        tipo_pregunta = TipoPregunta.find(params[:tipo_pregunta_id])

        @pregunta = encuesta.preguntas.build(params.require(:pregunta).permit(:texto_pregunta, :campo_obligatorio, :tipo_pregunta_id))
        @pregunta.tipo_pregunta = tipo_pregunta
        @pregunta.created_at = DateTime.now
        @pregunta.created_at = DateTime.now

        if @pregunta.save
            render json: @pregunta, status: :created
        else
            render json: { error: 'No se pudo crear la pregunta' }, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

end

class PreguntasController < ApplicationController
    def index
        encuesta = Encuesta.find(params[:encuesta_id])
        @preguntas = Pregunta.includes(:opcionRespuestas).where(encuesta_id: encuesta.id)
        json_data = @preguntas.as_json(include: :opcionRespuestas)
        render json: json_data
    end

    def show
        @pregunta = Pregunta.find(params[:id])
        render json: @pregunta
    end

    def create
        encuesta = Encuesta.find(params[:encuesta_id])
        preguntas=params[:preguntas]
        @request=""
        preguntas.each do |pregunta|
            #Creando la pregunta
            nuevaPregunta=encuesta.preguntas.build(
                texto_pregunta: pregunta["texto_pregunta"],
                campo_obligatorio: pregunta["campo_obligatorio"],
            )
            nuevaPregunta.tipo_pregunta_id=pregunta["tipo_pregunta_id"]
            
            if nuevaPregunta.save 
                ##Creando opciones de pregunta
                pregunta["opcionRespuesta"].each do |opcion|
                    nuevaOpcion=OpcionRespuesta.new(
                        fk_pregunta_id: nuevaPregunta.id,
                        texto_opcion: opcion["texto_opcion"]
                    )
                    if nuevaOpcion.save
                        @request="Se almacenaron todas las preguntas"
                    else
                        @request="Ocurrio un error en pregunta" + nuevaPregunta.id
                        encuesta.preguntas.destroy_all
                    end
                end
            end
        end
        render json: {
            status: 'Exitoso',
            message: @request,
        }, status: :ok

    end

    def edit
    end

    def update
    end

    def destroy
    end

end

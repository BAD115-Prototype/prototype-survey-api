class RespuestasController < ApplicationController
    def index
        render json: {
            status: 'Exitoso',
            message: 'Respuestas consultadas',
            data: "Respuestas"
        }, status: :ok
    end
    def show
        @encuestado=Encuestado.find(params[:encuestado_id])
        render json: {
            status: 'Exitoso',
            message: 'Respuestas consultadas',
            data: @encuestado.respuestas
        }, status: :ok
    end
    def create
        encuestado=Encuestado.find(params[:encuestado_id])
        respuestas=params[:respuestas]
        @request=""
        ##Eliminando respuestas anteriores
        encuestado.respuestas.destroy_all
        #Recorriendo las respuestas
        respuestas.each do |respuesta|
            nuevaRespuesta=encuestado.respuestas.build(
                valor_respuesta: respuesta['valor_respuesta']
            )
            if nuevaRespuesta.save
                 ##REcorriendo las opciones de respuesta
                opciones=respuesta['opcionRespuestas']
                @request="Se almacenaron todas las respuestas"
                opciones.each do |opcion|
                    op=OpcionRespuesta.find(opcion['pk_opcion_respuesta'])
                    nuevaRespuesta.opcion_respuestas << op
                end
            else
                @request="Ocurrio un error en respuesta " + nuevaRespuesta.pk_respuesta
                encuestado.respuestas.destroy_all
            end
        end
        render json: {
            status: 'Exitoso',
            message: @request,
        }, status: :ok
    end
end

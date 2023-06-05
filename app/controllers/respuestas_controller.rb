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
        cantidadOpciones=0
        ##Eliminando respuestas anteriores
        encuestado.respuestas.destroy_all
        #Recorriendo las respuestas
        respuestas.each do |respuesta|
            opciones=respuesta['opcionRespuestas']
            ##Necesito inicializar un contador cuando estoy en las preguntas Ranking
            if respuesta['tipo_pregunta_id']==7
                cantidadOpciones=opciones.size
            end
            opciones.each do |opcion|
                #Si es una pregunta Abierta, se almacena el valor de la respuesta proporcionado por el usuario
                if respuesta['tipo_pregunta_id']==1 or respuesta['tipo_pregunta_id']==8
                    nuevaRespuesta=encuestado.respuestas.build(
                        valor_respuesta: respuesta['valor_respuesta']
                    )
                ## si es una pregunta ranking se da un puntaje correspondiente a la posición, siendo la primera posición la de mayor puntaje
                elsif respuesta['tipo_pregunta_id']==7
                    nuevaRespuesta=encuestado.respuestas.build(
                        valor_respuesta: cantidadOpciones
                    )
                    cantidadOpciones -= 1
                elsif respuesta['tipo_pregunta_id']==20 ##Es cuando la respuesta de una pregunta mixta es un valor abierto
                    nuevaRespuesta=encuestado.respuestas.build(
                        valor_respuesta: respuesta['valor_abierto']
                    )
                #Si no, se ocupa el valor correspondiente a la opción de respuesta
                else    
                    nuevaRespuesta=encuestado.respuestas.build(
                        valor_respuesta: opcion["texto_opcion"]
                    )
                end

                if nuevaRespuesta.save
                    op=OpcionRespuesta.find(opcion['pk_opcion_respuesta'])
                    nuevaRespuesta.opcion_respuestas << op
                    @request="Se almacenaron todas las respuestas"
                else
                    @request="Ocurrio un error en respuesta " + nuevaRespuesta.pk_respuesta
                    encuestado.respuestas.destroy_all
                end
            end
        end
        render json: {
            status: 'Exitoso',
            message: @request,
        }, status: :ok
    end
end

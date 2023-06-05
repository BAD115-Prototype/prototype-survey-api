class ResultadosController < ApplicationController
    include CurrentUserConcern
    def index
        encuesta_id = params[:encuesta_id]
        resultados=Respuesta.find_by_sql('SELECT * FROM vista_preguntas_respuestas WHERE encuesta_id=%s' %[encuesta_id])
        respuestas_agrupadas = resultados.group_by { |respuesta| [respuesta.pk_pregunta, respuesta.tipo_pregunta_id] }
        cantidad_encuestados=Encuestado.where(fk_encuesta_id: encuesta_id).count
        render json: {
            status: 'Exitoso',
            message: 'Respuestas consultadas',
            total: cantidad_encuestados,
            data: respuestas_agrupadas
        }, status: :ok
    end
end
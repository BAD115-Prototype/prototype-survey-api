class PersonalizacionEncuestaController < ApplicationController
    def show
        encuesta = Encuesta.find(params[:encuesta_id])
        personalizacion_encuesta = encuesta.personalizacion_encuesta

        render json: personalizacion_encuesta
        # rescue ActiveRecord::RecordNotFound
        # render json: { error: 'Personalización de encuesta no encontrada' }, status: :not_found
    end
end
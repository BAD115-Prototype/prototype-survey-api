class PersonalizacionEncuestaController < ApplicationController
    def create
      encuesta = Encuesta.find(params[:encuesta_id])
      personalizacion_encuesta = encuesta.build_personalizacion_encuesta(personalizacion_encuesta_create_params)
      
      if personalizacion_encuesta.save
        render json: personalizacion_encuesta, status: :created
      else
        render json: { error: 'No se pudo crear la personalización de la encuesta' }, status: :unprocessable_entity
      end
    end

    def index
      begin
        Integer(params[:encuesta_id])
        encuesta = Encuesta.find(params[:encuesta_id])
        personalizacion_encuesta = encuesta.personalizacion_encuesta
        render json: personalizacion_encuesta
      rescue ArgumentError
        encuesta = Encuesta.find_by(link_encuesta: params[:encuesta_id])
        personalizacion_encuesta = encuesta.personalizacion_encuesta
        render json: personalizacion_encuesta
      end
    end

    def update
      encuesta = Encuesta.find(params[:encuesta_id])
      personalizacion_encuesta = encuesta.personalizacion_encuesta
  
      if personalizacion_encuesta.update(personalizacion_encuesta_update_params)
        render json: personalizacion_encuesta
      else
        render json: { error: 'No se pudo actualizar la personalización de la encuesta' }, status: :unprocessable_entity
      end
    end

  def personalizacion_encuesta_create_params
    params.require(:personalizacion_encuesta).permit(:tipografia, :imagen, :color_fondo, :color_principal)
  end

  def personalizacion_encuesta_update_params
    params.require(:personalizacion_encuesta).permit(:tipografia, :imagen, :color_fondo, :color_principal)
  end
end
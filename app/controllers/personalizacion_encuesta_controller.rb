class PersonalizacionEncuestaController < ApplicationController
    def create
      encuesta = Encuesta.find(params[:encuesta_id])
      ruta_imagen = upload_file
      personalizacion_encuesta = encuesta.build_personalizacion_encuesta(personalizacion_encuesta_create_params)
      personalizacion_encuesta.imagen = ruta_imagen
      
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

  # Archivos
  def upload_file
    file = params[:file] # archivo enviado desde el formulario
  
    # Ruta relativa donde se guardará el archivo
    relative_path = 'public/uploads'
  
    # Genera la ruta completa
    absolute_path = Rails.root.join(relative_path, file.original_filename)
  
    # Guarda el archivo en la ubicación especificada
    File.open(absolute_path, 'wb') do |f|
      f.write(file.read)
    end
  
    # Obtiene la ruta relativa
    relative_path = File.join('/', relative_path, file.original_filename)

    #render json: relative_path 
    return relative_path

  end
  

end
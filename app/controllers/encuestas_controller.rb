class EncuestasController < ApplicationController
  def create
    usuario = Usuario.find(params[:usuario_id])
    
    @encuesta = usuario.encuestas.build(encuesta_create_params)
    @encuesta.fecha_creacion_encuesta = DateTime.now
    @encuesta.fecha_actualizacion_encuesta = DateTime.now
    @encuesta.link_encuesta = generate_unique_link

    if @encuesta.save
      render json: @encuesta, status: :created
    else
      render json: { error: 'No se pudo crear la encuesta' }, status: :unprocessable_entity
    end
  end

    # def index
    #     usuario = Usuario.find(params[:usuario_id])
    #     @encuestas = usuario.encuestas
    #     render json: @encuestas
    # end

    def index
      current_url = request.fullpath
      if current_user
        puts "-----------------------"
        current_user=current_user
        puts current_url
        puts "--------------------------"

      end
     
      usuario = Usuario.find(params[:usuario_id])
      @encuestas = usuario.encuestas.includes(:personalizacion_encuesta).map do |encuesta|
          encuesta.as_json.merge({ imagen: encuesta.personalizacion_encuesta.imagen })
      end
      render json: @encuestas
     end

    def show
      begin
        Integer(params[:id])
        @encuesta = Encuesta.find(params[:id])
        render json: @encuesta
      rescue ArgumentError
        @encuesta = Encuesta.find_by(link_encuesta: params[:id])
        render json: @encuesta
      end
    end

    def update
      usuario = Usuario.find(params[:usuario_id])
      @encuesta = usuario.encuestas.find_by(pk_encuesta: params[:id])
    
      if @encuesta
        @encuesta.fecha_actualizacion_encuesta = DateTime.now

        if @encuesta.update(encuesta_params)
          render json: @encuesta
        else
          render json: { error: 'No se pudo actualizar la encuesta' }, status: :unprocessable_entity
        end
      else
        render json: { error: 'Encuesta no encontrada' }, status: :not_found
      end
    end

    def destroy
      usuario = Usuario.find(params[:usuario_id])
      @encuesta = usuario.encuestas.find_by(pk_encuesta: params[:id])
  
      if @encuesta
         # Eliminar la PersonalizacionEncuesta asociada, si existe
        @encuesta.personalizacion_encuesta&.destroy
        # Eliminar la Encuesta
        @encuesta.destroy
        render json: { message: 'Encuesta eliminada exitosamente' }
      else
        render json: { error: 'Encuesta no encontrada' }, status: :not_found
      end
    end
    
      
    private

    def encuesta_params
        params.require(:encuesta).permit(:titulo_encuesta, :objetivo_encuesta, :indicacion_encuesta, :estado_encuesta, :fecha_inicio_encuesta, :fecha_finalizacion_encuesta)
    end

    def encuesta_create_params
      params.require(:encuesta).permit(:titulo_encuesta, :objetivo_encuesta, :indicacion_encuesta, :estado_encuesta, :fecha_inicio_encuesta, :fecha_finalizacion_encuesta)
    end

    def generate_unique_link
      SecureRandom.uuid.delete('-')
    end   
     
end
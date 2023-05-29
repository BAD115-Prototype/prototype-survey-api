class EncuestasController < ApplicationController
  def create
    usuario = Usuario.find(params[:usuario_id])
    
    @encuesta = usuario.encuestas.build(encuesta_create_params)
    @encuesta.fecha_creacion_encuesta = DateTime.now
    @encuesta.fecha_actualizacion_encuesta = DateTime.now

    if @encuesta.save
      render json: @encuesta, status: :created
    else
      render json: { error: 'No se pudo crear la encuesta' }, status: :unprocessable_entity
    end
  end

    def index
        usuario = Usuario.find(params[:usuario_id])
        @encuestas = usuario.encuestas
        render json: @encuestas
    end

    def show
        @encuesta = Encuesta.find(params[:id])
        render json: @encuesta
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
        @encuesta.destroy
        render json: { message: 'Encuesta eliminada exitosamente' }
      else
        render json: { error: 'Encuesta no encontrada' }, status: :not_found
      end
    end
    
      
    private

    def encuesta_params
        params.require(:encuesta).permit(:titulo_encuesta, :objetivo_encuesta, :indicacion_encuesta, :link_encuesta, :estado_encuesta, :fecha_inicio_encuesta, :fecha_finalizacion_encuesta)
    end

    def encuesta_create_params
      params.require(:encuesta).permit(:titulo_encuesta, :objetivo_encuesta, :indicacion_encuesta, :link_encuesta, :estado_encuesta, :fecha_inicio_encuesta, :fecha_finalizacion_encuesta)
  end
     
end
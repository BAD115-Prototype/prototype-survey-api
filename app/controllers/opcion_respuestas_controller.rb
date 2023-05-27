class OpcionRespuestasController < ApplicationController
    #include CurrentUserConcern
    before_action :set_opcion_respuesta, only: [:show, :update, :destroy]

    # POST /opcion_respuestas
    def create
      @opcion_respuesta = OpcionRespuesta.new(opcion_respuesta_params)
    
      if @opcion_respuesta.save
        render json: { message: 'Opción de respuesta creada con éxito', data: @opcion_respuesta }, status: :created
      else
        render json: { message: 'Error al crear la opción de respuesta', errors: @opcion_respuesta.errors }, status: :unprocessable_entity
      end
    end

    # GET /opcion_respuestas
    def index
      @opcion_respuestas = OpcionRespuesta.all
      render json: @opcion_respuestas
    end

     # GET /opcion_respuestas/1
    def show
      if @opcion_respuesta
        render json: @opcion_respuesta
      else
        render json: { error: 'Opción de respuesta no encontrada' }, status: :not_found
      end
    end

    # PATCH/PUT /opcion_respuestas/1
    def update
      if @opcion_respuesta.update(opcion_respuesta_params)
        render json: @opcion_respuesta
      else
      render json: @opcion_respuesta.errors, status: :unprocessable_entity
      end
    end

    # DELETE /opcion_respuestas/1
    def destroy
      if @opcion_respuesta.destroy
        render json: { message: 'Opción de respuesta eliminada con éxito' }, status: :ok
      else
        render json: { message: 'Error al eliminar la opción de respuesta' }, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_opcion_respuesta
        @opcion_respuesta = OpcionRespuesta.find_by(pk_opcion_respuesta: params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def opcion_respuesta_params
        params.require(:opcion_respuesta).permit(:texto_opcion, :fk_pregunta_id)
      end
  end
  
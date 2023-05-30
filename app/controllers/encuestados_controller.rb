class EncuestadosController < ApplicationController
    def index
        encuesta = Encuesta.find(params[:encuesta_id])
        encuestados=Encuestado.where(fk_encuesta_id: encuesta.id)
        render json: {
            status: 'Exitoso',
            message: 'Encuestados Cargados',
            data: encuestados
          }, status: :ok
    end
    def create
        begin
            encuesta = Encuesta.find(params[:encuesta_id])
            #Si es un usuario con respuestas incognitas
            if params[:incognito]
                @encuestado=encuesta.encuestados.build(
                    email_encuestado: params["email_encuestado"],
                    nombre_encuestado: params["nombre_encuestado"],
                    apellido_encuestado: params["apellido_encuestado"],
                    fecha_nacimiento: params["fecha_nacimiento"],
                    genero_id: params["genero_id"]
                )
                #Si esta deacuerdo con compartir su información 
            else
                @encuestado=encuesta.encuestados.build(
                    email_encuestado: params["email_encuestado"],
                    genero_id: params["genero_id"]
                )
            end
            if @encuestado.save
                render json: {
                    status: 'Exitoso',
                    message: 'Encuestado Registrado',
                    data: @encuestado
                }, status: :ok
            else
                render json: {
                    status: 'Error',
                    message: 'Verifique sus datos',
                    data: @encuestado.errors
                }, status: :unprocessable_entity
            end
        rescue ActiveRecord::RecordNotUnique => e
            error_message = "Ya ha llenado la encuesta con este email"
            render json: {
                status: 'Error',
                message: 'Verifique sus datos',
                data: error_message
            }, status: :unprocessable_entity
        end
    end
end

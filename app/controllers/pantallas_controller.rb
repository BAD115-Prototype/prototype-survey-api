class PantallasController < ApplicationController
    include CurrentUserConcern
    def index
    pantallas=Pantalla.order('created_at')
    render json: {
        status: 'Exitoso',
        message: 'Pantallas Cargadas',
        data: pantallas
    }, status: :ok
    end
    def show
    pantallas=Pantalla.find(params[:id])
    render json: {
    status: 'Exitoso',
    message: 'Pantallas Cargadas',
    data: pantallas
    }, status: :ok
    end
    def create
    pantalla=Pantalla.new(pantalla_params)
    if pantalla.save
        render json: {
            status: 'Exitoso',
            message: 'Pantallas creada',
            data: pantalla
        }, status: :ok
    else
        render json: {
            status: 'ERROR',
            message: 'Pantallas no creada',
            data: pantalla.errors
        }, status: :unprocessable_entity
    end

    end
    def update
        pantalla=Pantalla.find(params[:id])
        #Se utiliza el metodo update_attributes
        if pantalla.update(pantalla_params)
            render json: {
                status: 'Exitoso',
                message: 'Pantallas Actualizada',
                data: pantalla
            }, status: :ok
        else
            render json: {
                status: 'ERROR',
                message: 'Pantallas no actualizada',
                data: pantalla.errors
            }, status: :unprocessable_entity
        end
    end
    def destroy
        pantalla=Pantalla.find(params[:id])
        if pantalla.destroy
            render json: {
                status: 'Exitoso',
                message: 'Pantallas eliminada',
                data: pantalla
            }, status: :ok
        else
            render json: {
                status: 'ERROR',
                message: 'Pantallas no eliminada',
                data: pantalla.errors
            }, status: :unprocessable_entity
        end
    end
    ##Parametros para el create
    private
    def pantalla_params
        params.permit(:nombre_pantalla, :url_pantalla)
    end
end

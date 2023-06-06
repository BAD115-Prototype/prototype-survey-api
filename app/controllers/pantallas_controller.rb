class PantallasController < ApplicationController
    include CurrentUserConcern
  
    def index
      if (params[:permiso_id] != nil)

        #Obteniendo pantallas por permiso
        permiso = Permiso.find(params[:permiso_id])      
        @pantallas = Permiso.includes(:pantallas).where(pk_permiso: permiso.pk_permiso)
        json_data = @pantallas.as_json(include: :pantallas)
    
          render json: {
          status: 'Exitoso',
          message: 'Pantallas Cargadas',
          data: json_data
          }, status: :ok
        
      else
        #Obteniendo pantallas
        pantallas=Pantalla.order('created_at')
        render json: {
          status: 'Exitoso',
          message: 'Pantallas Cargadas',
          data: pantallas
        }, status: :ok
      end
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
      
      #Creando asignacion de pantallas
      if (params[:permiso_id] != nil)
        permiso = Permiso.find(params[:permiso_id]) 
        pantallasPermiso = Pantalla.includes(:permisos)  
        pantallasAsig=params[:pantallasRight]
        pantallasNoAsig=params[:pantallasLeft]
        @request1=""
        @request2=""
    
        #Asignando pantallas
        pantallasAsig.each do |pantallaA|
          pantallasPermiso.each do |pp|
            if(pp["id"] == pantallaA["id"])  
              if permiso.pantallas.include?(pp)
                @request1 = "Pantallas ya están asignada"
              else    
                permiso.pantallas <<  Pantalla.find(pantallaA["id"])
                @request1 = "Asignadas con exito"   
              end
            end    
          end
        end
    
        #Pantallas no asignados
        pantallasNoAsig.each do |pantallaNA|
          pantallasPermiso.each do |pp|
            if(pp["id"] == pantallaNA["id"])     
              if permiso.pantallas.include?(pp)
                @pant = PermisosPantalla.where("permisos_pantallas.permiso_id = ? AND permisos_pantallas.pantalla_id = ?", params[:permiso_id], pp["id"])
                if PermisosPantalla.destroy(@pant[0]["id"])
                  @request2= "Se revocaron los permisos"
                else
                  @request2= "Error al revocar permisos"
                end
              end
            end    
          end
        end
    
        render json: {
          status: 'Exitoso',
          message: @request1 + @request2,
        }, status: :ok
        
      else
        #Creando nueva pantalla    
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
  
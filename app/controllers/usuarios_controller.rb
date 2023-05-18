class UsuariosController < ApplicationController
    def index
        if session[:user_id]
            render json: {
                logged_in: "Deberia de verse algo solo si esta logeado"
            }
          else
            render json: {
                logged_in: "No hay enfoque de sistemas"
            }
          end
    end
end
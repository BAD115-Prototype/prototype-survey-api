class UsuariosController < ApplicationController
    def index
        @users=Usuario.order('created_at').page(params[:page]).per(10)
        render json: {
            users: @users,
            current_page: @users.current_page,
            total_pages: @users.total_pages,
            total_count: @users.total_count
          }
    end
    def update
        if user

        end
    end
end
class EmailController < ApplicationController
    def send_email
        user = Usuario.find(params[:user_id]) # Obtiene el usuario según el ID pasado en la ruta
        UserMailer.welcome_email(user).deliver_now
        render plain: 'Email sent!'
    end
end

class EmailController < ApplicationController
    def email_bienvenida
        user = Usuario.find(params[:user_id]) # Obtiene el usuario según el ID pasado en la ruta
        UserMailer.welcome_email(user).deliver_now
        render plain: 'Email sent!'
    end

    def email_encuesta
        user = Usuario.find(params[:user_id])
        survey = Encuesta.find(params[:encuesta_id])

        UserMailer.invitation_email(user, survey).deliver_now
        render plain: 'Email sent!'
    end
end

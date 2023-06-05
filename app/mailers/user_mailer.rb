class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to My App')
    end

    def invitation_email(user, survey)
        @user = user
        @survey = survey
        mail(to: @user.email, subject: 'Participa de la encuesta!')
    end
end

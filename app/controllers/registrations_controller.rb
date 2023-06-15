class RegistrationsController < ApplicationController
  def create
    token=SecureRandom.urlsafe_base64(32)
    user = Usuario.create!(
        nombre_usuario: params['user']['nombre'],
        email: params['user']['email'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation'],
        activo: false,
        intentos: 0,
        email_verification_token: token
    )
    user.rol_ids=2 ###Usuario 2 == usuario_normal

    if user
        ##Enviando email
        

        UserMailer.verificar_email(params['user']['email'], params['user']['nombre'], token).deliver_now
        render json: {
            status: :created,
            user: user
        }
    else
        render json: {
            status: 500
        }
    end
  end
  def verify_email
    token = params[:token]
    user = Usuario.find_by(email_verification_token: token)
  
    if user
      # Actualizar el estado de verificación del correo electrónico del usuario
      user.update(activo: true)
      flash[:success] = '¡Tu correo electrónico ha sido verificado correctamente!'
      redirect_to 'https://prototype-survey.web.app/'
    else
      flash[:error] = 'El enlace de verificación no es válido. Por favor, verifica tu correo electrónico nuevamente.'
    end
  end
  
end

class RegistrationsController < ApplicationController
  def create
    user = Usuario.create!(
        nombre_usuario: params['user']['nombre'],
        email: params['user']['email'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation'],
        activo: true,
        intentos: 0
    )

    if user
        session[:user_id]=user.id
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
end

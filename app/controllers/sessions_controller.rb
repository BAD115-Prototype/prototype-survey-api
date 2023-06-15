class SessionsController < ApplicationController
  include CurrentUserConcern
  skip_before_action :authenticate_user!
  def create
    user = Usuario
            .find_by(email: params["user"]["email"])
            .try(:authenticate, params["user"]["password"])
    
    if user  && user.authenticate(params["user"]["password"])

      #restablecer el contador de intentos fallidos
      user.update(intentos: 0)

      if (user.activo)
        session[:user_id] = user.id
        render json: {
          status: :created,
          logged_in: true,
          user: user
      }
      else
        render json: { status: 401, message: "Usuario no activado" }
      end
    else
      # Incrementar el contador de intentos fallidos
      incrementar_intentos_fallidos(params["user"]["email"])
      # Verificar si el usuario ha alcanzado el límite de intentos fallidos (3 intentos)
        if intentos_fallidos_excedidos?(params["user"]["email"])
          render json: { status: 401, message: "Has excedido el límite de intentos fallidos. Tu cuenta ha sido bloqueada. Por favor, contacta al administrador." }
        else
          render json: { status: 401, message: "Credenciales incorrectas" }
        end
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end

  private

  def intentos_fallidos_excedidos?(email)
    user = Usuario.find_by(email: email)
    return false unless user

    intentos_actuales = user.intentos || 0
    intentos_actuales >= 3
  end

  def incrementar_intentos_fallidos(email)
    user = Usuario.find_by(email: email)
    return unless user

    intentos_actuales = user.intentos || 0
    user.update(intentos: intentos_actuales + 1)
  end
end

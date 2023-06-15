class EmailController < ApplicationController
    def send_email
        UserMailer.verificar_email('ronaldo1103mtz@gmail.com', 'ronal', 'dsgvhbjds').deliver_now
        render json: {
            status: 'Exitoso',
            message: '',
          }, status: :ok
    end
end
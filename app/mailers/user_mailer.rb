class UserMailer < ApplicationMailer
    default from: ENV['MAIL']

  def verificar_email(destinatario, nombre, token)
    @destinatario = destinatario
    @nombre=nombre
    @token=token
    mail(to: @destinatario, subject: 'Verificar Email')
  end
end

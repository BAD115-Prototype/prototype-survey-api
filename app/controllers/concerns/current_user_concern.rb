module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    before_action :authenticate_user!
  end

  def authenticate_user!
    head :unauthorized unless current_user
  end

  def current_user
    if session[:user_id]
      user = Usuario.includes(rols: { permisos: :pantallas }).find(session[:user_id])
      @current_user = user.as_json(include: { rols: { include: { permisos: { include: :pantallas } } } })
      #@current_user = user.as_json(include: { rols: { permisos: { include: { pantallas: {} } } } }, except: [:rols])
      #@current_user = Usuario.find(session[:user_id])
    end
  end
end

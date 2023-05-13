module CurrenteUserConcern
  extend ActiveSupport::Concern

  include do
    before_action :set_current_user
  end

  def set_current_user
    if session[:user_id]
      @current_user = Usuario.find(session[:user_id])
    end
  end
end

class ApplicationController < ActionController::Base
  helper_method  :current_user, :is_login?
  
  private
  def current_user
    User.find_by(id: session[:user])
  end

  def is_login?
    redirect_to welcome_path , notice: t('navbar.please-log-in') unless current_user
  end
end

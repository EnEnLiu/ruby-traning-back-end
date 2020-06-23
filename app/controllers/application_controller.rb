class ApplicationController < ActionController::Base
  helper_method  :current_user, :is_login?

  private

  def current_user
    User.find_by(id: session[:user])
  end

  def is_login?
    redirect_to root_path, notice: '請登入' unless current_user
  end
end

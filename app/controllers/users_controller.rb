class UsersController < ApplicationController
  layout false
  
  def index
    @user  = User.new  
  end

  def new
    @user  = User.new
  end

  def sign_in
    user = User.find_by(email: user_params[:email])
    
    if user
      session[:user] = user.id
      redirect_to root_path, notice: t('users.successful-log-in')
    else
      redirect_to user_path, notice: t('users.fail-log-in')
    end  
  end

  def sign_up
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: t('users.successful-sign-up')
    else
      render :new
    end
  end

  def log_out
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

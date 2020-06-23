class UsersController < ApplicationController
  # layout false
  
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
      redirect_to root_path, notice: '成功'
    else
      redirect_to user_path, notice: '失敗'
    end  
  end

  def sign_up
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: '成功註冊'
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

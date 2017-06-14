class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to sessions_index_path
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end

class SessionsController < ApplicationController
  before_action :require_login, only: [:index]

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to sessions_index_path
    else
      render 'new'
    end
  end

  def index
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end



end

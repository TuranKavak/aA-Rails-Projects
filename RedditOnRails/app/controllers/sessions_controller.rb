class SessionsController < ApplicationController
  before_action :require_signed_out!, only: [:new, :create]
  before_action :require_signed_in!, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    credentials = [user_params[:username], user_params[:password]]
    @user = User.find_by_credentials(*credentials)
    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ['Invalid credentials.']
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

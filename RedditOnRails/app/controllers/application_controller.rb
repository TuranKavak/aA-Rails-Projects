class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  
  # def current_user_id
  #   current_user ? current_user.author_id : nil
  # end

  # def current_user_name
  #   current_user ? current_user.username : nil
  # end

  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def log_out!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def signed_in?
    !!current_user
  end

  # Before filters

  # def require_current_user!
  #   redirect_to new_user_url unless current_user
  # end

  # def require_no_current_user!
  #   redirect_to root_url if current_user
  # end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

  def require_signed_out!
    redirect_to user_url(current_user) if signed_in?
  end
end

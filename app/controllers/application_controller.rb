class ApplicationController < ActionController::Base
  
  helper_method :sign_in, :sign_out, :signed_in?, :current_user, :require_signed_in, :redirect_to_posts
  
  def sign_in(user)
    @current_user = user
    session[:token] = @current_user.reset_token!
  end
  
  def sign_out
    current_user.reset_token!
    session[:token] = nil
  end
  
  def signed_in?
    !!current_user
  end
  
  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_token(session[:token])
  end
  
  def require_signed_in
    redirect_to new_session_url unless signed_in?
  end
  
  def redirect_to_posts
    redirect_to new_session_url if signed_in?
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end

  def require_user
    if !current_user
      access_deny("Please Log in!")
      session[:page_before_redirected] = request.url
      redirect_to login_path
    end
  end

  def admin?
    true if current_user && current_user.role == 1  
  end

  def require_admin
    if !current_user || current_user.role != 1
      access_deny("You are not allowed to do this!")
      redirect_to root_path
    end
  end

  def access_deny(msg)
    flash['error'] = msg

  end
end

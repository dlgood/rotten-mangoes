class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def restrict_admin
    redirect_to movies_path unless current_user && current_user.admin 
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_current_user_id(user_id)
    session[:user_id] = user_id
    @current_user = nil
  end

  def admin_user
    @admin_user ||= User.find_by(:id => session[:admin_id])
  end

  def set_admin_user_id(admin_user_id)
    session[:admin_id] = admin_user_id
    @admin_user = nil
  end

  def admin_user?
    !admin_user.nil?
  end

  helper_method :current_user
  helper_method :admin_user?

end
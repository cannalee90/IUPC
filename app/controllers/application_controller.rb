class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :error, :success, :alert, :notice
  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this resource!"
      redirect_to root_path
    end
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, :if => :devise_controller?

  private

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end

  #def current_admin_user
  #  redirect_to items_path if user_signed_in? && !current_user.is_admin?
  #end
  #def authenticate_admin_user!
   # redirect_to new_user_session_path unless current_user.try(:is_admin?)
  #end
end

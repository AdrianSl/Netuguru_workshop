class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :firstname, :lastname, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :firstname, :lastname, :password, :password_confirmation, :current_password) }
  end

  private

  # Confirms a logged-in user.
  def logged_in_user
    unless user_signed_in?
    #  flash[:alert] = "Please log in."
      redirect_to new_user_session_path
    end
  end


end


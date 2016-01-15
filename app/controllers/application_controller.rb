class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.type == "Artist"
      artist_path(resource)
    else
      fan_path(resource)
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :bio, :city, :country, :email, :password, :password_confirmation, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :bio, :city, :country, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end
end
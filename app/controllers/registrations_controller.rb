class RegistrationsController < Devise::RegistrationsController
  
  protected
  def after_sign_up_path_for(resource)

    if resource.type == "Artist"
      artist_path(resource)
    else
      fan_path(resource)
    end
  end
end
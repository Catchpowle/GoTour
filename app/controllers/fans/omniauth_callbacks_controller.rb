class Fans::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
  
    binding.pry
    @fan = Fan.from_omniauth(request.env["omniauth.auth"])

    if @fan.persisted?
      sign_in_and_redirect @fan, :event => :authentication #this will throw if @fan is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
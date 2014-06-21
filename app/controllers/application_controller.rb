class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  CLIENT_ID='673385773310.apps.googleusercontent.com'
  CLIENT_SECRET='YT6S5O89Ie4HI9zx1Vb0-z-T'
  CLIENT_SCOPE = 	'https://www.googleapis.com/auth/userinfo.profile 
  								https://www.googleapis.com/auth/userinfo.email'

  include GoogleHelper

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

end

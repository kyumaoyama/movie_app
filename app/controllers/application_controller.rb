class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configre_permitted_parameters, if: :devise_controller?
  before_action :basic_auth


 
  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:name,:avatar])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
end

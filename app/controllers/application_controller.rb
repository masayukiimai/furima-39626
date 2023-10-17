

class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
 


  protected

  def after_sign_out_path_for(resource_or_scope)
    "/items"  # itemsのインデックスページのURL
  end
  

  private
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  #
      username == 'aun' && password == '1126'
    end
  end
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname]) #{ |u| u.permit(:name, :surname, :email, :password, :username, :first_name, :last_name ,:age) }
    devise_parameter_sanitizer.permit(:account_update) { |u|   u.permit(:name, :surname, :password, :current_password, :email) }
  end
  private

  def layout
    # only turn it off for login pages:
    is_a?(Devise::SessionsController) ? false : "application"
    # or turn layout off for every devise controller:
    !devise_controller? && "application"
  end


end

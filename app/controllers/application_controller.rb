class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :address, :postcode, :city, :title, :sort_code, :account_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:title, :first_name, :last_name, :phone_number, :address, :postcode, :city, :sort_code, :account_number, :home_station, :work_station])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end

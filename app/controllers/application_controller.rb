class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?

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

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
end

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Serialization
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_default_response_format
  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  protected

  def set_locale
    I18n.locale = request.headers['locale'] || params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :phone_number, :account_type]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :phone_number, :zip_code, :country, :nickname, :account_type]
  end

  def set_default_response_format
    request.format = :json
  end

  def unauthorized
    render json: {errors: 'You do not have the correct permissions for this action'}, status: 401
  end

  def include_params
    params[:include].present? ? params[:include].split(',').map { |x| x if verified_relations.include?(x) } : nil
  end

  def json_response(resource, options={})
    render({json: resource, include: include_params}.merge(options))
  end

  def verified_relations
    %w()
  end
end

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Serialization
  include Pundit

  before_action :set_default_response_format

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized


  protected

  def set_default_response_format
    request.format = :json
  end

  def unauthorized
    render json: {errors: 'unauthorized'}, status: 401
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

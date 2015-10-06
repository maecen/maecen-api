class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Serialization
  include Pundit

  before_action :set_default_response_format

  protected

  def set_default_response_format
    request.format = :json
  end
end

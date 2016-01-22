class V1::BaseController < ApplicationController
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  resource_description do
    #api_version '1.0'
  end
end
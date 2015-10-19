require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before do
      @resource = create :user

      @auth_headers = @resource.create_new_auth_token

      sign_in @resource
    end

    it 'index' do
      get :index, {}, @auth_headers
      expect(response).to have_http_status(:success)
    end

    it 'show' do
      get :show, {id:@resource.id}, @auth_headers
      expect(response).to have_http_status(:success)
    end

end

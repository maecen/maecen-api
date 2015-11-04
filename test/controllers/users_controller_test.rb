require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  describe "Token access" do
    before do
      @resource = users(:confirmed_email_user)
      @resource.skip_confirmation!
      @resource.save!

      @auth_headers = @resource.create_new_auth_token

      @token     = @auth_headers['access-token']
      @client_id = @auth_headers['client']
      @expiry    = @auth_headers['expiry']
    end

    describe 'successful request' do
      before do
        # ensure that request is not treated as batch request
        age_token(@resource, @client_id)

        get '/demo/members_only', {}, @auth_headers

        @resp_token       = response.headers['access-token']
        @resp_client_id   = response.headers['client']
        @resp_expiry      = response.headers['expiry']
        @resp_uid         = response.headers['uid']
      end
    end
    describe 'devise mappings' do
      it 'should define current_user' do
        assert_equal @resource, @controller.current_user
      end
    end
  end
end

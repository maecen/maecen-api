# require 'rails_helper'
#
# # testing is a mess right now
#
# RSpec.describe V1::SubscriptionsController, type: :controller do
#
#   let(:valid_session) { {} }
#   let(:stripe_helper) { StripeMock.create_test_helper}
#
#   #before { StripeMock.start_client }
#   #after  { StripeMock.stop_client  }
#
#   before :each do
#     @project = create :project
#     @user = build :user
#     customer = Stripe::Customer.create(email: @user.email)
#     @user.update_attributes stripe_id: customer.id
#
#     sign_in @user
#   end
#
#   describe "POST #create" do
#     it "returns http success" do
#       expect {
#         post :create, {project_id: @project.id, plan_id: 'plan1'}, valid_session
#       }.to change(Subscription, :count).by(1)
#     end
#   end
#
# end

class V1::SubscriptionsController < V1::BaseController
  before_action :authenticate_user!

  def create
    @subscription = current_user.subscriptions.new(project_id: params[:project_id])

    if @subscription.save
      json_response @subscription, status: :created
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end
end

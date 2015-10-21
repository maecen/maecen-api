class V1::SubscriptionsController < V1::BaseController
  before_action :authenticate_user!

  def create
    @subscription = current_user.subscriptions.create(project_id: params[:project_id])

    json_response @subscription
  end
end

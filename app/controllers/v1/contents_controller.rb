class V1::ContentsController < V1::BaseController
  before_action :authenticate_user!
  before_action :set_variables, only: [:show, :update, :destroy]

  def index
    amount = Subscription.where(project_id: params[:project_id], user_id: current_user.id).first.amount
    p amount
    @contents = Content.where("project_id = ? and cost <= ?", params[:project_id], amount)

    render json: @contents
  end

  def show
    render json: @content
  end

  def create
    @content = Content.new(content_params)

    if @content.save
      render json: @content, status: :created, location: @content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end


  def update
    @content = Content.find(params[:id])

    if @content.update(content_params)
      head :no_content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @content.destroy

    head :no_content
  end

  private

    def set_variables
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :project_id, :cost)
    end
end

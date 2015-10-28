class V1::ContentsController < V1::BaseController
  before_action :authenticate_user!
  before_action :set_variables, only: [:show, :update, :destroy]

  after_action :verify_authorized, :except => :index

  def index
    @contents = current_user.subscriptions.find_by_project_id(params[:project_id]).try(:available_contents)

    json_response @contents
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

class V1::ProjectsController < V1::BaseController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :update, :destroy]

  def_param_group :project do
    param :project, Hash, action_aware:true do
      param :title, String, required:true
      param :description, String, required:true
      param :cost, Integer, required:true
      param :category, Project.valid_categories, required:true
    end
  end

  api! 'Index all projects'
  def index
    @projects = Project.all

    json_response @projects
  end

  api! 'Show specific project'
  param :include, %w(creatives subscribers), desc:'Names of relations to include, separated by a comma.'
  def show
    json_response @project
  end

  api! 'Create a project'
  param_group :project
  def create
    @project = Project.new(project_params)

    authorize @project

    if @project.save
      json_response @project, status: :created, location: v1_project_url(@project)
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  api! 'Update a project'
  param_group :project
  def update
    authorize @project

    if @project.update(project_params)
      head :no_content
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  api! 'Destroy a project'
  def destroy
    authorize @project

    @project.destroy

    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :cost, :category)
  end

  #overrides from ApplicationController
  def verified_relations
    %w(creatives subscribers)
  end
end

class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all

    json_response @projects
  end

  def show
    json_response @project
  end

  def create
    @project = Project.new(project_params)

    authorize @project

    if @project.save
      json_response @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @project

    if @project.update(project_params)
      head :no_content
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

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
    params.require(:project).permit(:title, :description, :cost)
  end

  def verified_relations
    %w(creatives subscribers)
  end
end

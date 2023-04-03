class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update destroy]
  before_action :authorized, only: %i[create update destroy my_projects]
  before_action :verify_owner, only: %i[update destroy]

  # GET /api/v1/projects
  def index
    @projects = Project.all
  end

  # GET /api/v1/projects/1
  def show
    render :show
  end

  # POST /api/v1/projects
  def create
    @project = Project.new(project_params)
    @project.user = logged_in_user

    if @project.save
      render :show, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/projects/1
  def update
    if @project.update(project_params)
      render :show
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/projects/1
  def destroy
    render json: {message: 'Deleted'} if @project.destroy
  end

  def my_projects
    @projects = logged_in_user.projects.all

    render :index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.permit(:title, :description, :type, :location, :user_id, :thumbnail)
  end

  def verify_owner
    unless logged_in_user == @project.user
      render json: {message: 'You are not authorized to access this project'},
             status: :unauthorized
    end
  end
end

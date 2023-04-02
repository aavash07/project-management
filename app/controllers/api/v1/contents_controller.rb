class Api::V1::ContentsController < ApplicationController
  before_action :set_content, only: %i[show update destroy]
  before_action :set_project, only: %i[index show create]
  before_action :set_project_by_content, only: %i[update destroy]
  before_action :authorized, only: %i[create update destroy]
  before_action :verify_owner, only: %i[create update destroy]

  # GET /api/v1/contents
  def index
    @contents = @project.contents.all
  end

  # GET /api/v1/contents/1
  def show
    render :show
  end

  # POST /api/v1/contents
  def create
    @content = @project.contents.new(content_params)

    if @content.save
      render :show
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/contents/1
  def update
    if @content.update(content_params)
      render :show
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/contents/1
  def destroy
    render json: {message: 'Deleted'} if @content.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_content
    @content = Content.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_project_by_content
    @project = @content.project
  end

  # Only allow a list of trusted parameters through.
  def content_params
    params.permit(:title, :body, :project_id)
  end

  def verify_owner
    unless logged_in_user == @project.user
      render json: {message: 'You are not authorized to access this project'},
             status: :unauthorized
    end
  end
end

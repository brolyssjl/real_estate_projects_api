class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.where(enabled: true)
    render json: @projects, status: :ok
  end

  def show
    render json: @project, status: :ok
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created
    else
      render json: { message: 'couldn\'t create project', error: @project.errors }, status: :unprocessable_entity
    end
  end

  def update
    @project.update(project_params)
    if @project.save
      render json: @project, status: :ok
    else
      render json: { message: 'couldn\'t update project', error: @project.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy

    render json: { message: "project #{@project.name} successfully deleted" }, status: :ok
  end

  private

  def project_params
    params.require(:project).permit(
      :name, :country, :city, :neighborhood,
      :address, :phone, :description, :stratum,
      :sales_room_address, :sales_room_phone, :sales_room_email,
      :estimated_start_date, :estimated_end_date
    )
  end

  def set_project
    @project = Project.find(params[:id])
  end
end

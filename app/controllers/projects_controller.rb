class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    Project.where(enabled: true)
  end

  def show
    @project
  end

  private

  def project_params
    params.require(:project).permit(
      :name, :country, :city, :neighborhood, :address,
      :phone, :description, :stratum, :enabled,
      :sales_room_address, :sales_room_phone, :sales_room_email,
      :estimated_start_date, :estimated_end_date
    )
  end

  def set_project
    @project = Project.find(params[:id])
  end
end

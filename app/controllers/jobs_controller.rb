class JobsController < ApplicationController


  def new
    @job = Job.new
  end

  def create

  end

  private
  def job_params
    params.require(:job).permit(:title, :location, :description, :level, :salary, :organization_id)
  end
end

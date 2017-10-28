class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end
  def new
    @job = Job.new
  end

  def create
    @org = current_organization
    @job = @org.jobs.build(job_params)
    @job.save
    redirect_to job_path(@job)
  end

  def show
    @job = Job.find(params[:id])
    @org = @job.organization
  
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  private
  def job_params
    params.require(:job).permit(:title, :location, :description, :level, :salary, :organization_id)
  end
end

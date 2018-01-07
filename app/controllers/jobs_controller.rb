class JobsController < ApplicationController

  def index
    if params[:organization_id]
      @jobs = Job.find(params(:organization_id)).jobs
    else
    @jobs = Job.all
   end
  end

  def new
    #binding.pry
    @org = Organization.find(params[:organization_id])
    @job = @org.jobs.build
  end

  def create
    binding.pry
    @org = Organization.find(params[:organization_id])
    @job = @org.jobs.build(job_params)
    @job.save
    redirect_to organization_jobs_path(@org)
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

  def apply
    if current_user
      @job = Job.find(params[:id])
      current_user.jobs_applied << @job
      current_user.save
      redirect_to current_user
    else
      session[:viewed_job] = params[:id]
      redirect_to new_user_session_path
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :location, :description, :level, :salary, :organization_id)
  end
end

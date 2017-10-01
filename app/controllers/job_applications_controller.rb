class JobApplicationsController < ApplicationController

  def new
    @job_application = JobApplication.new
  end

  def create
   binding.pry
   @job_application = JobApplication.create(job_application_params)
   @user = current_user
   @user.job_application = @job_application
   @user.save
   redirect_to user_path(@user)
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end

  def edit
    @job_application = current_user.job_application
  end

  def update
    @user = current_user
    @job_application = JobApplication.update(job_application_params)
binding.pry
    redirect_to user_path(@user)
  end

  private
    def job_application_params
      params.require(:job_application).permit(:first_name, :last_name, :middle_name, :address, :city, :state, :zip_code, :phone)
    end
end

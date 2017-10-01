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
   redirect_to 'job_application_path(@job_application)'
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end

  private
    def job_application_params
      params.require(:job_application).permit(:first_name, :last_name, :middle_name, :adddress, :city, :state, :zip_code, :phone)
    end
end

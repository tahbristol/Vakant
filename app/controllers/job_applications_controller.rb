class JobApplicationsController < ApplicationController

  def new
    @job_application = JobApplication.new


  end

  def create


   @user = current_user

   @user.build_job_application(job_application_params)
   binding.pry
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

    redirect_to user_path(@user)
  end

  private
    def job_application_params
      params.require(:job_application).permit(:profile_attributes => [] )
    end
end

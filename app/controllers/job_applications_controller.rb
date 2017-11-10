class JobApplicationsController < ApplicationController

  def new
    @job_application = JobApplication.new
    @profile = @job_application.build_profile

  end

  def create
    @user = current_user
    if @user.job_application.present?
     @job_application = @user.job_application.update(job_application_params)
    else
     @job_application = JobApplication.create(job_application_params)
    end

    @user.save
    redirect_to user_path(current_user)
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end

  def edit
    @job_application = current_user.job_application
    @profile = @job_application.profile
  end

  def update

     current_user.job_application.update(job_application_params)
     redirect_to user_path(current_user)
  end

  private
    def job_application_params
      params.require(:job_application).permit(:profile_attributes => [:user_photo, :first_name, :middle_name, :last_name, :phone, :alternate_phone])
    end


end

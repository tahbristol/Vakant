class UsersController < ApplicationController

  def index
    if params[:job_id]
      @job = Job.find(params[:job_id])
      @users = Job.find(params[:job_id]).users
    else
    @users = User.all
  end

  end


  def new
			render layout: false
  end

  def create

    if @user.save
      redirect_to @user
    end
  end

  def show
    @user = User.find(params[:id])
    @job_application_profile = Profile.new
    @profile = @user.job_application.profile unless @user.job_application.nil?
    @jobs_applied = @user.jobs_applied

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    @user.update(user_params)
    redirect_to user_path(@user)
  end

private

  def user_params
    params.require(:user).permit(:user_photo, :job_application_attributes => [:first_name, :middle_name, :last_name, :address, :city, :state, :zip_code, :phone])
  end
end

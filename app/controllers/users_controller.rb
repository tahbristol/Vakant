class UsersController < ApplicationController

  def index
    binding.pry
    if params[:job_id]
      @users = Job.find(params[:job_id]).users
    else
    @users = User.all
  end
  binding.pry
  end


  def new

  end

  def create
  #  binding.pry
    if @user.save
      redirect_to @user
    end
  end

  def show
  #  binding.pry
    @user = User.find(params[:id])
    @job_app = @user.job_application
    #binding.pry
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
    params.require(:user).permit(:user_photo)
  end
end

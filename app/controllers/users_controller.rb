class UsersController < ApplicationController

  def index

    @users = User.all
  end


  def new

  end

  def create
    binding.pry
    if @user.save
      redirect_to @user
    end
  end

  def show
    @user = User.find(params[:id])
  end
end

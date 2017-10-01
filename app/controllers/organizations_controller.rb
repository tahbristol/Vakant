class OrganizationsController < ApplicationController

  def index
  end

  def show
    @org = Organization.find(params[:id])
  end


end

class OrganizationsController < ApplicationController

  def index
  end

  def show
    @org = Organization.find(params[:id])
  end

  def jobs
    @jobs = current_organization.jobs
    
  end


end

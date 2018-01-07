class OrganizationsController < ApplicationController

  def index
  end

  def show
    @org = Organization.find(params[:id])
    @org_profile = @org.org_profile
    #binding.pry
  end

  def jobs
    @org = current_organization
    #binding.pry
    @jobs = current_organization.jobs
  end

  def edit
    @org = Organization.find(params[:id])
  end

  def update
    @org = Organization.find(params[:id])
    @org.update(org_params)
    redirect_to organization_path(@org)
  end

  private

  def org_params
    params.require(:organization).permit(:name, :location, :email)
  end

end

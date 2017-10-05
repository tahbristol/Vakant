class OrganizationsController < ApplicationController

  def index
  end

  def show
    @org = Organization.find(params[:id])
  end

  def jobs
    @org = current_organization
    @jobs = current_organization.jobs
  end

  def edit
    @org = Org.find(params[:id])
  end

  def update
    @org = Org.find(params[:id])
    @org.update(org_params)
  end

  private

  def org_params
    require.params(:organization).permit(:name, :location, :email)
  end

end

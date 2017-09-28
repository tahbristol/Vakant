class OrganizationsController < ApplicationController

  def new
    @org = Organization.new
  end

  def create
    @org = Organization.create(org_params)
    redirect_to organization_path(@org)
  end

  def show
    @org = Organization.find(params[:id])
  end

  private
    def org_params
      params.require(:organization).permit(:name, :location)
    end
end

class OrganizationsController < ApplicationController
	def index
	
	end
	
	def show
		@org = Organization.find(params[:id])
		@org_profile = @org.org_profile
	end
	
	def jobs
		@org = current_organization
		@jobs = current_organization.jobs
		@job = Job.new
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

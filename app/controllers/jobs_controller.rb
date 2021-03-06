class JobsController < ApplicationController
	
	def index
		if params[:organization_id]
			@jobs =  Job.find(params(:organization_id)).jobs
		else
			@jobs = Job.all
		end
	end

	def new
		@org = Organization.find(params[:organization_id])
		@job = @org.jobs.build
	end

	def create
		@org = Organization.find(params[:organization_id])
		@job = @org.jobs.build(job_params)
		@job.save
		respond_to do |format|
			format.json { render json: {job: @job, org: @org}}
			format.html
		end
	end

	def show
		@job = Job.find(params[:id])
		@org = @job.organization
		respond_to do |format|
			format.json { render json: {job: @job, org: @org} }
			format.html
		end
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		@job.update(job_params)
		redirect_to job_path(@job)
	end

	def destroy
		@org = Organization.find(params[:organization_id])
		@job = Job.find(params[:id])
		@job.destroy
		render json: @org
	end

	def apply
		if current_user && !has_applied?(current_user, params[:id].to_i)
			@job = Job.find(params[:id])
			current_user.jobs_applied << @job
			current_user.save
			redirect_to current_user
		elsif current_user && has_applied?(current_user, params[:id].to_i)
			flash[:alert] = "You have already applied to this position."
			redirect_to jobs_path
		else
			session[:viewed_job] = params[:id]
			redirect_to new_user_session_path
		end
	end

	private

	def has_applied?(user, job)
		user.jobs_applied_ids.include?(job.to_i)
	end
	
	def job_params
		params.require(:job).permit(:title, :location, :description, :level, :salary, :organization_id)
	end
end

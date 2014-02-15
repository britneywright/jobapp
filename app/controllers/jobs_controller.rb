class JobsController < ApplicationController
	before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

	def index
		@user = User.find(params[:user_id]) 
		@jobs = current_user.jobs
	end

	def create
		@job = current_user.jobs.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
	end

	def new
		@user = User.find(params[:user_id])
		@job = @user.jobs.new
	end	

	def edit
	end
		
	def show
	end

	def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }      	
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
	end
	
	def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user) }
      format.json { head :no_content }
    end		
	end	

	private
	  def set_job
	  	@job = Job.find(params[:id])
	  end	

	def job_params
		params.require(:job).permit(:position, :company, :date_applied, :link, :description, :notes, :user_id)
	end	
end
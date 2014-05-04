class ApplicationsController < ApplicationController
	before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

	def index
		@user = User.find(params[:user_id]) 
		@applications = current_user.applications.order(date_applied: :desc)
	end

	def create
		@application = current_user.applications.new(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render action: 'show', status: :created, location: @application }
      else
        format.html { render action: 'new' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
	end

	def new
		@user = User.find(params[:user_id])
		@application = @user.applications.new
	end	

	def edit
	end
		
	def show
	end

	def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }      	
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
	end
	
	def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user) }
      format.json { head :no_content }
    end
    redirect_to @user, notice: "Application Deleted"		
	end	

	private
	  def set_application
	  	@application = Application.find(params[:id])
	  end	

	def application_params
		params.require(:application).permit(:position, :company, :date_applied, :link, :description, :notes, :contact_name, :contact_address, :contact_phone, :contact_email, :user_id)
	end	
end
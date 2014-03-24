class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index 
    @interviews = current_user.interviews
    @interviews_by_date = @interviews.group_by(&:date_interviewed) 
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def create
    @application = Application.find(params[:application_id])
    @interview = @application.interviews.new(interview_params)

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
        format.json { render action: 'show', status: :created, location: @interview }
      else
        format.html { render action: 'new' }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
      @application = Application.find(params[:application_id])
      if current_user == @application.user  
      @interview = @application.interviews.new
    else
      redirect_to "/"
    end 
  end 

  def edit
  end
    
  def show  
  end

  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to interviews_url(current_user) }
      format.json { head :no_content }
    end   
  end 

  private
    def set_interview
      @interview = Interview.find(params[:id])
    end 

  def interview_params
    params.require(:interview).permit(:date_interviewed, :kind, :notes, :interview_time, :application_id, :user_id)
  end 
end
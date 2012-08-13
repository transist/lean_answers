class ScorecardsController < ApplicationController
  before_filter :lookup_project
  def index
    if params[:project_id]
      @scorecards = @project.scorecards
    else
      @scorecards = Scorecard.all
    end
  end
  
  def new
    @scorecard = @project.scorecards.build
  end  
  
  def show
    @scorecard = Scorecard.find(params[:id])
  end
  
  def edit
    @scorecard = Scorecard.find(params[:id])
  end
  
  def create  
    @scorecard = Scorecard.create(params[:scorecard])
    @project.scorecards << @scorecard
    @scorecard.make_current
    redirect_to @project, :notice => "Created!"  
  end
  
  def update
    @scorecard = Scorecard.find(params[:id])
    @scorecard.update_attributes(params[:scorecard])
    @scorecard.accept if params[:scorecard]['state'] == 'accepted'
    @scorecard.reject if params[:scorecard]['state'] == 'rejected'
    # @scorecard.make_current if params[:scorecard]['state'] == 'current'
    @scorecard.na if params[:scorecard]['state'] == 'not_applicable'
    redirect_to @project, :notice => "Updated!"  
  end
  
  def destroy
    @scorecard = Scorecard.find(params[:id])
    @scorecard.destroy
    redirect_to project_path(@project), :notice => "Destroyed!"  
  end
  
  private
  
  def lookup_project
    @project = Project.find(params[:project_id])
  end
end

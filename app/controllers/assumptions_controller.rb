class AssumptionsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :assumption, :through => :project

  def index
    if params[:project_id]
      @project = Project.find(params[:project_id])
      @assumptions = @project.assumptions
    else
      @assumptions = Assumption.all
    end
  end
  
  def new
    @project = Project.find(params[:project_id])
    @assumption = @project.assumptions.build
  end  
  
  def show
    @project = Project.find(params[:project_id])
    @assumption = Assumption.find(params[:id])
  end
  
  def edit  
    @project = Project.find(params[:project_id])
    @assumption = Assumption.find(params[:id])
  end
  
  def create  
    @project = Project.find(params[:project_id])
    # @assumption = @project.assumptions.build
    @assumption = Assumption.create(params[:assumption])
    @project.assumptions << @assumption
    @assumption.make_current
    redirect_to @project, :notice => "Created!"  
  end
  
  def update
    @project = Project.find(params[:project_id])
    @assumption = Assumption.find(params[:id])
    @assumption.update_attributes(params[:assumption])
    @assumption.accept if params[:assumption]['state'] == 'accepted'
    @assumption.reject if params[:assumption]['state'] == 'rejected'
    # @assumption.make_current if params[:assumption]['state'] == 'current'
    @assumption.na if params[:assumption]['state'] == 'not_applicable'
    redirect_to @project, :notice => "Updated!"  
  end
  
  def destroy
    @assumption = Assumption.find(params[:id])
    @assumption.destroy
    redirect_to project_path(params[:project_id]), :notice => "Destroyed!"  
  end
end

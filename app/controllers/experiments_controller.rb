class ExperimentsController < ApplicationController
  before_filter :load_project
  def index
    if @project
      @experiments = @project.experiments
    else
      @experiments = Experiment.all
    end
  end
  
  def new
    @experiment = @project.experiments.build
  end  
  
  def show
    @experiment = Experiment.find(params[:id])
  end
  
  def edit  
    @experiment = Experiment.find(params[:id])
  end
  
  def create  
    @experiment = Experiment.create(params[:experiment])
    @project.experiments << @experiment
    @experiment.make_current
    redirect_to @project, :notice => "Created!"  
  end
  
  def update
    @experiment = Experiment.find(params[:id])
    @experiment.update_attributes(params[:experiment])
    @experiment.accept if params[:experiment]['state'] == 'accepted'
    @experiment.reject if params[:experiment]['state'] == 'rejected'
    # @experiment.make_current if params[:experiment]['state'] == 'current'
    @experiment.na if params[:experiment]['state'] == 'not_applicable'
    redirect_to @project, :notice => "Updated!"  
  end
  
  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy
    redirect_to project_path(params[:project_id]), :notice => "Destroyed!"  
  end
  
  def load_project
    @project = Project.find(params[:project_id]) if params[:project_id]
  end
end

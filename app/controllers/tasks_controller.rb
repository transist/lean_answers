class TasksController < ApplicationController
  before_filter :lookup_project
  def index
    if params[:project_id]
      @tasks = @project.tasks
    else
      @tasks = Task.all
    end
  end
  
  def new
    @task = @project.tasks.build
  end  
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def create  
    @task = Task.create(params[:task])
    @project.tasks << @task
    @task.make_current
    redirect_to @project, :notice => "Created!"  
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    @task.accept if params[:task]['state'] == 'accepted'
    @task.reject if params[:task]['state'] == 'rejected'
    @task.na if params[:task]['state'] == 'not_applicable'
    redirect_to @project, :notice => "Updated!"  
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path(@project), :notice => "Destroyed!"  
  end
  
  private
  
  def lookup_project
    @project = Project.find(params[:project_id])
  end
end

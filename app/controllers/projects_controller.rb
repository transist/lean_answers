class ProjectsController < ApplicationController
  def index
    @projects = current_users_projects
  end
  
  def new  
    @project = Project.new
  end  
  
  def show  
    @project = Project.find(params[:id])
    @pane = false
  end
  
  def edit  
    @project = Project.find(params[:id])
  end
  
  def create  
    @project = Project.create(params[:project])
    Membership.create(:user_id => current_user.id, :project_id => @project.id, :membership_type => 'Owner')
    redirect_to @project, :notice => "Created!"  
  end
  
  def update  
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    redirect_to @project, :notice => "Updated!"  
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, :notice => "Destroyed!"  
  end
end

class ProjectsController < ApplicationController
  def index
    @projects = current_users_projects
  end
  
  def new  
  end  
  
  def show
    @pane = false
  end
  
  def edit  
  end
  
  def create  
    @project = Project.create(params[:project])
    Membership.create(:user_id => current_user.id, :project_id => @project.id, :membership_type => 'Owner')
    redirect_to @project, :notice => "Created!"  
  end
  
  def update
    @project.update_attributes(params[:project])
    redirect_to @project, :notice => "Updated!"  
  end
  
  def destroy
    @project.destroy
    redirect_to projects_url, :notice => "Destroyed!"  
  end

  private 
  def authorized_user?
    @project ||= params[:id] ? Project.find(params[:id]) : Project.new
    @project.users.include?(current_user) 
  end

end

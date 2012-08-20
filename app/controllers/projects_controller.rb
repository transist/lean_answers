class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = current_users_projects
  end

  def show
    @pane = false
  end

  def create
    @project = Project.create(params[:project])
    Membership.create(:user_id => current_user.id, :project_id => @project.id, :membership_type => :owner)
    redirect_to @project, :notice => "Created!"
  end

  def update
    @project = Project.find_by_id(params[:id])
    @project.update_attributes(params[:project])
    redirect_to @project, :notice => "Updated!"
  end

  def destroy
    @project = Project.find_by_id(params[:id])
    @project.destroy
    redirect_to projects_url, :notice => "Destroyed!"
  end
end

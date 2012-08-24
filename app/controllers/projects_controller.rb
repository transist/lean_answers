class ProjectsController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @projects = current_users_projects
  end

  def show
    @pane = false
    show!
  end

  def create
    @project = current_user.create_project(params[:project])
    create!
  end
end

class HomeController < ApplicationController
  def index
    @projects = current_users_projects
  end
  
  def search
    @projects = current_user.projects.search(params[:q])
  end
end

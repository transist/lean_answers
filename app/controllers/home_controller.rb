class HomeController < ApplicationController
  def index
    logger.info("::::::::::::#{logged_in?}::::::::::::::::::::::::::::::::::::::::::::")
  end
  
  def search
    @projects = current_user.projects.search(params[:q])
  end
end

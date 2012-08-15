class ApplicationController < ActionController::Base
  protect_from_forgery
  private  
    
  def logged_in?  
    current_user != false
  end
  
  def current_users_projects
    (current_user ? current_user.projects : [])
  end
  
  helper_method :current_users_projects
  helper_method :logged_in?
  include Mobylette::RespondToMobileRequests
end

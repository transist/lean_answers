class ApplicationController < ActionController::Base
  protect_from_forgery
  private  
  
  def current_user
    if session[:user_id]
    @current_user ||= User.find(session[:user_id])
    else
      @current_user = false
    end
  end  
  
  def logged_in?  
    current_user != false
  end
  
  def current_users_projects
    (current_user ? current_user.projects : [])
  end
  
  helper_method :current_users_projects
  helper_method :current_user
  helper_method :logged_in?
  include Mobylette::RespondToMobileRequests
end

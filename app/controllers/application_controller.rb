class ApplicationController < ActionController::Base
  protect_from_forgery
  private  
  
  def current_users_projects
    (current_user ? current_user.projects : [])
  end
  
  helper_method :current_users_projects
  helper_method :user_signed_in?
  include Mobylette::RespondToMobileRequests
end

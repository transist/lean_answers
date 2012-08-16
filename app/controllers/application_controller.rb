class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
    
  private  
  def current_users_projects
    (current_user ? current_user.projects : [])
  end
  
  helper_method :current_users_projects

  include Mobylette::RespondToMobileRequests

end

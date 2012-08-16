class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do |controller|
    if controller.respond_to?(:authorized_user?, true)
      unless controller.send(:authorized_user?)
        redirect_to root_path, notice: "Sorry, you don't have the access to visit that page."
        return false
      end
    end
  end
  
  private  
  def current_users_projects
    (current_user ? current_user.projects : [])
  end
  
  helper_method :current_users_projects
  include Mobylette::RespondToMobileRequests

end
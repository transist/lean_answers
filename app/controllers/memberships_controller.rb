class MembershipsController < ApplicationController
  
  def index
  end
  
  def new  
  end  
  
  def create  
    redirect_to root_url, :notice => "Logged in!"  
  end
  
  def destroy
    redirect_to root_url, :notice => "Logged out!"  
  end
end

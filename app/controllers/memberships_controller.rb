class MembershipsController < ApplicationController
  before_filter :lookup_project

  load_and_authorize_resource :project
  load_and_authorize_resource :membership, :through => :project
  def index
    if params[:project_id]
      @memberships = @project.memberships
    else
      @memberships = Membership.all
    end
  end
  
  def new
    @membership = @project.memberships.build
  end  
  
  def show
    @membership = Membership.find(params[:id])
  end
  
  def edit
    @membership = Membership.find(params[:id])
  end
  
  def create  
    @membership = Membership.create(params[:membership])
    @project.memberships << @membership
    @membership.make_current
    redirect_to @project, :notice => "Created!"  
  end
  
  def update
    @membership = Membership.find(params[:id])
    @membership.update_attributes(params[:membership])
    @membership.accept if params[:membership]['state'] == 'accepted'
    @membership.reject if params[:membership]['state'] == 'rejected'
    # @membership.make_current if params[:membership]['state'] == 'current'
    @membership.na if params[:membership]['state'] == 'not_applicable'
    redirect_to @project, :notice => "Updated!"  
  end
  
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to project_path(@project), :notice => "Destroyed!"  
  end
  
  private
  
  def lookup_project
    @project = Project.find(params[:project_id])
  end
end

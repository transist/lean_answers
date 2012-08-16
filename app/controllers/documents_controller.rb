class DocumentsController < ApplicationController
  before_filter :lookup_project

  load_and_authorize_resource :project
  load_and_authorize_resource :document, :through => :project
  def index
    if params[:project_id]
      @documents = @project.documents
    else
      @documents = Document.all
    end
  end
  
  def new
    @document = @project.documents.build
  end  
  
  def show
    @document = Document.find(params[:id])
  end
  
  def edit
    @document = Document.find(params[:id])
  end
  
  def create  
    @document = Document.create(params[:document])
    @project.documents << @document
    @document.make_current
    redirect_to @project, :notice => "Created!"  
  end
  
  def update
    @document = Document.find(params[:id])
    @document.update_attributes(params[:document])
    @document.accept if params[:document]['state'] == 'accepted'
    @document.reject if params[:document]['state'] == 'rejected'
    @document.na if params[:document]['state'] == 'not_applicable'
    redirect_to @project, :notice => "Updated!"  
  end
  
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to project_path(@project), :notice => "Destroyed!"  
  end
  
  private
  
  def lookup_project
    @project = Project.find(params[:project_id])
  end
end

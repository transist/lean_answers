class StudiesController < ApplicationController
  def index
    @studies = Study.all
  end
  
  def new  
    @study = Study.new
  end  
  
  def show  
    @study = Study.find(params[:id])
  end
  
  def edit  
    @study = Study.find(params[:id])
  end
  
  def create  
    @study = Study.create(params[:study])
    redirect_to @study, :notice => "Created!"  
  end
  
  def update  
    @study = Study.find(params[:id])
    @study.update_attributes(params[:study])
    redirect_to @study, :notice => "Updated!"  
  end
  
  def destroy
    @study = Study.find(params[:id])
    @study.destroy
    redirect_to studies_url, :notice => "Destroyed!"  
  end
end

class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end
  
  def new  
    @survey = Survey.new
  end  
  
  def show  
    @survey = Survey.find(params[:id])
  end
  
  def edit  
    @survey = Survey.find(params[:id])
  end
  
  def create  
    @survey = Survey.create(params[:survey])
    redirect_to @survey, :notice => "Created!"  
  end
  
  def update  
    @survey = Survey.find(params[:id])
    @survey.update_attributes(params[:survey])
    redirect_to @survey, :notice => "Updated!"  
  end
  
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, :notice => "Destroyed!"  
  end
end

class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  
  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build
    logger.info("::::::::::::::::::::::#{@question.inspect}::::::::::::::::::::::::::::::::")
  end  
  
  def show  
    @question = Question.find(params[:id])
  end
  
  def edit  
    @question = Question.find(params[:id])
  end
  
  def create  
    @question = Question.create(params[:question])
    redirect_to @question, :notice => "Created!"  
  end
  
  def update  
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    redirect_to @question, :notice => "Updated!"  
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to surveys_url, :notice => "Destroyed!"  
  end
end

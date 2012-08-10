class HypothesesController < ApplicationController
  before_filter :lookup_project
  def index
    @hypotheses = @project.hypotheses
  end
  
  def new  
    if klass.to_s == 'Hypothesis'
      @hypothesis = get_hypothesis_type
    else
      @hypothesis = klass.new
    end
  end  
  
  def show  
    @hypothesis = klass.find(params[:id])
    @pane = true
  end
  
  def edit  
    @hypothesis = klass.find(params[:id])
  end
  
  def create  
    puts klass.to_s.underscore
    @hypothesis = klass.create(params[klass.to_s.underscore])
    @project.hypotheses << @hypothesis
    @hypothesis.make_current if params['current']
    redirect_to project_url(@project), :notice => "Created!"  
  end
  
  def update  
    @hypothesis = klass.find(params[:id])
    p = params[klass.to_s.underscore].dup
    p.delete(:state)
    @hypothesis.update_attributes(p)
    @hypothesis.accept if params[klass.to_s.underscore]['state'] == 'accepted'
    @hypothesis.reject if params[klass.to_s.underscore]['state'] == 'rejected'
    @hypothesis.make_current if params[klass.to_s.underscore]['state'] == 'current'
    @hypothesis.pend if params[klass.to_s.underscore]['state'] == 'pending'
    redirect_to project_url(@project), :notice => "Updated!"  
  end
  
  def destroy
    @hypothesis = klass.find(params[:id])
    @hypothesis.ensure_current if @hypothesis.state == 'current'
    @hypothesis.destroy
    redirect_to project_url(@project), :notice => "Destroyed!"  
  end
  
  private
  
  def get_hypothesis_type
    case params[:type]
    when 'customer'
      @hypothesis = CustomerHypothesis.new
    when 'problem'
      @hypothesis = ProblemHypothesis.new
    when 'solution'
      @hypothesis = SolutionHypothesis.new
    end
    @hypothesis = Hypothesis.new if @hypothesis == nil
    @hypothesis
  end
  
  def lookup_project
    @project = Project.find(params[:project_id])
  end
  
  def klass
    Hypothesis
  end
end

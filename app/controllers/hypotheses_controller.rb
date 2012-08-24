class HypothesesController < InheritedResources::Base
  belongs_to :project

  load_and_authorize_resource :project
  load_and_authorize_resource :hypothesis, through: :project

  def new
    if %w(CustomerHypothesis ProblemHypothesis SolutionHypothesis).include?(params[:type])
      resource.type = params[:type]
    end
    new!
  end

  def show
    @pane = true
  end

  def edit
    @hypothesis = klass.find(params[:id])
  end

  def create
    if %w(CustomerHypothesis ProblemHypothesis SolutionHypothesis).include?(params[:type])
      resource.type = params[:type]
    end
    create! { project_hypotheses_path }
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
    redirect_to project_url(@project), notice: "Updated!"
  end

  def destroy
    @hypothesis = klass.find(params[:id])
    @hypothesis.ensure_current if @hypothesis.state == 'current'
    @hypothesis.destroy
    redirect_to project_url(@project), notice: "Destroyed!"
  end
end

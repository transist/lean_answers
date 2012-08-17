class Project < ActiveRecord::Base
  attr_accessible :name, :description, :tag_list
  has_many :customer_hypotheses, :class_name => "CustomerHypothesis", :foreign_key => "project_id"
  has_many :problem_hypotheses,  :class_name => "ProblemHypothesis",  :foreign_key => "project_id"
  has_many :solution_hypotheses, :class_name => "SolutionHypothesis", :foreign_key => "project_id"
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :assumptions
  has_many :hypotheses
  has_many :experiments
  has_many :scorecards
  has_many :documents
  has_many :tasks
  acts_as_ordered_taggable


  def current_assumptions
    h = Assumption.all(:conditions => {:project_id => self.id, :state => 'current'})
  end

  def current_hypotheses
    h = Hypothesis.all(:conditions => {:project_id => self.id, :state => 'current'})
  end

  def current_customer
    h = CustomerHypothesis.first(:conditions => {:project_id => self.id, :state => 'current'})
  end

  def current_problem
    h = ProblemHypothesis.first(:conditions => {:project_id => self.id, :state => 'current'})
  end

  def current_solution
    h = SolutionHypothesis.first(:conditions => {:project_id => self.id, :state => 'current'})
  end
end

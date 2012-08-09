class Experiment < ActiveRecord::Base
  attr_accessible :customer_hypothesis_id, :description, :name, :problem_hypothesis_id, :project_id, :solution_hypothesis_id, :state
  has_one :customer_hypothesis, :class_name => "CustomerHypothesis", :foreign_key => "customer_hypothesis_id"
  has_one :problem_hypothesis, :class_name => "ProblemHypothesis", :foreign_key => "problem_hypothesis_id"
  has_one :solution_hypothesis, :class_name => "SolutionHypothesis", :foreign_key => "solution_hypothesis_id"
  
end

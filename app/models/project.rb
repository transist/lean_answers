class Project < ActiveRecord::Base
  attr_accessible :name, :description, :tag_list
  has_many :customer_hypotheses, :class_name => "CustomerHypothesis", :foreign_key => "project_id"
  has_many :problem_hypotheses,  :class_name => "ProblemHypothesis",  :foreign_key => "project_id"
  has_many :solution_hypotheses, :class_name => "SolutionHypothesis", :foreign_key => "project_id"
  has_one :ownership, class_name: 'Membership', conditions: {membership_type: :owner}
  has_many :adminships, class_name: 'Membership', conditions: {membership_type: :admin}
  has_many :memberships, conditions: {membership_type: :member}
  has_many :users, :through => :memberships
  has_one :owner, through: :ownership, source: :user
  has_many :admins, through: :adminships, source: :user
  has_many :members, through: :memberships, source: :user
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

  def add_admin(user)
    memberships.admin.create(user: user)
    add_member(user)
  end

  def add_member(user)
    memberships.member.create(user: user)
  end
end

# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  state       :string(255)
#


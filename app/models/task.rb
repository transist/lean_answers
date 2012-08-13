class Task < ActiveRecord::Base
  attr_accessible :decription, :name, :project_id, :state
  has_many :task_assignments
  has_many :users, :through => :task_assignments
  belongs_to :project
  # belongs_to :experiment
end

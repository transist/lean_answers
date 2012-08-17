class Task < ActiveRecord::Base
  attr_accessible :decription, :name, :project_id, :state
  has_many :task_assignments
  has_many :users, :through => :task_assignments
  belongs_to :project
  # belongs_to :experiment
end

# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  project_id :integer
#  name       :text
#  decription :text
#  state      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


# == Schema Information
#
# Table name: task_assignments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :integer
#

class TaskAssignment < ActiveRecord::Base
  attr_accessible :project_id, :user_id
  
end

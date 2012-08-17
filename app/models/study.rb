class Study < ActiveRecord::Base
  attr_accessible :created_by, :description, :name, :project_id
end

# == Schema Information
#
# Table name: studies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  project_id  :integer
#  created_by  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


# == Schema Information
#
# Table name: memberships
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  project_id      :integer
#  membership_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Membership < ActiveRecord::Base
  attr_accessible :membership_type, :project_id, :user_id
  belongs_to :user
  belongs_to :project
end

class Membership < ActiveRecord::Base
  attr_accessible :membership_type, :project_id, :user_id
  belongs_to :user
  belongs_to :project
end

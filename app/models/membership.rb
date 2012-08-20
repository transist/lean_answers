class Membership < ActiveRecord::Base
  include Enumerize

  MEMBERSHIP_TYPES = [:owner, :admin, :member]

  attr_accessible :membership_type, :project_id, :user_id, :user
  belongs_to :user
  belongs_to :project

  enumerize :membership_type, in: MEMBERSHIP_TYPES, default: :owner

  MEMBERSHIP_TYPES.each do |type|
    scope type, where(membership_type: type)
  end
end

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


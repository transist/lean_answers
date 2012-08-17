# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  message    :text
#  json       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  attr_accessible :json, :message, :project_id, :user_id
end

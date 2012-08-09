class Message < ActiveRecord::Base
  attr_accessible :json, :message, :project_id, :user_id
end

class Assumption < ActiveRecord::Base
  attr_accessible :assumption, :position, :project_id, :reason, :state
  scope :state, lambda { |state|
     first(:conditions => {:state => state})
  }
  
  scope :state_all, lambda { |state|
    where(:state => state)
  }
end

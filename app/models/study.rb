class Study < ActiveRecord::Base
  attr_accessible :created_by, :description, :name, :project_id
end

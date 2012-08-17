class Survey < ActiveRecord::Base
  attr_accessible :description, :name, :survey_type
  has_many :questions
  self.inheritance_column = :survey_type
end

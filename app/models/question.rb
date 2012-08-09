class Question < ActiveRecord::Base
  attr_accessible :position, :question, :survey_id
  belongs_to :survey
  self.inheritance_column = :question_type
end

class Answer < ActiveRecord::Base
  attr_accessible :answer, :choice_id, :question_id, :survey_id, :user_id, :answer_type
end

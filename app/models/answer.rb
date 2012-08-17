class Answer < ActiveRecord::Base
  attr_accessible :answer, :choice_id, :question_id, :survey_id, :user_id, :answer_type
end

# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  choice_id   :integer
#  question_id :integer
#  user_id     :integer
#  answer      :text
#  survey_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  answer_type :string(255)
#


class Question < ActiveRecord::Base
  attr_accessible :position, :question, :survey_id
  belongs_to :survey
  self.inheritance_column = :question_type
end

# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  survey_id     :integer
#  question      :text
#  position      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  question_type :string(255)
#


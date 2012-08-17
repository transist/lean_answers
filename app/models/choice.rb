# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  choice      :text
#  position    :integer
#  choice_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#

class Choice < ActiveRecord::Base
  attr_accessible :choice, :choice_type, :position, :survey_id
end

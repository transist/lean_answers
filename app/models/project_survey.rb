# == Schema Information
#
# Table name: surveys
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  survey_type :string(255)
#

class ProjectSurvey < Survey
end

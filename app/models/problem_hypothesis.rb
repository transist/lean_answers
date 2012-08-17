# == Schema Information
#
# Table name: hypotheses
#
#  id         :integer          not null, primary key
#  content    :text
#  type       :string(255)
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :string(255)
#  reason     :text
#

class ProblemHypothesis < Hypothesis
  belongs_to :experiment
end

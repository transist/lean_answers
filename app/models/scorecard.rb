# == Schema Information
#
# Table name: scorecards
#
#  id              :integer          not null, primary key
#  project_id      :integer
#  sector          :string(255)
#  date_prepared   :date
#  potential_start :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Scorecard < ActiveRecord::Base
  attr_accessible :date_prepared, :potential_start, :project_id, :sector
  belongs_to :project
end

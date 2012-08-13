class Scorecard < ActiveRecord::Base
  attr_accessible :date_prepared, :potential_start, :project_id, :sector
  belongs_to :project
end

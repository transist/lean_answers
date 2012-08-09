class AddReasonToHypothesis < ActiveRecord::Migration
  def change
    add_column :hypotheses, :reason, :text
  end
end

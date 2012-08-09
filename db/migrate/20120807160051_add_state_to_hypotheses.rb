class AddStateToHypotheses < ActiveRecord::Migration
  def change
    add_column :hypotheses, :state, :string
  end
end

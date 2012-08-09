class AddReasonToAssumption < ActiveRecord::Migration
  def change
    add_column :assumptions, :reason, :text
    add_column :assumptions, :state, :string
  end
end

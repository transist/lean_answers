class CreateAssumptions < ActiveRecord::Migration
  def change
    create_table :assumptions do |t|
      t.text :assumption
      t.integer :position
      t.integer :project_id

      t.timestamps
    end
  end
end

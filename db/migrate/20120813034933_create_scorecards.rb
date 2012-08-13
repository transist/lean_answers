class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :project_id
      t.string :sector
      t.date :date_prepared
      t.string :potential_start

      t.timestamps
    end
  end
end

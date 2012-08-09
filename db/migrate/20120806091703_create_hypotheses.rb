class CreateHypotheses < ActiveRecord::Migration
  def change
    create_table :hypotheses do |t|
      t.string :content
      t.string :type
      t.integer :project_id

      t.timestamps
    end
  end
end

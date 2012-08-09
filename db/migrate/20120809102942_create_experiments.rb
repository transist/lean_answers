class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.text :name
      t.text :description
      t.integer :project_id
      t.integer :customer_hypothesis_id
      t.integer :problem_hypothesis_id
      t.integer :solution_hypothesis_id
      t.string :state

      t.timestamps
    end
  end
end

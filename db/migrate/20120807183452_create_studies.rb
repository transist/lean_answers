class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :name
      t.text :description
      t.integer :project_id
      t.integer :created_by

      t.timestamps
    end
  end
end

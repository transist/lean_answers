class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.text :name
      t.text :decription
      t.string :state

      t.timestamps
    end
  end
end

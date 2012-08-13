class CreateTaskAssignments < ActiveRecord::Migration
  def change
    create_table :task_assignments do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end

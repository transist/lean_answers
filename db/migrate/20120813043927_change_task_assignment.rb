class ChangeTaskAssignment < ActiveRecord::Migration
  def up
    add_column :task_assignments, :task_id, :integer
    remove_column :task_assignments, :project_id
  end

  def down
    add_column :task_assignments, :project_id, :integer
    remove_column :task_assignments, :task_id
  end
end
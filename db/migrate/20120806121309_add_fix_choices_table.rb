class AddFixChoicesTable < ActiveRecord::Migration
  def up
    add_column :choices, :question_id, :integer
    remove_column :choices, :survey_id
  end

  def down
    add_column :choices, :survey_id, :integer
    remove_column :choices, :question_id
  end
end
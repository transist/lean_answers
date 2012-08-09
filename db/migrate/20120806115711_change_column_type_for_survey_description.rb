class ChangeColumnTypeForSurveyDescription < ActiveRecord::Migration
  def up
    remove_column :surveys, :description
    add_column :surveys, :description, :text
  end

  def down
    remove_column :surveys, :description
    add_column :surveys, :description, :string
  end
end

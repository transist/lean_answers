class ChangeColumnTypeForContentOnHypothesis < ActiveRecord::Migration
  def up
    change_column :hypotheses, :content, :text
  end

  def down
    change_column :hypotheses, :content, :string
  end
end
class AddStateToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :state, :string
  end
end

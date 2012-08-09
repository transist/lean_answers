class AddMoreToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :reply_to_name, :string
    add_column :emails, :reply_to_address, :string
  end
end

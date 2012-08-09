class AddTypeToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :type, :string
  end
end

class AddEmailOptionsToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :email_options, :text
  end
end

class AddFailureMessageToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :failure_message, :text
  end
end

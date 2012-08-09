class AddFieldsToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :include_bootstrap_css, :boolean, :default => true
    add_column :emails, :css, :text
  end
end

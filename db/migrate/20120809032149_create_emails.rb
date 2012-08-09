class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :to
      t.text :from
      t.text :cc
      t.text :bcc
      t.text :subject
      t.text :text_version
      t.text :html_version

      t.timestamps
    end
  end
end

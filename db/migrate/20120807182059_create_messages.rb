class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :project_id
      t.integer :user_id
      t.text :message
      t.text :json

      t.timestamps
    end
  end
end

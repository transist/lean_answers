class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :membership_type

      t.timestamps
    end
  end
end

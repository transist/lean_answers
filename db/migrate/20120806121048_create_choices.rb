class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :survey_id
      t.text :choice
      t.integer :position
      t.string :choice_type

      t.timestamps
    end
  end
end

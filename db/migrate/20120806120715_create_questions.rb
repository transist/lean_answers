class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.text :question
      t.integer :position

      t.timestamps
    end
  end
end

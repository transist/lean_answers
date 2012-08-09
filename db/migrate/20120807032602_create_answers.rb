class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :choice_id
      t.integer :question_id
      t.integer :user_id
      t.text :answer
      t.integer :survey_id

      t.timestamps
    end
  end
end

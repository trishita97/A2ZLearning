class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :id
      t.string :answer
      t.string :question_id
      t.string :user_id

      t.timestamps
    end
  end
end

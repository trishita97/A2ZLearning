class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :question
      t.references :user

      t.timestamps
    end
  end
end

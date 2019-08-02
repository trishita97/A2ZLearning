class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :id
      t.string :title
      t.string :description
      t.string :user_id

      t.timestamps
    end
  end
end

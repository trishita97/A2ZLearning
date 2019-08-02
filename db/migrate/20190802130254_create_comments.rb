class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :id
      t.string :user_id
      t.string :comment
      t.string :answer_id

      t.timestamps
    end
  end
end

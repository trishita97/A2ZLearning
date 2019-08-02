class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :middle_name
      t.string :address
      t.string :mobile
      t.string :user_id

      t.timestamps
    end
  end
end

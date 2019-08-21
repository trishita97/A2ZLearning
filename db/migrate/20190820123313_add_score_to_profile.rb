class AddScoreToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :score, :integer, :default => 0
    #Ex:- :default =>''
  end
end

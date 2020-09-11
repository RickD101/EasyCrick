class CreateBatInnings < ActiveRecord::Migration[6.0]
  def change
    create_table :bat_innings do |t|
      t.belongs_to :player
      t.belongs_to :inning

      # scoring shots
      t.integer :dots
      t.integer :ones
      t.integer :twos
      t.integer :threes
      t.integer :fours
      t.integer :fives
      t.integer :sixes

      t.boolean :out
      t.boolean :did_bat
      t.integer :position
      t.boolean :is_keeper
      t.boolean :is_captain

      t.timestamps
    end
  end
end

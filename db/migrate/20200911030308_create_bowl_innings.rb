class CreateBowlInnings < ActiveRecord::Migration[6.0]
  def change
    create_table :bowl_innings do |t|
      t.belongs_to :player
      t.belongs_to :inning

      # runs conceded
      t.integer :dots
      t.integer :ones
      t.integer :twos
      t.integer :threes
      t.integer :fours
      t.integer :fives
      t.integer :sixes
      t.integer :wides
      t.integer :no_balls

      t.boolean :did_bowl
      t.integer :position
      t.boolean :is_keeper
      t.boolean :is_captain

      t.timestamps
    end
  end
end

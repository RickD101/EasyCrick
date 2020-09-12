class ModifyColumnsInInnings < ActiveRecord::Migration[6.0]
  def change
    remove_columns :bat_innings, :dots, :ones, :twos, :threes, :fives
    remove_columns :bowl_innings, :ones, :twos, :threes, :fives

    add_column :bat_innings, :runs_scored, :integer
    add_column :bat_innings, :balls_faced, :integer
    add_column :bowl_innings, :runs_conceded, :integer
    add_column :bowl_innings, :deliveries, :integer
  end
end

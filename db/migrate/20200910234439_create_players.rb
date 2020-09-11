class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.date :DOB

      # batting stats
      t.integer :runs_scored
      t.integer :balls_faced
      t.integer :bat_innings
      t.integer :not_outs
      t.integer :fours
      t.integer :sixes
      t.integer :centuries
      t.integer :half_centuries
      t.string :highest_score

      # bowling stats
      t.integer :runs_conceded
      t.integer :balls_bowled
      t.integer :bowl_innings
      t.integer :wickets
      t.integer :wides
      t.integer :no_balls
      t.integer :five_wicket_innings
      t.integer :four_wicket_innings
      t.string :best_bowling_figures

      t.timestamps
    end
  end
end

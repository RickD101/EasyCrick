class RemoveColumnsFromPlayers < ActiveRecord::Migration[6.0]
  def change
    remove_columns :players, :runs_scored, :runs_conceded,:balls_bowled,:balls_faced,:no_balls,:best_bowling_figures,:centuries,:half_centuries,:five_wicket_innings,:four_wicket_innings,:wickets,:fours,:highest_score,:wides,:not_outs,:sixes
  end
end

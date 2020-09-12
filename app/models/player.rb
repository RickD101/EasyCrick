class Player < ApplicationRecord
  has_many :team_players
  has_many :teams, through: :team_players

  has_many :bat_innings
  has_many :bowl_innings
  has_many :wickets, foreign_key: :bowler_id, class_name: 'Wicket'
  has_many :dismissals, foreign_key: :batter_id, class_name: 'Wicket'
  has_many :catches, foreign_key: :caught_by_id, class_name: 'Wicket'
  has_many :run_outs, foreign_key: :run_out_by_id, class_name: 'Wicket'
  has_many :stumpings, foreign_key: :stumped_by_id, class_name: 'Wicket'

  validates :name, :DOB, presence: true
end

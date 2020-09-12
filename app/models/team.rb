class Team < ApplicationRecord
  has_many :team_players
  has_many :players, through: :team_players

  has_many :home_team_matches, class_name: 'Match', foreign_key: :home_team_id
  has_many :away_team_matches, class_name: 'Match', foreign_key: :away_team_id

  validates :name, :homeground, presence: true
end

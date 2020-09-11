class Player < ApplicationRecord
  has_many :team_players
  has_many :teams, through: :team_players

  has_many :bat_innings
  has_many :bowl_innings
end
class Inning < ApplicationRecord
  belongs_to :match

  has_many :bowl_innings
  has_many :bat_innings
  has_one :extra
  has_many :wickets
end

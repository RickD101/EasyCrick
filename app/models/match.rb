class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  has_many :innings, dependent: :destroy
  has_many :bat_innings, through: :innings, dependent: :destroy
  has_many :bowl_innings, through: :innings, dependent: :destroy
  has_many :extras, through: :innings, dependent: :destroy
  has_many :wickets, through: :innings, dependent: :destroy

  accepts_nested_attributes_for :innings, allow_destroy: true
  accepts_nested_attributes_for :bat_innings, allow_destroy: true
  accepts_nested_attributes_for :bowl_innings, allow_destroy: true
  accepts_nested_attributes_for :extras, allow_destroy: true
  accepts_nested_attributes_for :wickets, allow_destroy: true
end

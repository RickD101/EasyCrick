class Inning < ApplicationRecord
  belongs_to :match

  has_many :bowl_innings, dependent: :destroy
  has_many :bat_innings, dependent: :destroy
  has_many :extras, dependent: :destroy
  has_many :wickets, dependent: :destroy

  accepts_nested_attributes_for :bat_innings, allow_destroy: true
  accepts_nested_attributes_for :bowl_innings, allow_destroy: true
  accepts_nested_attributes_for :extras, allow_destroy: true
  accepts_nested_attributes_for :wickets, allow_destroy: true
end

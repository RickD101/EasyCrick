class RemoveColumnsFromPlayer < ActiveRecord::Migration[6.0]
  def change
    remove_columns :players, :bowl_innings, :bat_innings, :matches_played
  end
end

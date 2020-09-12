class SwapColumnsFromBowlToBat < ActiveRecord::Migration[6.0]
  def change
    add_column :bat_innings, :is_keeper, :boolean
    add_column :bat_innings, :is_captain, :boolean

    remove_column :bowl_innings, :is_keeper
    remove_column :bowl_innings, :is_captain
  end
end

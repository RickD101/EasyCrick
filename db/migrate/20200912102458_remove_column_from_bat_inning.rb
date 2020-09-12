class RemoveColumnFromBatInning < ActiveRecord::Migration[6.0]
  def change
    remove_column :bat_innings, :is_captain
    remove_column :bat_innings, :is_keeper
  end
end

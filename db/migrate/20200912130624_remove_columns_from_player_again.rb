class RemoveColumnsFromPlayerAgain < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :matches_played
  end
end

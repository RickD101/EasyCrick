class AddColumntoPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :matches_played, :integer
  end
end

class AddColumnsToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :role, :string
    add_column :players, :bat_style, :string
    add_column :players, :bowl_style, :string
  end
end

class AddColumnToBowlInning < ActiveRecord::Migration[6.0]
  def change
    add_column :bowl_innings, :maidens, :integer
  end
end

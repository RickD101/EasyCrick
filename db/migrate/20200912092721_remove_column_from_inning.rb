class RemoveColumnFromInning < ActiveRecord::Migration[6.0]
  def change
    remove_column :innings, :bowl_team
  end
end

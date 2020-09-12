class DropWickets < ActiveRecord::Migration[6.0]
  def change
    drop_table :wickets
  end
end

class AddColumnToWicket < ActiveRecord::Migration[6.0]
  def change
    add_column :wickets, :fell_at, :string
  end
end

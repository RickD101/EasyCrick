class AddColumnsToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :outcome, :string
  end
end

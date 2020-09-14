class AddColumnToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :summary, :string
  end
end

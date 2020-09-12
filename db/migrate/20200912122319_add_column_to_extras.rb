class AddColumnToExtras < ActiveRecord::Migration[6.0]
  def change
    add_column :extras, :penalties, :integer
  end
end

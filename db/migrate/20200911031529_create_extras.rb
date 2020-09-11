class CreateExtras < ActiveRecord::Migration[6.0]
  def change
    create_table :extras do |t|
      t.belongs_to :inning

      t.integer :leg_byes
      t.integer :byes

      t.timestamps
    end
  end
end

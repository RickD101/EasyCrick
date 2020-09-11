class CreateInnings < ActiveRecord::Migration[6.0]
  def change
    create_table :innings do |t|
      t.belongs_to :match

      t.integer :number
      t.string :bat_team
      t.string :bowl_team

      t.timestamps
    end
  end
end

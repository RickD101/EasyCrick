class AddWicketsBack < ActiveRecord::Migration[6.0]
  def change
    create_table :wickets do |t|
      t.references :inning, null: false, foreign_key: true
      t.references :batter, references: :players, null: false, foreign_key: { to_table: :players }
      t.references :bowler, references: :players, foreign_key: { to_table: :players }

      t.string :dismissal_type
      t.string :fell_at
      t.references :caught_by, references: :players, foreign_key: { to_table: :players }
      t.references :run_out_by, references: :players, foreign_key: { to_table: :players }
      t.references :stumped_by, references: :players, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end

class CreateWickets < ActiveRecord::Migration[6.0]
  def change
    create_table :wickets do |t|
      t.references :inning, null: false, foreign_key: true
      t.references :batter, null: false, foreign_key: { to_table: :players }
      t.references :bowler, foreign_key: { to_table: :players }

      t.string :dismissal_type
      t.references :caught_by, foreign_key: { to_table: :players }
      t.references :run_out_by, foreign_key: { to_table: :players }
      t.references :stumped_by, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end

class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.date :date_played
      t.string :match_type
      t.string :competition
      t.string :location

      t.references :home_team, foreign_key: { to_table: :teams }
      t.references :away_team, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end

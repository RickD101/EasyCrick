# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_12_132219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bat_innings", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "inning_id"
    t.integer "fours"
    t.integer "sixes"
    t.boolean "did_bat"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_keeper"
    t.boolean "is_captain"
    t.integer "runs_scored"
    t.integer "balls_faced"
    t.index ["inning_id"], name: "index_bat_innings_on_inning_id"
    t.index ["player_id"], name: "index_bat_innings_on_player_id"
  end

  create_table "bowl_innings", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "inning_id"
    t.integer "dots"
    t.integer "fours"
    t.integer "sixes"
    t.integer "wides"
    t.integer "no_balls"
    t.boolean "did_bowl"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "runs_conceded"
    t.integer "deliveries"
    t.integer "maidens"
    t.index ["inning_id"], name: "index_bowl_innings_on_inning_id"
    t.index ["player_id"], name: "index_bowl_innings_on_player_id"
  end

  create_table "extras", force: :cascade do |t|
    t.bigint "inning_id"
    t.integer "leg_byes"
    t.integer "byes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "penalties"
    t.index ["inning_id"], name: "index_extras_on_inning_id"
  end

  create_table "innings", force: :cascade do |t|
    t.bigint "match_id"
    t.integer "number"
    t.string "bat_team"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_innings_on_match_id"
  end

  create_table "matches", force: :cascade do |t|
    t.date "date_played"
    t.string "match_type"
    t.string "competition"
    t.string "location"
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "outcome"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.date "DOB"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.string "bat_style"
    t.string "bowl_style"
  end

  create_table "team_players", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_team_players_on_player_id"
    t.index ["team_id"], name: "index_team_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "homeground"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wickets", force: :cascade do |t|
    t.bigint "inning_id", null: false
    t.bigint "batter_id", null: false
    t.bigint "bowler_id"
    t.string "dismissal_type"
    t.string "fell_at"
    t.bigint "caught_by_id"
    t.bigint "run_out_by_id"
    t.bigint "stumped_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["batter_id"], name: "index_wickets_on_batter_id"
    t.index ["bowler_id"], name: "index_wickets_on_bowler_id"
    t.index ["caught_by_id"], name: "index_wickets_on_caught_by_id"
    t.index ["inning_id"], name: "index_wickets_on_inning_id"
    t.index ["run_out_by_id"], name: "index_wickets_on_run_out_by_id"
    t.index ["stumped_by_id"], name: "index_wickets_on_stumped_by_id"
  end

  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "team_players", "players"
  add_foreign_key "team_players", "teams"
  add_foreign_key "wickets", "innings"
  add_foreign_key "wickets", "players", column: "batter_id"
  add_foreign_key "wickets", "players", column: "bowler_id"
  add_foreign_key "wickets", "players", column: "caught_by_id"
  add_foreign_key "wickets", "players", column: "run_out_by_id"
  add_foreign_key "wickets", "players", column: "stumped_by_id"
end

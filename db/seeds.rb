# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.create([
              { name: 'Australia', homeground: 'The MCG' },
              { name: 'England', homeground: 'Lords' }
            ])

Player.create([
                { name: 'David Warner', DOB: '27/10/1986', role: 'Opening batsman', bat_style: 'Left-hand', bowl_style: 'Legbreak' },
                { name: 'Aaron Finch', DOB: '17/11/1986', role: 'Top-order batsman', bat_style: 'Right-hand', bowl_style: 'Left-arm orthodox' },
                { name: 'Marcus Stoinis', DOB: '16/08/1989', role: 'Batting allrounder', bat_style: 'Right-hand', bowl_style: 'Right-arm medium' },
                { name: 'Marnus Labuschagne', DOB: '22/06/1994', role: 'Top-order batsman', bat_style: 'Right-hand', bowl_style: 'Legbreak' },
                { name: 'Mitchell Marsh', DOB: '20/10/1991', role: 'Allrounder', bat_style: 'Right-hand', bowl_style: 'Right-arm medium' },
                { name: 'Alex Carey', DOB: '27/08/1991', role: 'Wicketkeeper batsman', bat_style: 'Left-hand', bowl_style: nil },
                { name: 'Glenn Maxwell', DOB: '14/10/1988', role: 'Batting allrounder', bat_style: 'Right-hand', bowl_style: 'Right-arm offbreak' },
                { name: 'Pat Cummins', DOB: '08/05/1993', role: 'Bowler', bat_style: 'Right-hand', bowl_style: 'Right-arm fast' },
                { name: 'Mitchell Starc', DOB: '30/01/1990', role: 'Bowler', bat_style: 'Left-hand', bowl_style: 'Left-arm fast' },
                { name: 'Adam Zampa', DOB: '31/03/1992', role: 'Bowler', bat_style: 'Right-hand', bowl_style: 'Legbreak' },
                { name: 'Josh Hazlewood', DOB: '08/01/1991', role: 'Bowler', bat_style: 'Left-hand', bowl_style: 'Right-arm fast-medium' },
                { name: 'Jason Roy', DOB: '21/07/1990', role: 'Opening batsman', bat_style: 'Right-hand', bowl_style: nil },
                { name: 'Jonny Bairstow', DOB: '26/09/1989', role: 'Wicketkeeper batsman', bat_style: 'Right-hand', bowl_style: 'Right-arm medium' },
                { name: 'Joe Root', DOB: '30/12/1990', role: 'Top-order batsman', bat_style: 'Right-hand', bowl_style: 'Right-arm offbreak' },
                { name: 'Eoin Morgan', DOB: '10/09/1986', role: 'Middle-order batsman', bat_style: 'Left-hand', bowl_style: 'Right-arm medium' },
                { name: 'Jos Buttler', DOB: '08/09/1990', role: 'Wicketkeeper batsman', bat_style: 'Right-hand', bowl_style: nil },
                { name: 'Sam Billings', DOB: '15/06/1991', role: 'Wicketkeeper batsman', bat_style: 'Right-hand', bowl_style: nil },
                { name: 'Moeen Ali', DOB: '18/06/1987', role: 'Batting allrounder', bat_style: 'Left-hand', bowl_style: 'Right-arm offbreak' },
                { name: 'Chris Woakes', DOB: '02/03/1989', role: 'Allrounder', bat_style: 'Right-hand', bowl_style: 'Right-arm fast-medium' },
                { name: 'Adil Rashid', DOB: '14/10/1988', role: 'Bowler', bat_style: 'Right-hand', bowl_style: 'Legbreak' },
                { name: 'Jofra Archer', DOB: '01/04/1995', role: 'Bowler', bat_style: 'Right-hand', bowl_style: 'Right-arm fast' },
                { name: 'Mark Wood', DOB: '11/01/1990', role: 'Bowler', bat_style: 'Right-hand', bowl_style: 'Right-arm fast' },
                { name: 'Sam Curran', DOB: '03/06/1998', role: 'Allrounder', bat_style: 'Left-hand', bowl_style: 'Left-arm medium-fast' },
                { name: 'Tom Curran', DOB: '12/03/1995', role: 'Bowling allrounder', bat_style: 'Right-hand', bowl_style: 'Right-arm fast-medium' }
              ])

TeamPlayer.create([
                    { team_id: 1, player_id: 1 },
                    { team_id: 1, player_id: 2 },
                    { team_id: 1, player_id: 3 },
                    { team_id: 1, player_id: 4 },
                    { team_id: 1, player_id: 5 },
                    { team_id: 1, player_id: 6 },
                    { team_id: 1, player_id: 7 },
                    { team_id: 1, player_id: 8 },
                    { team_id: 1, player_id: 9 },
                    { team_id: 1, player_id: 10 },
                    { team_id: 1, player_id: 11 },
                    { team_id: 2, player_id: 12 },
                    { team_id: 2, player_id: 13 },
                    { team_id: 2, player_id: 14 },
                    { team_id: 2, player_id: 15 },
                    { team_id: 2, player_id: 16 },
                    { team_id: 2, player_id: 17 },
                    { team_id: 2, player_id: 18 },
                    { team_id: 2, player_id: 19 },
                    { team_id: 2, player_id: 20 },
                    { team_id: 2, player_id: 21 },
                    { team_id: 2, player_id: 22 }
                  ])

Match.create(
  date_played: '11/09/2020',
  match_type: '50 over',
  competition: 'Australia in England ODI series',
  location: 'Manchester',
  summary: 'Australia (9/294 from 50 overs) beat England (9/275 from 50 overs) by 19 runs',
  home_team_id: 2,
  away_team_id: 1,
  outcome: 'away team win'
)

Inning.create!([
                 { match_id: 1, number: 1, bat_team: 'away' },
                 { match_id: 1, number: 2, bat_team: 'home' }
               ])

BatInning.create!([
                    { player_id: 1, inning_id: 1, runs_scored: 6, balls_faced: 14, fours: 0, sixes: 0, did_bat: true, position: 1, is_keeper: false, is_captain: false },
                    { player_id: 2, inning_id: 1, runs_scored: 16, balls_faced: 25, fours: 3, sixes: 0, did_bat: true, position: 2, is_keeper: false, is_captain: true },
                    { player_id: 3, inning_id: 1, runs_scored: 43, balls_faced: 34, fours: 6, sixes: 0, did_bat: true, position: 3, is_keeper: false, is_captain: false },
                    { player_id: 4, inning_id: 1, runs_scored: 21, balls_faced: 30, fours: 1, sixes: 0, did_bat: true, position: 4, is_keeper: false, is_captain: false },
                    { player_id: 5, inning_id: 1, runs_scored: 73, balls_faced: 100, fours: 6, sixes: 0, did_bat: true, position: 5, is_keeper: false, is_captain: false },
                    { player_id: 6, inning_id: 1, runs_scored: 10, balls_faced: 10, fours: 1, sixes: 0, did_bat: true, position: 6, is_keeper: true, is_captain: false },
                    { player_id: 7, inning_id: 1, runs_scored: 77, balls_faced: 59, fours: 4, sixes: 4, did_bat: true, position: 7, is_keeper: false, is_captain: false },
                    { player_id: 8, inning_id: 1, runs_scored: 9, balls_faced: 7, fours: 1, sixes: 0, did_bat: true, position: 8, is_keeper: false, is_captain: false },
                    { player_id: 9, inning_id: 1, runs_scored: 19, balls_faced: 12, fours: 1, sixes: 1, did_bat: true, position: 9, is_keeper: false, is_captain: false },
                    { player_id: 10, inning_id: 1, runs_scored: 5, balls_faced: 9, fours: 0, sixes: 0, did_bat: true, position: 10, is_keeper: false, is_captain: false },
                    { player_id: 11, inning_id: 1, runs_scored: 0, balls_faced: 0, fours: 0, sixes: 0, did_bat: true, position: 11, is_keeper: false, is_captain: false },
                    { player_id: 12, inning_id: 2, runs_scored: 3, balls_faced: 12, fours: 0, sixes: 0, did_bat: true, position: 1, is_keeper: false, is_captain: false },
                    { player_id: 13, inning_id: 2, runs_scored: 84, balls_faced: 107, fours: 4, sixes: 4, did_bat: true, position: 2, is_keeper: false, is_captain: false },
                    { player_id: 14, inning_id: 2, runs_scored: 1, balls_faced: 11, fours: 0, sixes: 0, did_bat: true, position: 3, is_keeper: false, is_captain: false },
                    { player_id: 15, inning_id: 2, runs_scored: 23, balls_faced: 18, fours: 2, sixes: 1, did_bat: true, position: 4, is_keeper: false, is_captain: true },
                    { player_id: 16, inning_id: 2, runs_scored: 1, balls_faced: 4, fours: 0, sixes: 0, did_bat: true, position: 5, is_keeper: true, is_captain: false },
                    { player_id: 17, inning_id: 2, runs_scored: 118, balls_faced: 110, fours: 14, sixes: 2, did_bat: true, position: 6, is_keeper: false, is_captain: false },
                    { player_id: 18, inning_id: 2, runs_scored: 6, balls_faced: 13, fours: 0, sixes: 0, did_bat: true, position: 7, is_keeper: false, is_captain: false },
                    { player_id: 19, inning_id: 2, runs_scored: 10, balls_faced: 11, fours: 1, sixes: 0, did_bat: true, position: 8, is_keeper: false, is_captain: false },
                    { player_id: 20, inning_id: 2, runs_scored: 5, balls_faced: 5, fours: 0, sixes: 0, did_bat: true, position: 9, is_keeper: false, is_captain: false },
                    { player_id: 21, inning_id: 2, runs_scored: 8, balls_faced: 10, fours: 0, sixes: 0, did_bat: true, position: 10, is_keeper: false, is_captain: false },
                    { player_id: 22, inning_id: 2, runs_scored: 0, balls_faced: 0, fours: 0, sixes: 0, did_bat: false, position: 11, is_keeper: false, is_captain: false }
                  ])

BowlInning.create!([
                     { player_id: 19, inning_id: 1, dots: 29, runs_conceded: 59, deliveries: 60, fours: 6, sixes: 1, wides: 1, no_balls: 0, maidens: 0, did_bowl: true, position: 1 },
                     { player_id: 21, inning_id: 1, dots: 36, runs_conceded: 57, deliveries: 60, fours: 4, sixes: 2, wides: 3, no_balls: 0, maidens: 0, did_bowl: true, position: 2 },
                     { player_id: 22, inning_id: 1, dots: 28, runs_conceded: 54, deliveries: 60, fours: 5, sixes: 0, wides: 1, no_balls: 0, maidens: 0, did_bowl: true, position: 3 },
                     { player_id: 18, inning_id: 1, dots: 25, runs_conceded: 59, deliveries: 60, fours: 6, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: true, position: 4 },
                     { player_id: 20, inning_id: 1, dots: 23, runs_conceded: 55, deliveries: 60, fours: 2, sixes: 2, wides: 0, no_balls: 0, maidens: 0, did_bowl: true, position: 5 },
                     { player_id: 12, inning_id: 1, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 6 },
                     { player_id: 13, inning_id: 1, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 7 },
                     { player_id: 14, inning_id: 1, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 8 },
                     { player_id: 15, inning_id: 1, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 9 },
                     { player_id: 16, inning_id: 1, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 10 },
                     { player_id: 17, inning_id: 1, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 11 },
                     { player_id: 9, inning_id: 2, dots: 36, runs_conceded: 47, deliveries: 60, fours: 4, sixes: 1, wides: 1, no_balls: 0, maidens: 0, did_bowl: true, position: 1 },
                     { player_id: 11, inning_id: 2, dots: 45, runs_conceded: 26, deliveries: 60, fours: 1, sixes: 1, wides: 1, no_balls: 0, maidens: 3, did_bowl: true, position: 2 },
                     { player_id: 8, inning_id: 2, dots: 28, runs_conceded: 74, deliveries: 60, fours: 8, sixes: 2, wides: 1, no_balls: 0, maidens: 0, did_bowl: true, position: 3 },
                     { player_id: 10, inning_id: 2, dots: 32, runs_conceded: 55, deliveries: 60, fours: 4, sixes: 2, wides: 1, no_balls: 0, maidens: 0, did_bowl: true, position: 4 },
                     { player_id: 5, inning_id: 2, dots: 15, runs_conceded: 29, deliveries: 30, fours: 2, sixes: 1, wides: 0, no_balls: 0, maidens: 1, did_bowl: true, position: 5 },
                     { player_id: 7, inning_id: 2, dots: 4, runs_conceded: 19, deliveries: 18, fours: 1, sixes: 0, wides: 1, no_balls: 0, maidens: 0, did_bowl: true, position: 6 },
                     { player_id: 3, inning_id: 2, dots: 4, runs_conceded: 15, deliveries: 12, fours: 1, sixes: 0, wides: 0, no_balls: 1, maidens: 0, did_bowl: true, position: 7 },
                     { player_id: 1, inning_id: 2, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 8 },
                     { player_id: 2, inning_id: 2, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 9 },
                     { player_id: 4, inning_id: 2, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 10 },
                     { player_id: 6, inning_id: 2, dots: 0, runs_conceded: 0, deliveries: 0, fours: 0, sixes: 0, wides: 0, no_balls: 0, maidens: 0, did_bowl: false, position: 11 }
                   ])

Wicket.create!([
                 { inning_id: 1, batter_id: 1, bowler_id: 21, dismissal_type: 'bowled', fell_at: '1/13-19' },
                 { inning_id: 1, batter_id: 2, bowler_id: 22, dismissal_type: 'caught keeper', fell_at: '2/43-55', caught_by_id: 16 },
                 { inning_id: 1, batter_id: 3, bowler_id: 22, dismissal_type: 'caught keeper', fell_at: '3/80-92', caught_by_id: 16 },
                 { inning_id: 1, batter_id: 4, bowler_id: 20, dismissal_type: 'lbw', fell_at: '4/103-116' },
                 { inning_id: 1, batter_id: 6, bowler_id: 20, dismissal_type: 'caught', fell_at: '5/123-142', caught_by_id: 17 },
                 { inning_id: 1, batter_id: 7, bowler_id: 21, dismissal_type: 'bowled', fell_at: '6/249-261' },
                 { inning_id: 1, batter_id: 8, bowler_id: 21, dismissal_type: 'caught', fell_at: '7/259-271', caught_by_id: 15 },
                 { inning_id: 1, batter_id: 5, bowler_id: 22, dismissal_type: 'lbw', fell_at: '8/273-282' },
                 { inning_id: 1, batter_id: 10, bowler_id: 19, dismissal_type: 'caught bowler', fell_at: '9/288-299', caught_by_id: 19 },
                 { inning_id: 2, batter_id: 12, bowler_id: 11, dismissal_type: 'caught bowler', fell_at: '1/7-23', caught_by_id: 11 },
                 { inning_id: 2, batter_id: 14, bowler_id: 11, dismissal_type: 'caught keeper', fell_at: '2/13-43', caught_by_id: 6 },
                 { inning_id: 2, batter_id: 15, bowler_id: 10, dismissal_type: 'caught', fell_at: '3/55-89', caught_by_id: 7 },
                 { inning_id: 2, batter_id: 16, bowler_id: 10, dismissal_type: 'caught', fell_at: '4/57-97', caught_by_id: 4 },
                 { inning_id: 2, batter_id: 13, bowler_id: 10, dismissal_type: 'caught', fell_at: '5/170-212', caught_by_id: 11 },
                 { inning_id: 2, batter_id: 18, bowler_id: 11, dismissal_type: 'caught', fell_at: '6/182-232', caught_by_id: 4 },
                 { inning_id: 2, batter_id: 19, bowler_id: 10, dismissal_type: 'caught', fell_at: '7/223-261', caught_by_id: 7 },
                 { inning_id: 2, batter_id: 20, bowler_id: 8, dismissal_type: 'caught', fell_at: '8/234-268', caught_by_id: 7 },
                 { inning_id: 2, batter_id: 17, bowler_id: 5, dismissal_type: 'caught', fell_at: '9/275-300', caught_by_id: 1 }
               ])

Extra.create!([
                { inning_id: 1, byes: 8, leg_byes: 2, penalties: 0 },
                { inning_id: 2, byes: 0, leg_byes: 10, penalties: 0 }
              ])

User.create!(username: 'admin', password: 'password')

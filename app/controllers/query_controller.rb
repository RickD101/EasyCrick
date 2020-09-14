class QueryController < ApplicationController
  def list_all_players
    player_list = Player.all.as_json
    render json: strip_fields(player_list)
  end

  def player_summary
    name = params[:name].gsub(/_/, ' ')
    player = Player.find_by(name: name)
    player_hash = player.as_json

    # General stats
    player_hash[:matches_played] = player.matches.all.as_json.length

    # Batting Stats
    dismissals = player.dismissals.all.as_json.length
    bat_innings = 0
    runs_scored = 0
    high_score = 0
    balls_faced = 0
    hundreds = 0
    fifties = 0
    fours = 0
    sixes = 0
    
    player.bat_innings.all.as_json.each do |inning|
      bat_innings += 1 if inning['did_bat']
      runs_scored += inning['runs_scored']
      balls_faced += inning['balls_faced']
      fours += inning['fours']
      sixes += inning['sixes']
      hundreds += 1 if inning['runs_scored'] > 99
      fifties += 1 if inning['runs_scored'] > 49 && inning['runs_scored'] < 99
      high_score = inning['runs_scored'] if inning['runs_scored'] > high_score
    end

    player_hash[:batting_stats] = {}
    player_hash[:batting_stats][:batting_innings] = bat_innings
    player_hash[:batting_stats][:not_outs] = bat_innings - dismissals
    player_hash[:batting_stats][:runs_scored] = runs_scored
    player_hash[:batting_stats][:high_score] = high_score
    player_hash[:batting_stats][:batting_average] = (runs_scored.to_f / dismissals).round(2)
    player_hash[:batting_stats][:balls_faced] = balls_faced
    player_hash[:batting_stats][:batting_strike_rate] = ((runs_scored.to_f / balls_faced) * 100).round(2)
    player_hash[:batting_stats][:hundreds] = hundreds
    player_hash[:batting_stats][:fifties] = fifties
    player_hash[:batting_stats][:fours] = fours
    player_hash[:batting_stats][:sixes] = sixes

    # Bowling Stats
    wickets = player.wickets.all.as_json.length
    bowl_innings = 0
    deliveries = 0
    runs_conceded = 0

    player.bowl_innings.all.as_json.each do |inning|
      bowl_innings += 1 if inning['did_bowl']
      runs_conceded += inning['runs_conceded']
      deliveries += inning['deliveries']
    end

    player_hash[:bowling_stats] = {}
    player_hash[:bowling_stats][:bowling_innings] = bowl_innings
    player_hash[:bowling_stats][:deliveries] = deliveries
    player_hash[:bowling_stats][:runs_conceded] = runs_conceded
    player_hash[:bowling_stats][:wickets] = wickets
    if wickets != 0
      player_hash[:bowling_stats][:bowling_average] = (runs_conceded.to_f / wickets).round(2)
      player_hash[:bowling_stats][:bowling_strike_rate] = (deliveries / wickets).round(2)
    else
      player_hash[:bowling_stats][:bowling_average] = nil
      player_hash[:bowling_stats][:bowling_strike_rate] = nil
    end
    player_hash[:bowling_stats][:economy] = (runs_conceded.to_f / (deliveries / 6)).round(2)

    # Fielding stats
    player_hash[:fielding_stats] = {}
    player_hash[:fielding_stats][:catches] = player.catches.all.as_json.length
    player_hash[:fielding_stats][:stumpings] = player.stumpings.all.as_json.length
    player_hash[:fielding_stats][:run_outs] = player.run_outs.all.as_json.length

    render json: strip_fields(player_hash)
  end

  private

  def strip_fields(data)
    if data.class == Array
      data.each do |entry|
        entry.delete('id')
        entry.delete('created_at')
        entry.delete('updated_at')
      end
    else
      data.delete('id')
      data.delete('created_at')
      data.delete('updated_at')
    end
    data
  end

end

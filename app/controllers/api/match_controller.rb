class Api::MatchController < ApplicationController
  before_action :user_authed

  def index
    render json: Match.all
  end

  def show
    render json: populate_match(params[:id])
  end

  def find_by
    render json: Match.where(match_params)
  end

  def create
    Match.create!(match_params)
    render json: { message: 'Match created.' }
  end

  def update
    Match.update(params[:id], match_params)
    render json: { message: 'Match updated.' }
  end

  def destroy
    Match.destroy(params[:id])
    render json: { message: 'Match deleted.' }
  end

  private

  def match_params
    params.required(:match).permit(
      :date_played,
      :match_type,
      :competition,
      :location,
      :away_team_id,
      :home_team_id,
      :outcome,
      :summary,
      innings_attributes: [
        :_destroy,
        :id,
        :number,
        :bat_team,
        bat_innings_attributes: %i[
          _destroy
          id
          player_id
          fours
          sixes
          did_bat
          position
          is_keeper
          is_captain
          runs_scored
          balls_faced
        ],
        bowl_innings_attributes: %i[
          _destroy
          id
          player_id
          dots
          fours
          sixes
          wides
          no_balls
          did_bowl
          position
          runs_conceded
          deliveries
          maidens
        ],
        extras_attributes: %i[
          _destroy
          id
          leg_byes
          byes
          penalties
        ],
        wickets_attributes: %i[
          _destroy
          id
          batter_id
          bowler_id
          dismissal_type
          fell_at
          caught_by_id
          run_out_by_id
          stumped_by_id
        ]
      ]
    )
  end

  def populate_match(id)
    match = Match.find(id)
    innings = match.innings.all

    match_hash = match.as_json
    match_hash[:innings_attributes] = innings.as_json

    innings.all.each_with_index do |inning, i|
      match_hash[:innings_attributes][i][:bat_innings_attributes] = inning.bat_innings.all.as_json
      match_hash[:innings_attributes][i][:bowl_innings_attributes] = inning.bowl_innings.all.as_json
      match_hash[:innings_attributes][i][:wickets_attributes] = inning.wickets.all.as_json
      match_hash[:innings_attributes][i][:extras_attributes] = inning.extras.as_json
    end

    match_hash
  end

end

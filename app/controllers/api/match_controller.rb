class Api::MatchController < ApplicationController
  before_action :user_authed, except: [:index, :show, :find_by]

  # public routes
  def index
    render json: Match.all
  end

  def show
    match = Match.find(params[:id])
    innings = match.innings.all

    bat_innings = []
    bowl_innings = []
    extras = []
    wickets = []

    innings.each do |inning|
      bat_innings.push(inning.bat_innings.all)
      bowl_innings.push(inning.bowl_innings.all)
      extras.push(inning.extra)
      wickets.push(inning.wickets.all)
    end

    render json: {
      match: match,
      innings: innings,
      bat_innings: bat_innings,
      bowl_innings: bowl_innings,
      extras: extras,
      wickets: wickets
    }
  end

  def find_by
    render json: Match.where(match_params)
  end

  # protected routes
  def create
    new_team = Team.create!(team_params)
    render json: { message: "#{new_team.name} created." }
  end

  def update
    upd_team = Team.update(params[:id], team_params)
    render json: { message: "#{upd_team.name} updated." }
  end

  def destroy
    del_team = Team.find(params[:id]).delete
    render json: { message: "#{del_team.name} deleted." }
  end

  def add_player
    TeamPlayer.create!(team_id: params[:id].to_i, player_id: params[:player_id].to_i)
    render json: { message: 'Association created.' }
  end

  def remove_player
    TeamPlayer.where(team_id: params[:id].to_i, player_id: params[:player_id].to_i).destroy_all
    render json: { message: 'Association deleted.' }
  end

  private

  def match_params
    params.required(:match).permit(
      :name,
      :match_type,
      :competition,
      :location
    )
  end

  def inning_params
    params.required(:inning).permit(
      :number,
      :bat_team,
      :bowl_team
    )
  end

  def bat_inning_params
    params.required(:bat_inning).permit(
      :player_id,
      :dots,
      :ones,
      :twos,
      :threes,
      :fours,
      :fives,
      :sixes,
      :out,
      :did_bat,
      :position,
      :is_keeper,
      :is_captain
    )
  end

  def bowl_inning_params
    params.required(:bowl_inning).permit(
      :player_id,
      :inning_id,
      :dots,
      :ones,
      :twos,
      :threes,
      :fours,
      :fives,
      :sixes,
      :wides,
      :no_balls,
      :did_bowl,
      :position,
      :is_keeper,
      :is_captain
    )
  end

  def extras_params
    params.required(:extras).permit(
      :leg_byes,
      :byes
    )
  end

  def wicket_params
    params.required(:wicket).permit(
      :name,
      :match_type,
      :competition,
      :location
    )
  end

end

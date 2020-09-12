class Api::TeamController < ApplicationController
  before_action :user_authed, except: [:index, :show, :find_by, :find_players]

  # public routes
  def index
    render json: Team.all
  end

  def show
    render json: Team.find(params[:id])
  end

  def find_by
    render json: Team.where(team_params)
  end

  def find_players
    render json: Team.find(params[:id]).players.all
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

  def team_params
    params.required(:team).permit(:name, :homeground)
  end
end

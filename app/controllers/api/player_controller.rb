class Api::PlayerController < ApplicationController
  before_action :user_authed

  def index
    render json: Player.all
  end

  def show
    render json: Player.find(params[:id])
  end

  def find_by
    render json: Player.where(player_params)
  end

  def find_teams
    render json: Player.find(params[:id]).teams.all
  end

  def create
    new_player = Player.create!(player_params)
    render json: { message: "#{new_player.name} created." }
  end

  def update
    upd_player = Player.update(params[:id], player_params)
    render json: { message: "#{upd_player.name} updated." }
  end

  def destroy
    del_player = Player.find(params[:id]).delete
    render json: { message: "#{del_player.name} deleted." }
  end

  private

  def player_params
    params.required(:player).permit(
      :name,
      :DOB,
      :role,
      :bat_style,
      :bowl_style
    )
  end
end

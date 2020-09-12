class Api::UserController < ApplicationController
  before_action :user_authed, except: [:create, :login]

  # user CRUD methods
  def create
    if !User.find_by(username: user_params[:username])
      new_user = User.create!(user_params)
      render json: { message: "#{new_user.username} created." }
    else
      render json: { message: 'Username already exists.' }, status: :conflict
    end
  end

  def update
    upd_user = User.update(@user_id, user_params)
    render json: { message: "#{upd_user.username} updated." }
  end

  def destroy
    del_user = User.destroy(@user_id)
    render json: { message: "#{del_user.username} deleted." }
  end

  # authorisation methods
  def login
    user = User.find_by(username: user_params[:username])

    if user&.authenticate(user_params[:password])
      token = encode_token(user.id, user.username)
      render json: { message: "#{user.username} logged in.", token: token }
    elsif user
      render json: { message: 'Incorrect password.' }, status: :unauthorized
    else
      render json: { message: 'User not found.' }, status: :not_found
    end
  end

  def status
    render json: {
      message: "#{@user_name} is logged in.",
      id: @user_id,
      username: @user_name,
      login_expires: "#{(@token_expiry - Time.now.to_i)/60} minutes."
    }
  end

  private

  def user_params
    params.required(:user).permit(:username, :password)
  end
end
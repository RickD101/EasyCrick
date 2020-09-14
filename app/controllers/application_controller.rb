class ApplicationController < ActionController::API
  # user authorisation 'middleware'
  def encode_token(user_id, user_username)
    exp = Time.now.to_i + 3600
    payload = {id: user_id, username: user_username, exp: exp}
    JWT.encode(payload, 'idontlikecricket')
  end

  def decode_token
    auth_token = request.headers['Authorization']

    if auth_token
      begin
        payload = JWT.decode(auth_token, 'idontlikecricket')
        @user_id = payload[0]['id']
        @user_name = payload[0]['username']
        @token_expiry = payload[0]['exp']
        true
      rescue StandardError
        false
      end
    else
      false
    end
  end

  def user_authed
    render json: { message: 'Please login.' }, status: :unauthorized unless decode_token
  end

end
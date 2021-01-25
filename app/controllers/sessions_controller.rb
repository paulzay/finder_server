class SessionsController < ApplicationController
  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      payload = { user_id: @user.id }
      token = encode_token(payload)
      render json: { user: @user, jwt: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end
end

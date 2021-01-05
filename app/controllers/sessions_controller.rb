class SessionsController < ApplicationController
  def create
    user = User.find_by(username: session_params[:username])
    if user&.authenticate(session_params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: {
        user: user,
        jwt: token
      }
    else
      render json: { status: 'error',
                     message: 'Wrong email/password/username combination' }
    end
  end

  def auto_login
    if session_user
      render json: session_user
    else
      render json: { errors: 'No User Logged In.' }
    end
  end

  def destroy
    reset_session
    render json: { message: 'Log Out Success' }
  end

  private

  def session_params
    params.require(:user).permit(:username, :password, :email)
  end
end

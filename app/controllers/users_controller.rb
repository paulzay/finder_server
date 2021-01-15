class UsersController < ApplicationController
  def index
    @users = User.all
    if @users
      render json: {
        users: @users
      }
    else
      render json: {
        errors: ['no users found']
      },
             status: 500
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: {
        user: @user
      }
    else
      render json: {
        errors: ['user not found']
      },
             status: 500
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: {
        user: user,
        jwt: token
      },
             status: 201
    else
      render json: {
        errors: user.errors.full_messages
      }

    end
  end

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

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end

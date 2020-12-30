# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_car, only: %i[create destroy]
  before_action :find_favorite, only: [:destroy]
  before_action :session_user

  def index
    if session_user
      render json: session_user.favorites
    else
      render json: { errors: 'No User Logged In.' }
    end
  end

  def create
    favorite = Favorite.new(user_id: session_user.id, car_id: @car.id)
    render json: 'we added to your faves' if favorite.save
  end

  def destroy
    favorite = session_user.favorites.find(params[:id])
    render json: 'removed from faves' if favorite.destroy
  end

  private

  def find_favorite
    @favorite = @car.favorites.find(params[:id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def already_favorited?
    @favorite.where(user_id: current_user.id, car_id: params[:car_id]).exists?
  end
end

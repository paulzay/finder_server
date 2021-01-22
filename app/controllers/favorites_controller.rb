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
  	if already_favorited?
  		render json: { error: 'Already Added to favorites' }
    else
    	favorite = Favorite.new(user_id: session_user.id, car_id: @car.id)
    	render json: 'Added to favorites' if favorite.save
    end
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
    Favorite.where(user_id: session_user.id, car_id: params[:car_id]).exists?
  end
end

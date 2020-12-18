# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_car
  before_action :find_favorite, only: [:destroy]

  def create
    if already_favorited?
      flash[:notice] = "You can't favorite more than once"
    else
      @car.favorites.create(user_id: current_user.id)
    end
    redirect_to car_path(@car)
  end

  def destroy
    if !already_favorited?
      flash[:notice] = 'Cannot unfavorite'
    else
      @favorite.destroy
    end
    redirect_to car_path(@car)
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

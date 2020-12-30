# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :find_car, only: %i[show update destroy]
  # before_action :logged_in?, only: %i[create destroy]

  def index
    @cars = Car.all
    render json: @cars
  end

  def show
    render json: @car
  end

  def create
    # @car = current_user.cars.build(car_params)
    @car = Car.new(car_params)

    if @car.save
      render json: @car
    else
      render error: { error: 'unable to create car' }, status: 400
    end
  end

  def update
    if @car
      @car.update(car_params)
      render json: { message: 'updated successfully' }, status: 200
    else
      render json: { error: 'unable to update' }, status: 400
    end
  end

  def destroy
    if @car
      @car.destroy
      render json: { message: 'deleted successfully' }, status: 200
    else
      render json: { error: 'error' }, status: 400
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :description, :image_url)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
# @car.user_id = current_user.id
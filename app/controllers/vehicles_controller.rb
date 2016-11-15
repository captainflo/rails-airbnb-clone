class VehiclesController < ApplicationController
before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  def index
    @vehicles = Vehicle.all
  end

  def show

  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to @vehicle
    else
      render :new
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

private

  def set_vehicle
  @vehicle = Vehicle.find(param[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:user, :description, :marque, :category, :rating )
  end

end

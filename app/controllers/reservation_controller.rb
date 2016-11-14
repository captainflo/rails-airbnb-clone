class ReservationController < ApplicationController
  def index
    @vehicles = vehicles.all
  end

  def show
    @vehicles = vehicles
  end

  def new
    @vehiles
  end

  def create
  end

  def edit

  end

  def update

  end

  def destroy
    @vehicles = vehicle.destroy
  end
end

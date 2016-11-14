class ReservationController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicles = Vehicles.find(params[:id])
  end

  def new
    @vehicles = Vehicles.new
  end

  def create
  end

  def edit

  end

  def update

  end

  def destroy
    @vehicles = Vehicle.destroy
  end
end

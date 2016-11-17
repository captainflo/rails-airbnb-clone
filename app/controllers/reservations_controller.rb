class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_vehicle

  def index
    @reservations = @vehicle.reservations
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @vehicle.reservations.new(reservation_params)
    if @reservation.save
      redirect_to @vehicle
    else
      render @vehicle
    end
  end

  def edit
  end

  def update
    @vehicle.update
  end

  def destroy
    @reservation.destroy
    redirect_to @vehicle
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user, :vehicle, :available, :start_date, :end_start)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end
end

class ReservationController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to @reservation
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

  def set_reservation
    @reservation = Reservation.find(param[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user, :vehicle, :available, :start_date, :end_start)
  end
end

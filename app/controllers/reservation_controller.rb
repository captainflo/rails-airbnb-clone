class ReservationController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservations = Reservation.find(params[:id])
  end

  def new
    @reservations = Reservation.new
  end

  def create
    @reservations = Reservation.new(user_params)
  end

  def edit

  end

  def update

  end

  def destroy
    @reservations = Reservation.destroy
  end
end

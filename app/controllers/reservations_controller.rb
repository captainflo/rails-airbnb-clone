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
    params.require(:reservation).permit(:user, :vehicle, :available, :start_date, :end_date)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def range_params
    start_year = reservation_params["start_date(1i)"].to_i
    start_month = reservation_params["start_date(2i)"].to_i
    start_day = reservation_params["start_date(3i)"].to_i
    end_year = reservation_params["end_date(1i)"].to_i
    end_month = reservation_params["end_date(2i)"].to_i
    end_day = reservation_params["end_date(3i)"].to_i
    st_date = Date.new(start_year,start_month,start_day).to_i
    en_date = Date.new(end_year,end_month,end_day).to_i

    range_date = [st_date..en_date]
  end
end

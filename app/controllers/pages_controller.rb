class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @vehicle = Vehicle.new
    @categories = Category.all
    @reviews = Review.all
    @vehicle_one = Vehicle.all.sample
    @vehicle_two = Vehicle.all.sample
    @vehicle_three = Vehicle.all.sample
  end

  def dashboard
    @selfreserv = []
    Reservation.all.each do |res|
      @selfreserv << res  if res.vehicle.user == current_user
    end
    
  end

end

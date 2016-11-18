class ReviewsController < ApplicationController
  before_action :find_vehicle, only: [ :new, :create ]

  def new
    @review = @vehicle.reviews.new
  end

  def create
    @review = @vehicle.reviews.build(review_params)
    @review.user = current_user
    if @review.save
    redirect_to vehicle_path(@vehicle.id)
    else
      @reservation = Reservation.new
      render '/vehicles/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  def find_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end
end

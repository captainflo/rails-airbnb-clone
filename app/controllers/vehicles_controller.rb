class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @vehicles = params_search[:city].blank? ? Vehicle.all : Vehicle.near(params_search[:city], 10)
    @vehicles = params_search[:category].to_i == 0 ? @vehicles : @vehicles.where(category: Category.find(params_search[:category].to_i))

    @hash = Gmaps4rails.build_markers(@vehicles) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def show
    @reservations = @vehicle.reservations
    @reservation = @vehicle.reservations.new
    @review = @vehicle.reviews.new
    @reviews = Review.where(vehicle_id: @vehicle.id)
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @vehicle = Vehicle.new
    @categories = Category.all
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    Cloudinary::Uploader.upload(vehicle_params[:photo])
    if @vehicle.save
      redirect_to @vehicle
    else
      render :new
    end
  end

  def edit
  end

  def update
    @vehicle.update(param)
    redirect_to vehicle_path(@vehicle)
  end

  def destroy
    if @vehicle.user == current_user
    @vehicle.destroy
  end
    redirect_to request.referer
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def param
    params.require(:vehicle).permit(:user, :description, :marque, :category, :city, :photo, :photo_cache)
  end

  def vehicle_params
    {marque: param[:marque],
     description: param[:description],
     user: current_user, city: param[:city],
     category: Category.find(param[:category].to_i),
     photo: param[:photo]}
   end

   def params_search
    params[:search]
  end
end

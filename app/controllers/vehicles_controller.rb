class VehiclesController < ApplicationController
before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  def index
    @vehicles = Vehicle.near(params_search[:city], 10)

    @vehicles = @vehicles.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@vehicles) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end

    @vehicles.where(category: Category.find(params_search[:category].to_i))

  end

  def show

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
  end

  def destroy
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

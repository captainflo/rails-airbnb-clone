class VehiclesController < ApplicationController
before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  def index
    @vehicles = Vehicle.near(params_search[:city], 10)
    @vehicles.where(category: Category.find(params_search[:category].to_i))
  end

  def show

  end

  def new
    @vehicle = Vehicle.new
    @categories = Category.all
  end

  def create
    @vehicle = Vehicle.new(marque: vehicle_params[:marque],
     description: vehicle_params[:description],
      user: current_user, city: vehicle_params[:city],
       category: Category.find(vehicle_params[:category].to_i))

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

  def vehicle_params
    params.require(:vehicle).permit(:user, :description, :marque, :category, :city)
  end

  def params_search
    params[:search]
  end
end

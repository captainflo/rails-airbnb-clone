class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @vehicle = Vehicle.new
    @categories = Category.all
    @vehicles = Vehicle.all
  end
end

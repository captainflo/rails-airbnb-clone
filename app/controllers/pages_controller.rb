class PagesController < ApplicationController
  def home
    belongs_to: user
    belongs_to: vehicles
  end
end

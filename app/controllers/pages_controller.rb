class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def home
    @stations = Station.all
  end

  def search
  end
end

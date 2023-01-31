class SunscreensController < ApplicationController
  def show
    @sunscreen = Sunscreen.find(params[:id])
  end

  def index
    @sunscreens = Sunscreen.all
  end
end

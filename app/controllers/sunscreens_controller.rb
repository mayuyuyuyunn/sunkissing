class SunscreensController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  def show
    @sunscreen = Sunscreen.find(params[:id])
  end

  def index
    @sunscreens = Sunscreen.all
  end
  
  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Sunscreen.ransack(params[:q])
  end
end

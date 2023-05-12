class SunscreensController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  def show
    @sunscreen = Sunscreen.find(params[:id])
  end

  def index
    @sunscreens = Sunscreen.all
  end
  
  def search
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @results = @tag.sunscreens.all
    else
      @results = @q.result
    end
  end

  private

  def set_q
    @q = Sunscreen.ransack(params[:q])
  end

end

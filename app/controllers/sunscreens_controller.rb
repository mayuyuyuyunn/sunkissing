class SunscreensController < ApplicationController
  before_action :set_q, only: %i[index search]

  def show
    @sunscreen = Sunscreen.find(params[:id])
  end

  def index
    @sunscreens = Sunscreen.all.order(price: :asc)
  end

  def search
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @results = @tag.sunscreens.all.order(price: :asc)
    else
      @results = @q.result.order(price: :asc)
    end
  end

  private

  def set_q
    @q = Sunscreen.ransack(params[:q])
  end
end

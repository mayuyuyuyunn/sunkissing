class Admin::SunscreensController < Admin::ApplicationController
  before_action :set_sunscreen, only: %i[edit update show destroy]

  def new
    @sunscreen = Sunscreen.new
  end

  def create
    @sunscreen = Sunscreen.new(sunscreen_params)
    if @sunscreen.save
      flash[:success] = t('defaults.message.created', item: Sunscreen.model_name.human)
      redirect_to admin_sunscreens_path
    else
      flash.now[:error] = t('defaults.message.not_created', item: Sunscreen.model_name.human)
      render :new
    end
  end

  def index
    @sunscreens = @sunscreens = Sunscreen.all.order(id: :asc)
  end

  def edit; end

  def update
    if @sunscreen.update(sunscreen_params)
      redirect_to admin_sunscreens_path, success: t('defaults.message.updated', item: Sunscreen.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Sunscreen.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @sunscreen.destroy!
    redirect_to admin_sunscreens_path, success: t('defaults.message.deleted', item: Sunscreen.model_name.human)
  end

  private

  def set_sunscreen
    @sunscreen = Sunscreen.find(params[:id])
  end

  def sunscreen_params
    params.require(:sunscreen).permit(:name, :spf, :pa, :capacity, :price, :manufacture, :brand, :summary, :rakuten_url, :rakuten_image_url)
  end
end

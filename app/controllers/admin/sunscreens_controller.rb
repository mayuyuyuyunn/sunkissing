class Admin::SunscreensController < Admin::applicationController
  before_action :set_sunscreen, only: %i[edit update show destroy]

  def new
    @suncreen = Sunscreen.new
  end

  def create
    if @suncreen.save(sunscreen_params)
      flash[:success] = t('defaults.message.created', item: Sunscreen.model_name.human)
      redirect_to root_path
    else
      render :edit
      flash.now[:error] =  t('defaults.message.not_created', item: Sunscreen.model_name.human)
    end
  end

  def index
    @sunscreens = Sunscreen.all
  end

  def edit; end

  def update
    if @sunscreen.update(sunscreen_params)
      redirect_to admin_sunscreen_path(@sunscreens), success: t('defaults.message.updated', item: Sunscreen.model_name.human)
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
    params.require(:sunscreen).permit(:name, :price, :spf, :pa, :summary, :brand, :manufacture, :capacity, :rakuten_url, :rakten_image_url)
  end
end

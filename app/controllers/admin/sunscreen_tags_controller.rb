class Admin::SunscreenTagsController < Admin::ApplicationController
  def new
    @sunscreen_tag_tag = SunscreenTag.new
  end

  def create
    @sunscreen_tag = SunscreenTag.new(sunscreen_params)
    if @sunscreen_tag.save
      flash[:success] = t('defaults.message.created', item: Sunscreen.model_name.human)
      redirect_to admin_sunscreens_path
    else
      flash.now[:error] =  t('defaults.message.not_created', item: Sunscreen.model_name.human)
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def sunscreen_tag_params
    params.require(:sunscreen_tag).permit(:sunscreen_id, :tag_id)
  end
end

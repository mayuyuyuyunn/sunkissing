class Admin::OdekakeTypesController < Admin::applicationController
  before_action :set_odekake_type, only: %i[edit update show destroy]

  def new
    @suncreen = OdekakeType.new
  end

  def create
    if @suncreen.save(odekake_type_params)
      flash[:success] = t('defaults.message.created', item: OdekakeType.model_name.human)
      redirect_to root_path
    else
      render :edit
      flash.now[:error] =  t('defaults.message.not_created', item: OdekakeType.model_name.human)
    end
  end

  def index
    @odekake_types = OdekakeType.all
  end

  def edit; end

  def update
    if @odekake_type.update(odekake_type_params)
      redirect_to admin_odekake_type_path(@odekake_types), success: t('defaults.message.updated', item: OdekakeType.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: OdekakeType.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @odekake_type.destroy!
    redirect_to admin_odekake_types_path, success: t('defaults.message.deleted', item: OdekakeType.model_name.human)
  end

  private

  def set_odekake_type
    @odekake_type = OdekakeType.find(params[:id])
  end

  def odekake_type_params
    params.require(:odekake_type).permit(:name)
  end
end

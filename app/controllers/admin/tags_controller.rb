class Admin::TagsController < Admin::ApplicationController
  before_action :set_tag, only: %i[edit update show destroy]

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = t('defaults.message.created', item: Tag.model_name.human)
      redirect_to admin_tags_path
    else
      flash.now[:error] =  t('defaults.message.not_created', item: Tag.model_name.human)
      render :new
    end
  end

  def index
    @tags = Tag.all.order(id: :asc)
  end

  def edit; end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path, success: t('defaults.message.updated', item: Tag.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Tag.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @tag.destroy!
    redirect_to admin_tags_path, success: t('defaults.message.deleted', item: Tag.model_name.human)
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end

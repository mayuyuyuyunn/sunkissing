class Admin::SunscreenTagsController < Admin::ApplicationController
  def index
    @sunscreen_tags = SunscreenTag.all.order(id: :asc)
  end

  def new
    @sunscreen_tag = SunscreenTag.new
    @sunscreens = Sunscreen.all
    @tags = Tag.all
  end

  def create
    sunscreen_id = sunscreen_tag_params[:sunscreen_id]
    tag_ids = sunscreen_tag_params[:tag_ids].reject(&:empty?)

    # 保存が失敗したかどうかを示す
    failed_to_save = false
    # 新しいタグを入れるための空の配列を準備
    new_tags = []

    tag_ids.each do |tag_id|
      next if SunscreenTag.exists?(sunscreen_id:, tag_id:)

      sunscreen_tag = SunscreenTag.new(sunscreen_id:, tag_id:)
      if sunscreen_tag.save
        new_tags << sunscreen_tag
      else
        failed_to_save = true
      end
    end

    if new_tags.empty?
      flash[:danger] = '新しい日焼け止めタグがありませんでした。'
    elsif failed_to_save
      flash[:danger] = '一部の日焼け止めタグが登録できませんでした。'
    else
      flash[:success] = '日焼け止めタグが正常に登録されました。'
    end

    redirect_to admin_sunscreen_tags_path
  end

  def destroy
    @sunscreen_tag = SunscreenTag.find(params[:id])
    @sunscreen_tag.destroy!
    redirect_to admin_sunscreen_tags_path
    flash[:successt] = '日焼け止めタグを削除しました。'
  end

  private

  def sunscreen_tag_params
    params.require(:sunscreen_tag).permit(:id, :sunscreen_id, tag_ids: [])
  end
end

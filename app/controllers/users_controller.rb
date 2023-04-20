class UsersController < ApplicationController
  require 'net/http'
  require 'uri'

  before_action :set_user, only: %i[edit update show]

  def new
    if current_user
      redirect_to after_login_path
    end
  end

  def create
    id_token = params[:idToken]
    channel_id = '1657853635'
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), {'id_token'=>id_token, 'client_id'=>channel_id})
    line_user_id = JSON.parse(res.body)["sub"]
    user = User.find_by(line_user_id: line_user_id)
    logger.debug('ここだよ')
    logger.debug(id_token)
    logger.debug(JSON.parse(res.body))
    logger.debug(user)
    logger.debug('ここまで')
    if user.nil?
      user = User.create(line_user_id: line_user_id)
    elsif
      session[:user_id] = user.id
      render :json => user
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールの登録をしました！"
      redirect_to root_path
    else
      render :edit
      flash.now[:error] = "プロフィールの登録に失敗しました"
    end
  end

  def show; end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:gender, :age, :skin_type, :prefecture_id)
  end
end

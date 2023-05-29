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
    line_user_authenticate = LineUserAuthenticateService.new(params[:idToken])
    line_user_authenticate.call
    user = line_user_authenticate.search_user
    if user.nil?
      user = User.create(line_user_id: line_user_authenticate.line_user_id)
      session[:user_id] = user.id
      render json: user
    elsif user
      session[:user_id] = user.id
      render json: user
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = t('defaults.message.updated', item: User.model_name.human)
      redirect_to root_path
    else
      render :edit
      flash.now[:error] = t('defaults.message.not_updated', item: User.model_name.human)
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

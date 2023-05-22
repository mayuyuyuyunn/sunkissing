class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: %i[show destroy]

  def index
    @users = User.all.order(id: :asc)
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

end

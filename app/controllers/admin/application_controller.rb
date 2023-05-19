class Admin::ApplicationController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def check_admin
    redirect_to root_path unless current_user.admin?
    flash.now[:error] = '管理者権限を持っていません'
  end
end

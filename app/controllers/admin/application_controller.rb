class Admin::ApplicationController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def check_admin
    redirect_to root_path if current_user.nil? || !current_user.admin?
  end
end

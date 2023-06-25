class StaticPagesController < ApplicationController
  def top
    if current_user.nil?
      render :before_login
    else
      render :after_login
    end
  end

  def privacy_policy; end

  def terms; end

  def after_login; end

  def before_login; end

  def friend; end

  def calendar
    @schedules = current_user.schedules
  end
end

class StaticPagesController < ApplicationController
  def top
    if !current_user.nil?
      render :after_login
    end
  end

  def privacy_policy
  end

  def terms
  end

  def guide
  end

  def after_login
  end

  def friend
    render layout: false
  end

  def calendar
    @schedules = current_user.schedules
  end
end

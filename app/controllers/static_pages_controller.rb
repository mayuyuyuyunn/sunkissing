class StaticPagesController < ApplicationController
  def top
    if current_user
      render :after_login
    else
      render :before_login
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

  def before_login
  end

  def friend
  end

  def calendar
    @schedules = current_user.schedules
  end
end

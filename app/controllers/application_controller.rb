class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :login_required
  helper_method :logged_in?
  before_action :set_today_schedule

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to root_path unless current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def set_today_schedule
    if logged_in?
      @schedule = current_user.schedules.find_by(leave_home_time: Date.today.all_day)
    else
      true
    end
  end
end

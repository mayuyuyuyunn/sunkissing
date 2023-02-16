class SchedulesController < ApplicationController
  before_action :login_required
  
  def new
    @schedule = current_user.schedules.new
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @schedule = current_user.schedules.find_by(leave_home_time: Date.today.all_day)
  end

  def update
    @schedule = current_user.schedules.find(params[:id])
    # もっといい書き方あるけどとりあえず
    leave_home_hour = params[:schedule]["leave_home_time(4i)"]
    leave_home_minute = params[:schedule]["leave_home_time(5i)"]
    leave_home_time = Time.parse("#{leave_home_hour}:#{leave_home_minute}")
    @schedule.leave_home_time = leave_home_time
    if @schedule.update(schedule_params)
      redirect_to root_path
    else
      @schedule = current_user.schedules.find_by(leave_home_time: Date.today.all_day)
      render :edit
    end
  end

  def destroy
  end

  def show
  end

  private
  
  def schedule_params
    params.require(:schedule).permit(:leave_home_time, :odekake_type_id).merge(user_id: current_user.id)
  end
end

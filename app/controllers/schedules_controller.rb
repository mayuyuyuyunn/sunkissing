class SchedulesController < ApplicationController
  before_action :login_required
  
  def new
    @schedule = current_user.schedules.new
    @odekake_types = OdekakeType.all
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
  end

  def update
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

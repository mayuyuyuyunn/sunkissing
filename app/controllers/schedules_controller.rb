class SchedulesController < ApplicationController
  before_action :login_required
  
  def new
    @schedule = current_user.schedules.new
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = "スケジュールを登録しました！"
      redirect_to schedule_path(@schedule.id)
    else
      flash.now[:error] = "スケジュールの登録に失敗しました"
      render :new
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy!
    flash[:success] = "スケジュールを削除しました！"
    redirect_to root_path
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private
  
  def schedule_params
    params.require(:schedule).permit(:leave_home_time, :odekake_type_id).merge(user_id: current_user.id)
  end
end

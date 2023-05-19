class Admin::SchedulesController < Admin::ApplicationController
  before_action :set_schedule, only: %i[show destroy]

  def index
    @schedules = Schedule.all
  end

  def show; end

  def destroy
    @schedule.destroy!
    redirect_to admin_schedules_path, success: t('defaults.message.deleted', item: Schedule.model_name.human)
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:leave_home_time)
  end
end

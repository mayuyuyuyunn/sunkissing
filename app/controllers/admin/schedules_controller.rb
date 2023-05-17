class Admin::SchedulesController < Admin::applicationController
  def index
    @schedules = Schedule.all
  end
end

# == Schema Information
#
# Table name: schedules
#
#  id              :bigint           not null, primary key
#  leave_home_time :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  odekake_type_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_schedules_on_odekake_type_id  (odekake_type_id)
#  index_schedules_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (odekake_type_id => odekake_types.id)
#  fk_rails_...  (user_id => users.id)
#
class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :odekake_type

  validates :leave_home_time, presence: true
  validates :odekake_type_id, presence: true
  validates :user_id, presence: true
  # createアクションのみ unique_todayバリデーション
  validate :valid_unique_today, on: :create
  # 今日の日付でスケジュールがあるかどうか
  scope :schedule_at_today, -> { where(leave_home_time: Date.today.all_day) }

  private

  def valid_unique_today
    @current_user = User.find(user.id)
    if @current_user.schedules.schedule_at_today.present?
      errors.add(:leave_home_time, '今日のスケジュールは既に登録されています')
      false
    else
      true
    end
  end
end

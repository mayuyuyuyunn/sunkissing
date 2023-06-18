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
require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'バリデーション' do
    let!(:user) { create(:user) }
    let!(:odekake_type) { create(:odekake_type) }

    it 'leave_home_timeが存在する場合、有効であること' do
      schedule = build(:schedule, user: user, odekake_type: odekake_type)
      expect(schedule).to be_valid
    end

    it 'leave_home_timeが存在しない場合、無効であること' do
      schedule = build(:schedule, user: user, odekake_type: odekake_type, leave_home_time: nil)
      expect(schedule).not_to be_valid
      expect(schedule.errors[:leave_home_time]).to include('を入力してください')
    end

    it 'odekake_type_idが存在する場合、有効であること' do
      schedule = build(:schedule, user: user, odekake_type: odekake_type)
      expect(schedule).to be_valid
    end

    it 'odekake_type_idが存在しない場合、無効であること' do
      schedule = build(:schedule, user: user, odekake_type: nil)
      expect(schedule).not_to be_valid
      expect(schedule.errors[:odekake_type_id]).to include('を入力してください')
    end

    context 'カスタムバリデーション' do
      it '今日のスケジュールが存在しない場合、有効であること' do
        schedule = build(:schedule, user: user, odekake_type: odekake_type)
        expect(schedule).to be_valid
      end

      it '今日のスケジュールが既に存在する場合、無効であること' do
        create(:schedule, user: user, odekake_type: odekake_type, leave_home_time: Date.today)
        schedule = build(:schedule, user: user, odekake_type: odekake_type, leave_home_time: Date.today)
        expect(schedule).not_to be_valid
        expect(schedule.errors[:leave_home_time]).to include('今日のスケジュールは既に登録されています')
      end
    end
  end

  describe 'カスタムメソッド' do
    it 'start_timeメソッドがleave_home_timeを返すこと' do
      schedule = create(:schedule)
      expect(schedule.start_time).to eq(schedule.leave_home_time)
    end
  end
end

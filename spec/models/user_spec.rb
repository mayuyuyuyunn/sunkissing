# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  age           :integer          default("age_not_selected"), not null
#  gender        :integer          default("gender_not_selected"), not null
#  role          :integer          default("general"), not null
#  skin_type     :integer          default("normal"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  line_user_id  :string           not null
#  prefecture_id :bigint           default(99), not null
#
# Indexes
#
#  index_users_on_prefecture_id  (prefecture_id)
#
# Foreign Keys
#
#  fk_rails_...  (prefecture_id => prefectures.id)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it 'line_user_idが必須であること' do
      user = FactoryBot.build(:user, line_user_id: nil)
      expect(user).not_to be_valid
      expect(user.errors[:line_user_id]).to include('を入力してください')
    end

    it 'roleがデフォルト値であること' do
      user = FactoryBot.build(:user)
      expect(user.role).to eq('general')
    end
  end

  describe 'デフォルト値' do
    it 'ageが"age_not_selected"であること' do
      user = FactoryBot.build(:user)
      expect(user.age).to eq('age_not_selected')
    end

    it 'genderが"gender_not_selected"であること' do
      user = FactoryBot.build(:user)
      expect(user.gender).to eq('gender_not_selected')
    end

    it 'skin_typeが"normal"であること' do
      user = FactoryBot.build(:user)
      expect(user.skin_type).to eq('normal')
    end

    it 'prefecture_idがデフォルト値であること' do
      user = FactoryBot.build(:user)
      expect(user.prefecture_id).to eq(99)
    end
  end
end

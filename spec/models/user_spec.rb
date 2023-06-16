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
    it 'line_user_idが存在する場合、有効であること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'line_user_idが重複する場合、無効であること' do
      create(:user, line_user_id: 'test_user_id')
      user = build(:user, line_user_id: 'test_user_id')
      expect(user).not_to be_valid
      expect(user.errors[:line_user_id]).to include('はすでに存在します')
    end

    it 'ageが存在する場合、有効であること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'ageが存在しない場合、無効であること' do
      user = build(:user, age: nil )
      expect(user).not_to be_valid
    end

    it 'genderが存在する場合、有効であること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'genderが存在しない場合、無効であること' do
      user = build(:user, gender: nil )
      expect(user).not_to be_valid
    end

    it 'skin_typeが存在する場合、有効であること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'skin_typeが存在しない場合、無効であること' do
      user = build(:user, skin_type: nil )
      expect(user).not_to be_valid
    end

    it 'prefecture_idが存在する場合、有効であること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'prefecture_idが存在しない場合、無効であること' do
      user = build(:user, prefecture_id: nil )
      expect(user).not_to be_valid
    end
  end

  describe 'enum' do
    it 'roleが正しく定義されていること' do
      expect(User.roles.keys).to contain_exactly('general', 'admin')
    end

    it 'ageが正しく定義されていること' do
      expect(User.ages.keys).to contain_exactly('age_not_selected', 'teen', 'twenty', 'thirty', 'forty', 'fifty', 'sixth', 'age_other')
    end

    it 'genderが正しく定義されていること' do
      expect(User.genders.keys).to contain_exactly('gender_not_selected', 'male', 'female', 'gender_other')
    end

    it 'skin_typeが正しく定義されていること' do
      expect(User.skin_types.keys).to contain_exactly('normal', 'oily', 'dry', 'combination', 'sensitive')
    end
  end
end

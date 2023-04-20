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
#  prefecture_id :bigint           default(48), not null
#
# Indexes
#
#  index_users_on_prefecture_id  (prefecture_id)
#
# Foreign Keys
#
#  fk_rails_...  (prefecture_id => prefectures.id)
#
FactoryBot.define do
  factory :user do
    line_user_id { 'MyString' }
    role { 1 }
  end
end

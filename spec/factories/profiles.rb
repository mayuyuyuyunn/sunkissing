# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  age        :integer          default("age_not_serected"), not null
#  gender     :integer          default("gender_not_serected"), not null
#  nickname   :string           not null
#  prefecture :integer          default("その他"), not null
#  skyn_type  :integer          default("normal"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :profile do
    User { nil }
    nickname { "MyString" }
    age { "MyString" }
    skyn_type { 1 }
    gender { 1 }
    prefecture { 1 }
  end
end

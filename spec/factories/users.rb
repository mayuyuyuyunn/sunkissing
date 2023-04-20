# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  age          :integer          default("age_not_selected"), not null
#  gender       :integer          default("gender_not_selected"), not null
#  role         :integer          default("general"), not null
#  skin_type    :integer          default("normal"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  line_user_id :string           not null
#
FactoryBot.define do
  factory :user do
    line_user_id { 'MyString' }
    role { 1 }
  end
end

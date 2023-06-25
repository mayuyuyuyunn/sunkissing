# == Schema Information
#
# Table name: prefectures
#
#  id           :bigint           not null, primary key
#  capital_city :string           not null
#  latitude     :float            not null
#  longitude    :float            not null
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :prefecture do
    id { 99 }
    name { 'MyString' }
    capital_city { 'Mystring' }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end

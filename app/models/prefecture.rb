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
class Prefecture < ApplicationRecord
  with_options presence: true do
    validates :capital_city
    validates :latitude
    validates :longitude
    validates :name
  end
  validates :name, uniqueness: true
end

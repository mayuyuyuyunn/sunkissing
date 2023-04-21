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
class User < ApplicationRecord
  has_many :schedules, dependent: :destroy

  validates :line_user_id, presence: true, uniqueness: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :skin_type, presence: true
  
  enum role: { general: 0, admin: 1 }
  enum age: { age_not_selected: 0, teen: 10, twenty: 20, thirty: 30, forty: 40, fifty: 50, sixth: 60, age_other: 99 }
  enum gender: { gender_not_selected: 0, male: 1, female: 2, gender_other: 99 }
  enum skin_type: { normal: 0, oily: 1, dry: 2, combination: 3, sensitive: 4 }
end

# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  role         :integer          default("general"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  line_user_id :string           not null
#
class User < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :line_user_id, presence: true, uniqueness: true
  
  enum role: { general: 0, admin: 1 }
end

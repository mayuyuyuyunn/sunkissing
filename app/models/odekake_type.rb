# == Schema Information
#
# Table name: odekake_types
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OdekakeType < ApplicationRecord
  has_many :schedules, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end

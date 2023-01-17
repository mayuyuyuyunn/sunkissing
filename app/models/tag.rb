# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#
class Tag < ApplicationRecord
  has_many :sunscreens
  has_many :sunscreen_tags, dependent: :destroy
  has_many :sunscreens

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
end

# == Schema Information
#
# Table name: sunscreens
#
#  id          :bigint           not null, primary key
#  brand       :string           not null
#  capacity    :integer
#  manufacture :string           not null
#  name        :text             not null
#  pa          :integer          default("pa_unknown"), not null
#  price       :integer          not null
#  spf         :integer          default("spf_unknown"), not null
#  summary     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_sunscreens_on_name  (name) UNIQUE
#
class Sunscreen < ApplicationRecord
  has_many :sunscreen_tags, dependent: :destroy
  has_many :tags, through: :sunscreen_tags

  enum :spf, { spf_unknown: 0, thirty: 30, forty: 40, fifty: 50, fifty_plus: 55 }
  enum :pa, { pa_unknown: 0, plus1: 1, plus2: 2, plus3: 3, plus4: 4 }

  validates :name, presence: true, uniqueness: true
  with_options presence: true do
    validates :manufacture
    validates :price
    validates :spf
    validates :pa
    validates :capacity
    validates :brand
  end
end

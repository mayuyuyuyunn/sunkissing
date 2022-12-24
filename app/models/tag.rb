class Tag < ApplicationRecord
  has_many :sunscreen_tags
  has_many :sunscreens, through: :sunscreen_tags
end

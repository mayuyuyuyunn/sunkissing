class Sunscreen < ApplicationRecord
  has_many :sunscreen_tags
  has_many :tags, through: :sunscreen_tags
  enum :spf, { spf_unknown: 0, thirty: 30, forty: 40, fifty: 50, fiftyplus: 55 }
  enum :pa, { pa_unknown: 0, plus1: 1, plus2: 2, plus3: 3, plus4: 4 }

  validates :name, presence: true, uniqueness: true
  with_options presence: true do
    validates :manufacture
    validates :price
    validates :spf
    validates :pa
    validates :capacity
    validates :btand
  end
end

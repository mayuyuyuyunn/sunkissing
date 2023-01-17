# == Schema Information
#
# Table name: sunscreen_tags
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  sunscreen_id :bigint           not null
#  tag_id       :bigint           not null
#
# Indexes
#
#  index_sunscreen_tags_on_sunscreen_id             (sunscreen_id)
#  index_sunscreen_tags_on_tag_id                   (tag_id)
#  index_sunscreen_tags_on_tag_id_and_sunscreen_id  (tag_id,sunscreen_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (sunscreen_id => sunscreens.id)
#  fk_rails_...  (tag_id => tags.id)
#
class SunscreenTag < ApplicationRecord
  belongs_to :tag
  belongs_to :sunscreen

  validates :sunscreen_id, presence: true
  validates :tag_id, presence: true
end

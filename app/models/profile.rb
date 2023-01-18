# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  age        :integer          default("age_not_serected"), not null
#  gender     :integer          default("gender_not_serected"), not null
#  nickname   :string           not null
#  prefecture :integer          default("その他"), not null
#  skyn_type  :integer          default("normal"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Profile < ApplicationRecord
  belongs_to :user
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :user_id, uniqueness: true

  enum age: { age_not_serected: 0, teen: 10, twenty: 20, thirty: 30, forty: 40, fifty: 50, sixth: 60, age_other: 99 }
  enum gender: { gender_not_serected: 0, male: 1, female: 2 }
  enum skyn_type: { normal: 0, oily: 1, dry: 2, combinatio: 3, sensitive: 4 }
  enum prefecture: {
    北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7, 
    茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14, 
    新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20, 
    岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24, 
    滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30, 
    鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35, 
    徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39, 
    福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46, 沖縄県: 47,
    その他: 0
  }
end
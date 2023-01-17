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
require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

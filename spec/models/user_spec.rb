# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  age          :integer          default("age_not_selected"), not null
#  gender       :integer          default("gender_not_selected"), not null
#  prefecture   :integer          default("その他"), not null
#  role         :integer          default("general"), not null
#  skin_type    :integer          default("normal"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  line_user_id :string           not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

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
require 'rails_helper'

RSpec.describe Sunscreen, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

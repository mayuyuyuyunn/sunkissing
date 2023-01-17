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
FactoryBot.define do
  factory :sunscreen do
    name { 'MyText' }
    manufacture { 'MyText' }
    price { 1 }
    SPF { 1 }
    PA { 'MyText' }
    summary { 'MyText' }
    capacity { 1 }
  end
end

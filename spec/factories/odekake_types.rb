# == Schema Information
#
# Table name: odekake_types
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :odekake_type do
    name { 'Mystring' }
  end
end

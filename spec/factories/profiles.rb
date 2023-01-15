FactoryBot.define do
  factory :profile do
    User { nil }
    nickname { "MyString" }
    age { "MyString" }
    skyn_type { 1 }
    gender { 1 }
    prefecture { 1 }
  end
end

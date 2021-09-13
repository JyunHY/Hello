FactoryBot.define do
  factory :message do
    user { nil }
    title { "MyString" }
    content { "MyText" }
    foruser { 1 }
  end
end

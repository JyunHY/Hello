FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    status { "MyString" }
    group { "MyString" }
    user { nil }
  end
end

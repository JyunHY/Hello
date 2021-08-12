FactoryBot.define do
  factory :comment do
    user { nil }
    post { nil }
    content { "MyText" }
    deleted_at { "2021-08-12 08:35:18" }
    like { "MyString" }
  end
end

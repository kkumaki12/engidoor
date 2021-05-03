FactoryBot.define do
  factory :user do
    name {"hoge"}
    sequence(:email) { |n| "hoge#{n}@example.com"}
    password {"password"}
  end
end

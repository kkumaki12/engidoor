FactoryBot.define do
  factory :user do
    name { 'hoge' }
    sequence(:email) { |n| "hooge#{n}@example.com" }
    password { 'password' }
  end
end

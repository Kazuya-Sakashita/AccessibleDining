FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)
    sequence(:email) { |n| "test-user+#{n}@gmail.com" }
    password { password }
    password_confirmation { password }
  end
end

FactoryBot.define do
  factory :restaurant do
    name { Faker::Restaurant.name }
    nearest_station { Faker::Address.street_name }
    budget { Faker::Number.between(from: 1000, to: 10_000) }
    category { Faker::Restaurant.type }
    postal_code { Faker::Address.postcode }
    address { Faker::Address.full_address }
    city { Faker::Address.city }
    district { Faker::Address.community }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    phone_number { Faker::PhoneNumber.phone_number }
    business_hours { '10:00〜21:00' }
    description { Faker::Lorem.sentence }
  end
end

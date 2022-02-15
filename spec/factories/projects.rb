require 'faker'

FactoryBot.define do
  factory :project do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph(sentence_count: 6, supplemental: true) }
    address { Faker::Address.street_address }
    neighborhood { Faker::Address.street_name }
    city { Faker::Address.city }
    country { Faker::Address.country }
    stratum { Faker::Number.between(from: 1, to: 7) }
    logo { Faker::LoremPixel.image }
    phone { Faker::PhoneNumber.cell_phone }
    sales_room_address { Faker::Address.street_address }
    sales_room_phone { Faker::PhoneNumber.phone_number }
    sales_room_email { Faker::Internet.email }
    estimated_start_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
    estimated_end_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 360, format: :short) }
  end
end

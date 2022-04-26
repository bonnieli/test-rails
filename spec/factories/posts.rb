# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    text { Faker::Lorem.sentence }
    likes { Faker::Number.digit }
    reads { Faker::Number.digit }
    popularity { Faker::Number.within(range: 0.0..1.0) }
    tags { Faker::Lorem.words(number: 2) }
  end
end

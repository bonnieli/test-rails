# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password { Faker::Internet.password(min_length: 6) }

    after(:build) do |user|
      user.posts << FactoryBot.build_list(:post, 2)
    end
  end
end

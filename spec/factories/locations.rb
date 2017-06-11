require 'faker'
FactoryGirl.define do
  factory :location do
    user_id 1
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
  end
end
FactoryGirl.define do
  factory :book do
    name { Faker::Lorem.characters(10) }
  end
end

FactoryGirl.define do
  factory :book do
    name { Faker::Space.planet }
  end
end

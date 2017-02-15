FactoryGirl.define do
  factory :author do
    name { Faker::Lorem.characters(10) }
  end
end

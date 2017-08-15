FactoryGirl.define do
  factory :sale do
    description { Faker::Lorem.paragraph }
    price       { Faker::Number.decimal(2) }
    quantity    { rand(1..50) }
    address     { Faker::Address.street_address }

    provider
    buyer
  end
end

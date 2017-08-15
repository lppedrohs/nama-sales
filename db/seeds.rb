buyers    = []
providers = []

3.times { buyers << Buyer.create(name: Faker::DragonBall.character) }

3.times { providers << Provider.create(name: Faker::DragonBall.character) }

5.times do
  Sale.create(
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    quantity: rand(1..15),
    address: Faker::Address.street_address,
    buyer: buyers.sample,
    provider: providers.sample
  )
end
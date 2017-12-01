require 'Faker'

Concert.destroy_all

10.times do
  Concert.create(
    name: Faker::RickAndMorty.character,
    date: Faker::Date.forward(23),
    duration: rand(1..4),
    cost: Faker::Number.decimal(2).to_f
  )
end

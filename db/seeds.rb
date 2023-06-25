puts "Done seeding"

Restaurant.destroy_all
Pizza.destroy_all
RestaurantPizza.destroy_all
5.times do
    Restaurant.create(name:Faker::Restaurant.name, address:Faker::Address.full_address)
end

5.times do
    Pizza.create(
        name:Faker::Food.ingredient,
        ingredients: [Faker::Food.ingredient, Faker::Food.ingredient, Faker::Food.ingredient],
    )
end

5.times do
    RestaurantPizza.create(
      restaurant_id: Restaurant.all.sample.id,
      pizza_id: Pizza.all.sample.id,
      price: Faker::Commerce.price(range: 1..30)
    )
  end
  

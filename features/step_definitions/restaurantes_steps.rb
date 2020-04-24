Quando("acesso a lista de restaurantes") do
  visit "/restaurants"
end

Então("cada restaurante ter {int} {string} {string} {string} {float}") do |id, name, category, delivery_time, rating|
  restaurants = all(".restaurant-item")

  expect(restaurants[id]).to have_text name.upcase
  expect(restaurants[id]).to have_text category
  expect(restaurants[id]).to have_text delivery_time
  expect(restaurants[id]).to have_text rating
end

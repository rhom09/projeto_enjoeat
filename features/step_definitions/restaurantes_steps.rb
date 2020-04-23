Dado("que eu tenha uma lista de restaurantes") do
  # será feito um array com a massa de teste
  # E como ele é comum para todos steps, ele recebe o @ = VARIAVEL GLOBAL
  # E é feito em um unico lugar e acessado por todos
  @restaurant_data = [
    { name: "Bread & Bakery", category: "Padaria", delivery_time: "25 minutos", rating: "4.9" },
    { name: "Burger House", category: "Hamburgers", delivery_time: "30 minutos", rating: "3.5" },
    { name: "Coffee Corner", category: "Cafeteria", delivery_time: "20 minutos", rating: "4.8" },
    { name: "Green Food", category: "Saudável", delivery_time: "40 minutos", rating: "4.1" },
    { name: "Ice Cream", category: "Sorvetes", delivery_time: "1 hora", rating: "0" },
    { name: "Tasty Treats", category: "Doces", delivery_time: "20 minutos", rating: "4.4" },
  ]
end

Quando("acesso a lista de restaurantes") do
  visit "/restaurants"
end

Então("vejo todas as opções disponíveis") do
  # all metodo CAPYBARA para retornar uma coleção de elementos (ARRAY)
  restaurantes = all(".restaurant-item")
  # Verificação para saber se esta'retornando os elementos
  expect(restaurantes.size).to be > 0
end

Então("cada restaurante deve exibir sua categoria") do
  # Array para obter todos os restaurantes da pagina
  restaurants = all(".restaurant-item")
  # for each_with_index = faz uma busca já com o index dos elementos para validar a categoria
  # atraves do argumento |value, index|
  # verificação atraves do array restaurants[index]
  @restaurant_data.each_with_index do |value, index|
    expect(restaurants[index]).to have_text value[:category]
  end
end

Então("cada restaurante deve exibir o tempo de entrega") do
  restaurants = all(".restaurant-item")

  @restaurant_data.each_with_index do |value, index|
    expect(restaurants[index]).to have_text value[:delivery_time]
  end
end

Então("cada restaurante deve exibir sua nota de avaliação") do
  restaurants = all(".restaurant-item")

  @restaurant_data.each_with_index do |value, index|
    expect(restaurants[index]).to have_text value[:rating]
  end
end

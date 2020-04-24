# Para poder trabalhar com a tabela criada, transformamos ela em uma HASH(array)
# E armazenamos na variavel
Dado("que temos os seguintes restaurantes") do |table|
  @restaurant_data = table.hashes
end

Quando("acesso a lista de restaurantes") do
  visit "/restaurants"
end

Então("devo ver todos os restaurantes desta lista") do
  restaurants = all(".restaurant-item") # Pega todo elemento da pagina onde estão os restaurantes
  # for each percorre toda a lista, pegando os valores
  # E verificando cada um dele
  @restaurant_data.each_with_index do |value, index|
    expect(restaurants[index]).to have_text value["name"].upcase
    expect(restaurants[index]).to have_text value["category"]
    expect(restaurants[index]).to have_text value["delivery_time"]
    expect(restaurants[index]).to have_text value["rating"]
  end
end

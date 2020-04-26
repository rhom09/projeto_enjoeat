Dado("que acesso a lista de restaurantes") do
  visit "/restaurants"
end

Quando("eu escolho o restaurante {string}") do |restaurante|
  # O seletor css para esse find é $(".restaurant-item:contains('Burguer House')")
  # Porem o CAPYBARA não aceita esse formato, então usamos da seguinte forma
  # O CAPYBARA leva em conta a estilização, por isso usamos o UPCASE
  find(".restaurant-item", text: restaurante.upcase).click
end

Então("eu vejo os seguintes itens disponiveis no cardápio:") do |table|
  # Pegamos todos os itens com a class abaixo
  itens = all(".menu-item-info-box")
  # Com o table.hashes, pegamos todos os dados da tabela e criamos uma hash(array)
  product_data = table.hashes
  # For each
  product_data.each_with_index do |value, index|
    expect(itens[index]).to have_text value["product"].upcase
    expect(itens[index]).to have_text value["drescription"]
    expect(itens[index]).to have_text value["price"]
  end
end

Então("eu vejo as seguintes informações adicionais:") do |table|
  # Como vamos trabalhar com chave/valor, então usamos rows_hash que ao inves
  # de transformar em um array ele transforma em linha com descrição
  infos = table.rows_hash
  # Pegamos todos os detalhes das infromações adicionais com a id abaixo
  detail = find("#detail")
  # Verificação sem o 'for each', porque não foi criado um array
  expect(detail).to have_text infos["category"]
  expect(detail).to have_text infos["drescription"]
  expect(detail).to have_text infos["opening_hours"]
end

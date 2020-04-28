Dado("que o produto desejado é {string}") do |product|
  @product_name = product
end

Dado("o valor do produto é de {string}") do |value|
  product_value = value
end

Quando("eu adiciono {int} unidade") do |int|
  # Para achar o btn de add, foi usado essa tecnica:
  # Primeiro acha o elemento 'Pai' e depois dentro dele mesmo faz outro FIND
  find(".menu-item-info-box", text: @product_name.upcase).find(".add-to-cart").click
end

Então("{int} unidade deste item deve ser adicionado ao carrinho") do |quantity|
  # cria uma variavel com o elemento do carrinho
  cart = find("#cart")
  # Verificação feita com interpolação de STRING (no codigo = 1x Cup Cake)
  # Interpolação de STRING sempre é feita com aspas duplas
  expect(cart).to have_text "(#{quantity}x) #{@product_name}"
end

Então("o valor total deve ser de {string}") do |amount|
  cart = find("#cart")
  # Com uma busca de query $(#cart tr:contains("Total:") td) achamos na tabela do carrinho
  # E passamos para o formato do CAPYBARA e guardamos na variavel total
  total = cart.find("tr", text: "Total:").find("td")
  # E a validação é feita no texto da variavel total que é o valor da tr/td
  expect(total.text).to have_text amount
  sleep 5
end

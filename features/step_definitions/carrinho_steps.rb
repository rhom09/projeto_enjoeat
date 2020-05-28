Dado("que o produto desejado é {string}") do |product|
  @product_name = product
end

Dado("o valor do produto é de {string}") do |value|
  @product_value = value
end

Quando("eu adiciono {int} unidade\\(s)") do |quantity|
  # Para adicionar mais de item no carrinho usamos o 'times' do Ruby
  # Que vai rodar x valor para cada qunatidade adiconada no cenario
  quantity.times do
    # Para achar o btn de add, foi usado essa tecnica:
    # Primeiro acha o elemento 'Pai' e depois dentro dele mesmo faz outro FIND
    find(".menu-item-info-box", text: @product_name.upcase).find(".add-to-cart").click
  end
end

Então("deve ser adicionado {int} unidade\\(s) deste item") do |quantity|
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
end

# Lista de produtos
Dado("que os produtos desejados são:") do |table|
  # Crio uma lista com array usando o hashes
  @product_list = table.hashes
end

Quando("eu adiciono todos os itens") do
  # Faço um for each com a lista criada, e chamo o mesmo metodo para clicar em add
  # Só que passando o 'p' do each com o 'nome' do produto
  @product_list.each do |p|
    # Para add a quantidade de item usamos o 'times' do Ruby, junto com 'p'
    # Que representa cada item da lista de produto(array)
    p["quantity"].to_i.times do
      find(".menu-item-info-box", text: p["name"].upcase).find(".add-to-cart").click
    end
  end
end

Então("vejo todos os itens no carrinho") do
  cart = find("#cart")
  # Usamos novamento o each para a verificação do total
  @product_list.each do |p|
    expect(cart).to have_text "(#{p["quantity"]}x) #{p["name"]}"
  end
end

# Remover Itens

Dado("que eu tenho os seguintes itens no carrinho:") do |table|
  @product_list = table.hashes
  @product_list.each do |p|
    p["quantity"].to_i.times do
      find(".menu-item-info-box", text: p["name"].upcase).find(".add-to-cart").click
    end
  end
end

### USAR COM O CENARIO PARA REMOVER UM ITEM SÓ ####
Quando("eu removo somente o item {int}") do |item|
  # Uso o find para achar o "pai"(cart)
  cart = find("#cart")
  # E dentro de cart busco o elemento que quero no caso o item 1
  # Com o all pego tudo dentro de cart e com o[item] o indice desse array e por fim click no x
  cart.all("table tbody tr")[item].find(".danger").click
end

### USAR COM O ESQUEMA DE CENARIO ###
Quando("eu removo somente o {int}") do |item|
  cart = find("#cart")
  cart.all("table tbody tr")[item].find(".danger").click
end

# HOOKS(ganchos) => Chama de forma inplicita a pagina inicial do teste
# Sendo assim não há necessidade de coloca-la na feature
# Porque no caso ela já está sendo obvia para o uso na feature
Before("@bread_bakery") do
  visit "/restaurants/bread-bakery/menu"
end

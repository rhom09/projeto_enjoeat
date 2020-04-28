# language: pt

# Com essa tag como HOOK(gancho), ela irá acessar a pagina exata
# Para a feature
@bread_bakery
Funcionalidade: Adicionar ao carrinho
    Para que possa finalizar uma compra
    Sendo um cliente que já decidiu o que comer
    Posso adicionar itens ao meu carrinho
    
    Cenario: Adicionar 1 unidade

        Dado que o produto desejado é "Cup Cake"
        E o valor do produto é de "R$ 8,70"
        Quando eu adiciono 1 unidade(s)
        Então deve ser adicionado 1 unidade(s) deste item
        E o valor total deve ser de "R$ 8,70"
    @temp
    Cenario: Adicionar 2 unidades

        Dado que o produto desejado é "Donut"
        E o valor do produto é de "R$ 2,50"
        Quando eu adiciono 2 unidade(s)
        Então deve ser adicionado 2 unidade(s) deste item
        E o valor total deve ser de "R$ 5,00"

    Cenario: Adicionar varios itens

        Dado que os produtos desejados são:
            | name                   | price    |
            | Cup Cake               | R$ 8,70  |
            | Donut                  | R$ 2,50  |
            | Pão Artesenal Italiano | R$ 12,50 |
        Quando eu adiciono todos os itens
        Então vejo todos os itens no carrinho
        E o valor total deve ser de "R$ 27,10"           
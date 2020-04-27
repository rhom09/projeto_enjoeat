# language: pt

Funcionalidade: Remover do carrinho
    Para que eu possa manter meu carrinho apenas com itens desejados
    Sendo um cliente que desistiu de um ou mais produtos
    Posso remover itens ao meu carrinho

    Cenario: Remover 1 item

        Dado que eu tenho os seguintes itens no carrinho:
            | name                   | price    |
            | Cup Cake               | R$ 8,70  |
            | Donut                  | R$ 2,50  |
            | Pão Artesenal Italiano | R$ 12,50 |
        Quando eu removo somente o item 1
        Então o valor total deve ser de "R$ 18,40"

    Cenario: Remover todos os itens

        Dado que eu tenho os seguintes itens no carrinho:
            | name                   | price    |
            | Cup Cake               | R$ 8,70  |
            | Donut                  | R$ 2,50  |
            | Pão Artesenal Italiano | R$ 12,50 |
        Quando eu removo todos os itens
        Então vejo a seguinte mensagem no carrinho "seu carrinho está vazio!"            
# language: pt

Funcionalidade: Cardápio
    Para que eu possa decidir o que pretendo comer
    Sendo um usuário que escolheu um restaurante
    Posso acessar o cardápio
    
    @cardapio
    Cenario: Produto
        # Reforçando BDD, a massa de teste vai direto na especificação
        Dado que acesso a lista de restaurantes

        Quando eu escolho o restaurante "Burger House"
        # O "Então" é feito com DATA TABLE, porque já engloba (produto, descrição e preço) 
        Então eu vejo os seguintes itens disponiveis no cardápio:
            | product        | description                     | price    |
            | Classic Burger | O clássico. Não tem como errar. | R$ 18,50 |
            | Batatas Fritas | Batatas fritas crocantes        | R$ 5,50  |
            | Refrigerante   | O refri mais gelado da cidade.  | R$ 4,50  |

    # Cenario adicionado na sprint 3, quando foi especificado o adicionar e remover itens
    Cenario: Carrinho vazio

        Dado que acesso a lista de restaurantes
        Quando eu escolho o restaurante "Burger House"
        Então vejo a seguinte mensagem no carrinho "seu carrinho está vazio!"

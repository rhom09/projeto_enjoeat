#language: pt

Funcionalidade: Restaurantes    
    Para que eu possa saber quais os restaurantes disponíveis com o tempo de entrega e nota de avaliação
    Sendo um usuário que deseja pedir comida
    Posso acessar a lista de restaurantes
   
    # Cenario com tabela diferente do ESQUEMA DO CENARIO, ele roda a massa de teste
    # Em uma única janela se aproximando mais do comportamento do usuário 
    Cenario: Restaurantes disponíveis

        Dado que temos os seguintes restaurantes  
           | name           | category   | delivery_time | rating |
           | Bread & Bakery | Padaria    | 25 minutos    | 4.9    |
           | Burger House   | Hamburgers | 30 minutos    | 3.5    |
           | Coffee Corner  | Cafeteria  | 20 minutos    | 4.8    |
           | Green Food     | Saudável   | 40 minutos    | 4.1    |
           | Ice Cream      | Sorvetes   | 1 hora        | 0      |
           | Tasty Treats   | Doces      | 20 minutos    | 4.4    |
        Quando acesso a lista de restaurantes
        Então devo ver todos os restaurantes desta lista   









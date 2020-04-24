#language: pt

Funcionalidade: Restaurantes    
    Para que eu possa saber quais os restaurantes disponíveis com o tempo de entrega e nota de avaliação
    Sendo um usuário que deseja pedir comida
    Posso acessar a lista de restaurantes

    Esquema do Cenario: Restaurantes disponíveis

        Quando acesso a lista de restaurantes
        Então cada restaurante ter <id> <name> <category> <delivery_time> <rating>

         Exemplos: 
      | id | name             | category     | delivery_time | rating |
      | 0  | "Bread & Bakery" | "Padaria"    | "25 minutos"  | 4.9    |
      | 1  | "Burger House"   | "Hamburgers" | "30 minutos"  | 3.5    |
      | 2  | "Coffee Corner"  | "Cafeteria"  | "20 minutos"  | 4.8    |
      | 3  | "Green Food"     | "Saudável"   | "40 minutos"  | 4.1    |
    # | 4  | "Ice Cream"      | "Sorvetes"   | "1 hora"      | 0      |
      | 5  | "Tasty Treats"   | "Doces"      | "20 minutos"  | 4.4    |










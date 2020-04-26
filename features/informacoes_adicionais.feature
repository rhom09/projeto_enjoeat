# language: pt

Funcionalidade: Informações adicionais
    Para que eu possa ver as informações adicionais
    Sendo um usuário que escolheu um restaurante
    Posso ver a categoria, descrição e horários de funcionamento

    @infos
    Cenario: Detalhes do restaurante

        Dado que acesso a lista de restaurantes
        Quando eu escolho o restaurante "Burger House"
        Então eu vejo as seguintes informações adicionais:
            # Tabelas no formado chave e valor. 
            | category       | Hamburgers                               |
            | description    | 40 anos se especializando em trash food. |
            | opening_hours  | Funciona todos os dias, de 10h às 22h    |
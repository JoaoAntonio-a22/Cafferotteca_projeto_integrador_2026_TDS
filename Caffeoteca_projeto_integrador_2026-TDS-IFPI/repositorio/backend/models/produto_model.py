class Produto:
    def __init__(self, id, nome, descricao, preco):
        self.id = id
        self.nome = nome
        self.descricao = descricao
        self.preco = preco


    def adicionar_produto(id, nome, descricao, preco):
        produto = Produto(id, nome, descricao, preco)
        listaProdutos.append(produto)
  

  # nome
  #descricao
  #preco

listaProdutos = [
    Produto(1, 'Café Expresso', 'Café forte e concentrado, perfeito para começar o dia.', 5.50),
    Produto(2, 'Café Cappuccino', 'Café com leite vaporizado e espuma de leite.', 7.00),
    Produto(3, 'Café Latte', 'Café com leite quente e uma camada fina de espuma.', 6.50),
    Produto(4, 'Café Mocha', 'Café com chocolate e leite vaporizado.', 8.00),
    Produto(5, 'Café Americano', 'Café diluído em água quente, leve e suave.', 4.50),
    Produto(6, 'Café Macchiato', 'Café expresso com uma pequena quantidade de leite vaporizado.', 6.00),
    Produto(7, 'Café Frappuccino', 'Café gelado com leite, gelo e chantilly.', 9.00),
    Produto(8, 'Café Irish', 'Café com whisky irlandês e chantilly.', 10.00)
]
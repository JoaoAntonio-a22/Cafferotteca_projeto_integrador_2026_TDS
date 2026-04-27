-- DML (Data Manipulation Language) - Dados de Exemplo
-- Sistema de Cafeteria - Café Artesanal

USE caffeoteca;

-- Inserir usuários de exemplo
INSERT INTO usuarios (nome, email, senha, telefone, tipo) VALUES
('Administrador', 'admin@caffeoteca.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPjYLC3zWJzK', '(11) 99999-0000', 'admin'),
('João Silva', 'joao@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPjYLC3zWJzK', '(11) 99999-0001', 'cliente'),
('Maria Santos', 'maria@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPjYLC3zWJzK', '(11) 99999-0002', 'cliente'),
('Pedro Oliveira', 'pedro@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPjYLC3zWJzK', '(11) 99999-0003', 'cliente');

-- Inserir categorias
INSERT INTO categorias (nome, descricao) VALUES
('Cafés Tradicionais', 'Cafés preparados de forma tradicional'),
('Cafés Especiais', 'Cafés de origem única e blends premium'),
('Bebidas Quentes', 'Chás, chocolates e outras bebidas quentes'),
('Bebidas Frias', 'Refrigerantes, sucos e bebidas geladas'),
('Doces e Sobremesas', 'Bolos, tortas e doces artesanais'),
('Salgados', 'Pães, croissants e salgados variados');

-- Inserir produtos
INSERT INTO produtos (nome, descricao, preco, categoria_id, imagem) VALUES
-- Cafés Tradicionais
('Café Expresso', 'Café expresso tradicional, forte e encorpado', 4.50, 1, 'expresso.jpg'),
('Café Americano', 'Café expresso diluído em água quente', 5.00, 1, 'americano.jpg'),
('Café com Leite', 'Café expresso com leite vaporizado', 6.00, 1, 'cafe_leite.jpg'),
('Cappuccino', 'Café expresso com leite vaporizado e espuma', 7.50, 1, 'cappuccino.jpg'),
('Latte', 'Café expresso com muito leite vaporizado', 8.00, 1, 'latte.jpg'),

-- Cafés Especiais
('Café Colombiano', 'Café de origem colombiana, notas de chocolate e caramelo', 9.00, 2, 'colombiano.jpg'),
('Café Etiópia Yirgacheffe', 'Café etíope com notas florais e frutas cítricas', 10.50, 2, 'etiopia.jpg'),
('Café Brasileiro', 'Café brasileiro de alta qualidade, blend especial', 8.50, 2, 'brasileiro.jpg'),
('Café Descafeinado', 'Café premium descafeinado, mesmo sabor intenso', 7.00, 2, 'descafeinado.jpg'),

-- Bebidas Quentes
('Chá Verde', 'Chá verde premium com limão', 5.50, 3, 'cha_verde.jpg'),
('Chá Preto', 'Chá preto Earl Grey', 5.50, 3, 'cha_preto.jpg'),
('Chocolate Quente', 'Chocolate quente cremoso com chantilly', 8.00, 3, 'chocolate.jpg'),
('Macchiato', 'Café expresso com um toque de leite vaporizado', 6.50, 3, 'macchiato.jpg'),

-- Bebidas Frias
('Refrigerante Coca-Cola', 'Lata 350ml', 4.00, 4, 'coca_cola.jpg'),
('Refrigerante Guaraná', 'Lata 350ml', 4.00, 4, 'guarana.jpg'),
('Suco Natural de Laranja', 'Suco natural 300ml', 6.00, 4, 'suco_laranja.jpg'),
('Suco Natural de Limão', 'Suco natural 300ml', 6.00, 4, 'suco_limao.jpg'),
('Água Mineral', 'Garrafa 500ml', 2.50, 4, 'agua.jpg'),

-- Doces e Sobremesas
('Bolo de Chocolate', 'Fatia de bolo de chocolate com cobertura', 8.00, 5, 'bolo_chocolate.jpg'),
('Torta de Limão', 'Torta cremosa de limão', 7.50, 5, 'torta_limao.jpg'),
('Croissant', 'Croissant francês folhado', 5.00, 5, 'croissant.jpg'),
('Cookie de Chocolate', 'Cookie caseiro com gotas de chocolate', 4.50, 5, 'cookie.jpg'),
('Pão de Queijo', 'Tradicional pão de queijo mineiro (2 unidades)', 6.00, 5, 'pao_queijo.jpg'),

-- Salgados
('Croissant Presunto e Queijo', 'Croissant recheado com presunto e queijo', 8.50, 6, 'croissant_salgado.jpg'),
('Pão na Chapa', 'Pão francês na chapa com manteiga', 4.00, 6, 'pao_chapa.jpg'),
('Misto Quente', 'Pão francês com presunto e queijo derretido', 7.00, 6, 'misto_quente.jpg'),
('Torrada Francesa', 'Pão de forma torrado com queijo e presunto', 6.50, 6, 'torrada.jpg');

-- Inserir cupons de desconto
INSERT INTO cupons (codigo, descricao, tipo_desconto, valor_desconto, valor_minimo, data_inicio, data_fim, uso_maximo) VALUES
('BEMVINDO10', 'Desconto de boas-vindas para novos clientes', 'percentual', 10.00, 20.00, '2025-01-01', '2025-12-31', 100),
('CAFETERIA15', '15% de desconto em cafés especiais', 'percentual', 15.00, 25.00, '2025-01-01', '2025-12-31', 50),
('FRETEGRATIS', 'Frete grátis para pedidos acima de R$ 30,00', 'valor_fixo', 8.00, 30.00, '2025-01-01', '2025-12-31', NULL),
('ANIVERSARIO', 'Desconto especial de aniversário', 'percentual', 20.00, 15.00, '2025-04-01', '2025-04-30', 200);

-- Inserir pedidos de exemplo
INSERT INTO pedidos (usuario_id, numero_pedido, status, tipo_entrega, subtotal, taxa_entrega, total, nome_cliente, telefone_cliente, email_cliente, forma_pagamento, observacoes) VALUES
(2, 'PED0001', 'entregue', 'delivery', 23.50, 8.00, 31.50, 'João Silva', '(11) 99999-0001', 'joao@email.com', 'credito', 'Sem cebola na torta'),
(3, 'PED0002', 'confirmado', 'retirada', 15.00, 0.00, 15.00, 'Maria Santos', '(11) 99999-0002', 'maria@email.com', 'pix', NULL),
(4, 'PED0003', 'preparando', 'delivery', 42.00, 8.00, 50.00, 'Pedro Oliveira', '(11) 99999-0003', 'pedro@email.com', 'debito', 'Bater na porta ao entregar');

-- Inserir endereços para pedidos de delivery
UPDATE pedidos SET
    cep = '01234-567',
    rua = 'Rua das Flores',
    numero = '123',
    complemento = 'Apto 45',
    bairro = 'Centro',
    cidade = 'São Paulo'
WHERE id = 1;

UPDATE pedidos SET
    cep = '09876-543',
    rua = 'Av. Paulista',
    numero = '987',
    complemento = 'Sala 1201',
    bairro = 'Bela Vista',
    cidade = 'São Paulo'
WHERE id = 3;

-- Inserir itens dos pedidos
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario, subtotal) VALUES
-- Pedido 1 (João Silva)
(1, 4, 1, 7.50, 7.50),  -- Cappuccino
(1, 12, 1, 5.50, 5.50), -- Chá Verde
(1, 22, 1, 7.50, 7.50), -- Torta de Limão
(1, 25, 1, 2.50, 2.50), -- Água Mineral

-- Pedido 2 (Maria Santos)
(2, 1, 2, 4.50, 9.00),  -- 2x Café Expresso
(2, 24, 1, 6.00, 6.00), -- Pão de Queijo

-- Pedido 3 (Pedro Oliveira)
(3, 6, 1, 9.00, 9.00),   -- Café Colombiano
(3, 8, 1, 10.50, 10.50), -- Café Etiópia
(3, 18, 1, 8.00, 8.00),  -- Chocolate Quente
(3, 21, 1, 8.00, 8.00),  -- Bolo de Chocolate
(3, 27, 1, 6.50, 6.50);  -- Torrada Francesa

-- Atualizar totais dos pedidos (os triggers devem fazer isso automaticamente, mas vamos garantir)
UPDATE pedidos SET total = subtotal + taxa_entrega - desconto WHERE id IN (1, 2, 3);
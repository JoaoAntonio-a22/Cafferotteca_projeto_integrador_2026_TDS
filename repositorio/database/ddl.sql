-- DDL (Data Definition Language) - Estrutura do Banco de Dados
-- Sistema de Cafeteria - Café Artesanal

-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS caffeoteca;
USE caffeoteca;

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    tipo ENUM('admin', 'cliente') DEFAULT 'cliente',
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela de categorias de produtos
CREATE TABLE IF NOT EXISTS categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela de produtos
CREATE TABLE IF NOT EXISTS produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    categoria_id INT,
    imagem VARCHAR(255),
    disponivel BOOLEAN DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabela de pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    numero_pedido VARCHAR(20) UNIQUE NOT NULL,
    status ENUM('pendente', 'confirmado', 'preparando', 'pronto', 'entregue', 'cancelado') DEFAULT 'pendente',
    tipo_entrega ENUM('retirada', 'delivery') DEFAULT 'retirada',
    subtotal DECIMAL(10,2) NOT NULL,
    taxa_entrega DECIMAL(10,2) DEFAULT 0.00,
    desconto DECIMAL(10,2) DEFAULT 0.00,
    total DECIMAL(10,2) NOT NULL,

    -- Informações do cliente
    nome_cliente VARCHAR(100) NOT NULL,
    telefone_cliente VARCHAR(20) NOT NULL,
    email_cliente VARCHAR(100),

    -- Endereço de entrega (opcional)
    cep VARCHAR(10),
    rua VARCHAR(100),
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50),

    -- Informações adicionais
    forma_pagamento ENUM('dinheiro', 'credito', 'debito', 'pix') DEFAULT 'dinheiro',
    observacoes TEXT,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabela de itens do pedido
CREATE TABLE IF NOT EXISTS itens_pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    observacoes TEXT,

    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Tabela de cupons de desconto
CREATE TABLE IF NOT EXISTS cupons (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    descricao VARCHAR(100),
    tipo_desconto ENUM('percentual', 'valor_fixo') DEFAULT 'percentual',
    valor_desconto DECIMAL(10,2) NOT NULL,
    valor_minimo DECIMAL(10,2) DEFAULT 0.00,
    data_inicio DATE,
    data_fim DATE,
    uso_maximo INT DEFAULT NULL,
    usos_atuais INT DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE
);

-- Índices para melhor performance
CREATE INDEX idx_produtos_categoria ON produtos(categoria_id);
CREATE INDEX idx_produtos_disponivel ON produtos(disponivel);
CREATE INDEX idx_pedidos_usuario ON pedidos(usuario_id);
CREATE INDEX idx_pedidos_status ON pedidos(status);
CREATE INDEX idx_pedidos_data ON pedidos(data_pedido);
CREATE INDEX idx_itens_pedido_pedido ON itens_pedido(pedido_id);
CREATE INDEX idx_cupons_codigo ON cupons(codigo);

-- Views úteis
CREATE OR REPLACE VIEW vw_pedidos_detalhes AS
SELECT
    p.id,
    p.numero_pedido,
    p.status,
    p.tipo_entrega,
    p.total,
    p.nome_cliente,
    p.telefone_cliente,
    p.data_pedido,
    COUNT(ip.id) as quantidade_itens,
    GROUP_CONCAT(pr.nome SEPARATOR ', ') as produtos
FROM pedidos p
LEFT JOIN itens_pedido ip ON p.id = ip.pedido_id
LEFT JOIN produtos pr ON ip.produto_id = pr.id
GROUP BY p.id;

-- Triggers para atualizar automaticamente o total do pedido
DELIMITER //

CREATE TRIGGER trg_atualizar_total_pedido
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    UPDATE pedidos
    SET subtotal = (
        SELECT SUM(subtotal)
        FROM itens_pedido
        WHERE pedido_id = NEW.pedido_id
    ),
    total = subtotal + taxa_entrega - desconto
    WHERE id = NEW.pedido_id;
END//

CREATE TRIGGER trg_atualizar_total_pedido_update
AFTER UPDATE ON itens_pedido
FOR EACH ROW
BEGIN
    UPDATE pedidos
    SET subtotal = (
        SELECT SUM(subtotal)
        FROM itens_pedido
        WHERE pedido_id = NEW.pedido_id
    ),
    total = subtotal + taxa_entrega - desconto
    WHERE id = NEW.pedido_id;
END//

CREATE TRIGGER trg_atualizar_total_pedido_delete
AFTER DELETE ON itens_pedido
FOR EACH ROW
BEGIN
    UPDATE pedidos
    SET subtotal = (
        SELECT COALESCE(SUM(subtotal), 0)
        FROM itens_pedido
        WHERE pedido_id = OLD.pedido_id
    ),
    total = subtotal + taxa_entrega - desconto
    WHERE id = OLD.pedido_id;
END//

DELIMITER ;
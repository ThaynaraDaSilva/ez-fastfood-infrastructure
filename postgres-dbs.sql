CREATE SCHEMA IF NOT EXISTS EZ_FASTFOOD_CATALOG;

SET search_path TO EZ_FASTFOOD_CATALOG;

CREATE TABLE IF NOT EXISTS CATEGORY (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS PRODUCT (
    id BIGSERIAL PRIMARY KEY,
    category_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES EZ_FASTFOOD_CATALOG.CATEGORY(id) ON DELETE CASCADE
);

INSERT INTO EZ_FASTFOOD_CATALOG.CATEGORY (name)
VALUES
    ('LANCHE'),
    ('ACOMPANHAMENTO'),
    ('BEBIDA'),
    ('SOBREMESA');
    
INSERT INTO EZ_FASTFOOD_CATALOG.PRODUCT (name, description, price, category_id)
VALUES
    ('X-BURGUER', 'CARNE BOVINA, QUEIJO PRATA, ALFACE, TOMATE, CEBOLA E MOLHO DA CASA', 20.50, 1),
    ('X-FRANGO', 'FILE DE FRANGO EMPANADO, MUÇARELA, ALFACE, TOMATE, BACON, CEBOLA E MOLHO DA CASA', 19.50, 1),
    ('COCA-COLA', 'REFRIGERANTE DE 300 ML', 5.50, 3),
    ('TUTU', 'REFRIGERENTE DE GARRAFA DAS ANTIGAS', 4.50, 3),
    ('BATATA FRITA', 'FRITAS ONDULADAS', 11.90, 2),
    ('PETIT GATEAU', 'TIRA GOSTO', 7.00, 4);

CREATE SCHEMA IF NOT EXISTS EZ_FASTFOOD_PAYMENT;
SET search_path TO EZ_FASTFOOD_PAYMENT;

CREATE TABLE IF NOT EXISTS EZ_FASTFOOD_PAYMENT.PAYMENT (
    id BIGSERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    user_id INT NULL,
    payment_date TIMESTAMP WITH TIME ZONE NULL,
    payment_price DECIMAL,
    payment_status VARCHAR(50)
);

INSERT INTO EZ_FASTFOOD_PAYMENT.PAYMENT (order_id, user_id, payment_date, payment_price, payment_status)
VALUES (1, 1, NULL, 20.50, 'PENDING');

CREATE SCHEMA IF NOT EXISTS EZ_FASTFOOD_ORDER;
SET search_path TO EZ_FASTFOOD_ORDER;

CREATE TABLE IF NOT EXISTS EZ_FASTFOOD_ORDER.ORDER (
    id BIGSERIAL PRIMARY KEY,
    order_number VARCHAR(255),
    user_id INT NULL,
    user_name VARCHAR(255),
    order_time TIMESTAMP WITH TIME ZONE,
    total_price DECIMAL(10, 2),
    order_status VARCHAR(50) DEFAULT 'WAITING_PAYMENT',
    completed_time TIMESTAMP WITH TIME ZONE
);

CREATE TABLE IF NOT EXISTS EZ_FASTFOOD_ORDER.ORDER_ITEMS (
    id BIGSERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL,
    FOREIGN KEY (order_id) REFERENCES EZ_FASTFOOD_ORDER.ORDER(id)
);

INSERT INTO EZ_FASTFOOD_ORDER.ORDER (order_number, user_id, user_name, order_time, total_price, completed_time)
VALUES
    ('ORD001', 101, 'João Silva', '2025-01-13 09:00:00+00', 45.00, '2025-01-13 10:00:00+00'),
    ('ORD002', 102, 'Maria Oliveira', '2025-01-13 10:30:00+00', 60.50, NULL),
    ('ORD003', 103, 'Carlos Pereira', '2025-01-13 11:15:00+00', 120.75, '2025-01-13 12:30:00+00'),
    ('ORD004', 104, 'Ana Santos', '2025-01-13 12:00:00+00', 25.50, NULL),
    ('ORD005', 101, 'João Silva', '2025-01-13 13:45:00+00', 80.00, '2025-01-13 14:45:00+00');

    INSERT INTO EZ_FASTFOOD_ORDER.ORDER_ITEMS (order_id, product_id, quantity, price)
VALUES
    -- Itens para o pedido ORD001
    (1, 201, 2, 15.00),
    (1, 202, 1, 15.00),
    
    -- Itens para o pedido ORD002
    (2, 203, 3, 20.50),
    
    -- Itens para o pedido ORD003
    (3, 204, 1, 120.75),
    
    -- Itens para o pedido ORD004
    (4, 205, 1, 25.50),
    
    -- Itens para o pedido ORD005
    (5, 201, 2, 15.00),
    (5, 206, 1, 50.00);
    
 
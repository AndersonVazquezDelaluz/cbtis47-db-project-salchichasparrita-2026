-- ============================================================
-- SEED DATA - CAFETERIA DATABASE
-- Description: Insert test data using multiple INSERT statements
-- ============================================================

USE restaurant_db;

-- ------------------------------------------------------------
-- 1. USERS
-- ------------------------------------------------------------
INSERT INTO user (name, email, password_hash)
VALUES
('Anuar Contreras', 'sorro595uwuolo@gmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.R.G6SqL6w3.ifXAo8ioB9GeA6etKzLK'),
('Anderson de la Luz', 'vazquezdllandry@gmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.6vckgDEDEv2qPmu3u7o6c1mA2EgupUW'),
('Jayden Sarmiento', 'ivanspidey11@gmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.Gj66BAkYaZNJA7OZ/thb4I6w6OV4nCC'),
('Axel de la Cruz', 'axeld7973@fmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.B85oRuyvU3iQ4QyBCOUOmDmNyHGSTd.'),
('Matthew Venegas Rojas', 'venegasrojasmatthewelias@gmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.zJcmK/9g1q0OvQMUBon3DpaxSf3XW42');

-- ------------------------------------------------------------
-- 2. ADDRESS
-- ------------------------------------------------------------
INSERT INTO address (user_id, street, neighborhood, city, state, postal_code)
VALUES 
(1, 'Av. Girasol', 'Vista Hermosa', 'Córdoba', 'Veracruz', '94677'),
(2, 'Calle Violeta', 'Vista Hermosa', 'Córdoba', 'Veracruz', '94677'),
(3, 'Calle 45', 'Lázaro Cárdenas', 'Córdoba', 'Veracruz', '94680'),
(4, 'Priv. Poniente 3', 'Los Cerezos', 'Córdoba', 'Veracruz', '94534'),
(5, 'Calle Juárez 8', 'Centro', 'Córdoba', 'Veracruz', '94520');

-- ------------------------------------------------------------
-- 3. PRODUCT
-- ------------------------------------------------------------
INSERT INTO product (name, description, price)
VALUES 
('Café Americano', 'Café negro tradicional', 35.00),
('Latte', 'Café con leche espumada', 45.00),
('Capuchino', 'Café con leche y espuma', 50.00),
('Pan dulce', 'Pan recién horneado', 25.00),
('Chocolate caliente', 'Bebida caliente de cacao con leche', 40.00);

-- ------------------------------------------------------------
-- 4. TABLES
-- ------------------------------------------------------------
INSERT INTO tables (table_number, capacity)
VALUES
(1, 2),
(2, 4),
(3, 4),
(4, 6),
(5, 2);

-- ------------------------------------------------------------
-- 5. ORDER
-- ------------------------------------------------------------
INSERT INTO `order` (user_id, table_id, order_date, status)
VALUES
(1, 1, CURRENT_DATE, 'pending'),
(2, 2, CURRENT_DATE, 'in_progress'),
(3, 3, CURRENT_DATE, 'delivered'),
(4, 4, CURRENT_DATE, 'pending'),
(5, 5, CURRENT_DATE, 'cancelled');

-- ------------------------------------------------------------
-- 6. ORDER_DETAIL
-- ------------------------------------------------------------
INSERT INTO order_detail (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 2, 35.00),
(1, 4, 1, 25.00),
(2, 2, 1, 45.00),
(3, 3, 2, 50.00),
(4, 5, 1, 40.00);

-- ------------------------------------------------------------
-- 7. INVENTORY_MOVEMENTS
-- ------------------------------------------------------------
INSERT INTO inventory_movements (product_id, movement_type, quantity)
VALUES
(1, 'RESTOCK', 50),
(2, 'RESTOCK', 40),
(3, 'SALE', 10),
(4, 'SALE', 5),
(5, 'RESTOCK', 30);

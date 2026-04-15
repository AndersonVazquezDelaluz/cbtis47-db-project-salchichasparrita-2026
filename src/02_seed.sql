INSERT INTO `USER` (name, email, password_hash)
VALUES
  ('Anuar Contreras', 'sorro595uwuolo@gmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.R.G6SqL6w3.ifXAo8ioB9GeA6etKzLK'),
  ('Anderson de la luz', 'vazquezdllandry@gmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.6vckgDEDEv2qPmu3u7o6c1mA2EgupUW'),
  ('Jayden Sarmiento', 'ivanspidey11@gmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.Gj66BAkYaZNJA7OZ/thb4I6w6OV4nCC'),
  ('Axel de la Cruz', 'axeld7973@fmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.B85oRuyvU3iQ4QyBCOUOmDmNyHGSTd.'),
  ('Matthew vergasrojas', 'venegasrojasmatthewelias@gmail.com', '$2a$10$FlZcSBjaH7J1hdLXO38mn.zJcmK/9g1q0OvQMUBon3DpaxSf3XW42');

INSERT INTO `address` (`address_id`, `user_id`, `street`, `city`, `state`, `postal_code`, `neighborhood`) 
  VALUES 
  (NULL, '1', 'av. girasol', 'Córdoba', 'Veracruz', '94677', 'Vista Hermosa'), 
  (NULL, '2', 'calle violeta', 'Córdoba', 'Veracruz', '94677', 'Vista Hermosa'), 
  (NULL, '3', 'Calle 45', 'Cordoba', 'Veracruz', '94680', 'Lazaro Cardenas'), 
  (NULL, '4', 'Priv. Poniente 3', 'Cordoba', 'Veracruz', '94534', 'Los cerezos'), 
  (NULL, '5', 'Calle Juárez 8', 'Córdoba', 'Veracruz', '94520', 'Centro')

INSERT INTO product (name, description, price)
VALUES 
('Café Americano', 'Café negro tradicional', 35.00),
('Latte', 'Café con leche espumada', 45.00),
('Capuchino', 'Café con leche y espuma', 50.00),
('Pan dulce', 'Pan recién horneado', 25.00),
('Chocolate caliente', 'Bebida caliente de cacao con leche', 40.00);

INSERT INTO tables (table_number, capacity)
VALUES
(1, 2),
(2, 4),
(3, 4),
(4, 6),
(5, 2);

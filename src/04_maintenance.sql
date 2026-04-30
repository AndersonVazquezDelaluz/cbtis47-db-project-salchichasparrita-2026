
USE restaurant_db;

-- ------------------------------------------------------------
-- 1. UPDATE - Modify product price
-- ------------------------------------------------------------
UPDATE product
SET price = 38.00
WHERE name = 'Café Americano';

-- ------------------------------------------------------------
-- 2. UPDATE - Change order status
-- ------------------------------------------------------------
UPDATE `order`
SET status = 'delivered'
WHERE order_id = 1;

-- ------------------------------------------------------------
-- 3. UPDATE with multiple conditions (AND)
-- ------------------------------------------------------------
UPDATE product
SET price = price + 5
WHERE price < 40 AND name != 'Pan dulce';

-- ------------------------------------------------------------
-- 4. DELETE - Remove a specific record
-- ------------------------------------------------------------
DELETE FROM order_detail
WHERE detail_id = 5;

-- ------------------------------------------------------------
-- 5. DELETE with condition
-- ------------------------------------------------------------
DELETE FROM inventory_movements
WHERE movement_type = 'SALE' AND quantity < 10;

-- ------------------------------------------------------------
-- 6. SAFE PRACTICE - Preview before DELETE
-- ------------------------------------------------------------
SELECT *
FROM product
WHERE price < 30;

-- Then execute DELETE if correct:
-- DELETE FROM product WHERE price < 30;

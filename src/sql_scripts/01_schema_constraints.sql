-- ============================================================
-- Week 8: SQL DDL - Relational Integrity
-- Description: Adding constraints and relationships (FOREIGN KEYS, CHECKS)
-- ============================================================

USE restaurant_db;

-- ------------------------------------------------------------
-- ADDRESS → USER
-- ------------------------------------------------------------
ALTER TABLE ADDRESS
ADD CONSTRAINT fk_address_user
FOREIGN KEY (user_id)
REFERENCES USER(user_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ------------------------------------------------------------
-- ORDER → USER
-- ------------------------------------------------------------
ALTER TABLE `ORDER`
ADD CONSTRAINT fk_order_user
FOREIGN KEY (user_id)
REFERENCES USER(user_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- ------------------------------------------------------------
-- ORDER → TABLES
-- ------------------------------------------------------------
ALTER TABLE `ORDER`
ADD CONSTRAINT fk_order_table
FOREIGN KEY (table_id)
REFERENCES TABLES(table_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- ------------------------------------------------------------
-- ORDER_DETAIL → ORDER
-- ------------------------------------------------------------
ALTER TABLE ORDER_DETAIL
ADD CONSTRAINT fk_order_detail_order
FOREIGN KEY (order_id)
REFERENCES `ORDER`(order_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ------------------------------------------------------------
-- ORDER_DETAIL → PRODUCT
-- ------------------------------------------------------------
ALTER TABLE ORDER_DETAIL
ADD CONSTRAINT fk_order_detail_product
FOREIGN KEY (product_id)
REFERENCES PRODUCT(product_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- ------------------------------------------------------------
-- INVENTORY → PRODUCT
-- ------------------------------------------------------------
ALTER TABLE INVENTORY_MOVEMENTS
ADD CONSTRAINT fk_inventory_product
FOREIGN KEY (product_id)
REFERENCES PRODUCT(product_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- ------------------------------------------------------------
-- CHECK CONSTRAINTS
-- ------------------------------------------------------------

ALTER TABLE ADDRESS
ADD CONSTRAINT chk_postal_code CHECK (LENGTH(postal_code) >= 3);

ALTER TABLE PRODUCT
ADD CONSTRAINT chk_product_price CHECK (price >= 0);

ALTER TABLE TABLES
ADD CONSTRAINT chk_table_capacity CHECK (capacity > 0);

ALTER TABLE ORDER_DETAIL
ADD CONSTRAINT chk_detail_quantity CHECK (quantity >= 0);

ALTER TABLE ORDER_DETAIL
ADD CONSTRAINT chk_detail_unit_price CHECK (unit_price >= 0);

ALTER TABLE INVENTORY_MOVEMENTS
ADD CONSTRAINT chk_inventory_qty CHECK (quantity >= 0);

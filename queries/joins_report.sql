-- ============================================================
--  queries/joins_report.sql
--  Week 13 - Advanced Queries: Joins
--  Database: restaurant_db
--  SQL Tester: CONTRERAS RIOS ANUAR DAVID
-- ============================================================

USE restaurant_db;

-- ============================================================
-- INNER JOIN QUERIES
-- Only returns records that have a match in BOTH tables
-- ============================================================

-- ------------------------------------------------------------
-- 1. List of orders with the name of the user who placed them
--    (Only orders that have a user assigned)
-- ------------------------------------------------------------
SELECT
    o.order_id,
    u.name        AS customer_name,
    u.email,
    o.order_date,
    o.status
FROM `ORDER` o
INNER JOIN `USER` u ON o.user_id = u.user_id;

-- ------------------------------------------------------------
-- 2. Order details with product name and price
--    (Only details that have a product assigned)
-- ------------------------------------------------------------
SELECT
    od.detail_id,
    od.order_id,
    p.name         AS product_name,
    od.quantity,
    od.unit_price,
    (od.quantity * od.unit_price) AS subtotal
FROM ORDER_DETAIL od
INNER JOIN PRODUCT p ON od.product_id = p.product_id;

-- ------------------------------------------------------------
-- 3. Full report: user + order + table + products
--    (Joining 4 tables with INNER JOIN)
-- ------------------------------------------------------------
SELECT
    u.name          AS customer_name,
    t.table_number,
    t.capacity,
    o.order_date,
    o.status,
    p.name          AS product_name,
    od.quantity,
    od.unit_price,
    (od.quantity * od.unit_price) AS subtotal
FROM `ORDER` o
INNER JOIN `USER`         u  ON o.user_id     = u.user_id
INNER JOIN TABLES         t  ON o.table_id    = t.table_id
INNER JOIN ORDER_DETAIL   od ON o.order_id    = od.order_id
INNER JOIN PRODUCT        p  ON od.product_id = p.product_id
ORDER BY o.order_id;

-- ============================================================
-- LEFT JOIN QUERIES
-- Returns ALL records from the left table,
-- even if there is NO match in the right table (NULL)
-- ============================================================

-- ------------------------------------------------------------
-- 4. All users and their orders
--    (Includes users who have NOT placed any order yet)
-- ------------------------------------------------------------
SELECT
    u.user_id,
    u.name         AS customer_name,
    u.email,
    o.order_id,
    o.status
FROM `USER` u
LEFT JOIN `ORDER` o ON u.user_id = o.user_id;

-- ------------------------------------------------------------
-- 5. All products and their inventory movements
--    (Includes products with no movements recorded)
-- ------------------------------------------------------------
SELECT
    p.product_id,
    p.name          AS product_name,
    p.price,
    im.movement_type,
    im.quantity,
    im.movement_date
FROM PRODUCT p
LEFT JOIN INVENTORY_MOVEMENTS im ON p.product_id = im.product_id
ORDER BY p.product_id;

-- ------------------------------------------------------------
-- 6. Users who have NO orders registered
--    (Classic LEFT JOIN + WHERE IS NULL trick)
-- ------------------------------------------------------------
SELECT
    u.user_id,
    u.name   AS customer_name,
    u.email
FROM `USER` u
LEFT JOIN `ORDER` o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

-- ============================================================
-- RIGHT JOIN QUERIES
-- Returns ALL records from the right table,
-- even if there is NO match in the left table (NULL)
-- ============================================================

-- ------------------------------------------------------------
-- 7. All tables and their assigned orders
--    (Includes tables with no active orders)
-- ------------------------------------------------------------
SELECT
    t.table_number,
    t.capacity,
    o.order_id,
    o.order_date,
    o.status
FROM `ORDER` o
RIGHT JOIN TABLES t ON o.table_id = t.table_id
ORDER BY t.table_number;

-- ------------------------------------------------------------
-- 8. Tables that currently have NO orders assigned
-- ------------------------------------------------------------
SELECT
    t.table_id,
    t.table_number,
    t.capacity
FROM `ORDER` o
RIGHT JOIN TABLES t ON o.table_id = t.table_id
WHERE o.order_id IS NULL;

-- ============================================================
-- END OF FILE - joins_report.sql
-- ============================================================

-- ============================================================
--  queries/analytics.sql
--  Week 14 - Advanced Queries: Aggregates
--  Database: restaurant_db
--  SQL Tester: contreras rios anuar david
-- ============================================================

USE restaurant_db;

-- ============================================================
-- COUNT QUERIES
-- Counts the number of records that match a condition
-- ============================================================

-- ------------------------------------------------------------
-- 1. Total number of orders in the system
-- ------------------------------------------------------------
SELECT
    COUNT(*) AS total_orders
FROM `ORDER`;

-- ------------------------------------------------------------
-- 2. Count of orders grouped by status
-- ------------------------------------------------------------
SELECT
    status,
    COUNT(*) AS total_orders
FROM `ORDER`
GROUP BY status;

-- ------------------------------------------------------------
-- 3. Count of orders placed by each user
-- ------------------------------------------------------------
SELECT
    u.name          AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM `USER` u
LEFT JOIN `ORDER` o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_orders DESC;

-- ============================================================
-- SUM QUERIES
-- Adds up numeric values
-- ============================================================

-- ------------------------------------------------------------
-- 4. Total revenue from all order details
-- ------------------------------------------------------------
SELECT
    SUM(quantity * unit_price) AS total_revenue
FROM ORDER_DETAIL;

-- ------------------------------------------------------------
-- 5. Total revenue per order
-- ------------------------------------------------------------
SELECT
    od.order_id,
    u.name                          AS customer_name,
    SUM(od.quantity * od.unit_price) AS order_total
FROM ORDER_DETAIL od
INNER JOIN `ORDER` o ON od.order_id = o.order_id
INNER JOIN `USER`  u ON o.user_id   = u.user_id
GROUP BY od.order_id, u.name
ORDER BY order_total DESC;

-- ------------------------------------------------------------
-- 6. Total units sold per product
-- ------------------------------------------------------------
SELECT
    p.name              AS product_name,
    SUM(od.quantity)    AS total_units_sold
FROM ORDER_DETAIL od
INNER JOIN PRODUCT p ON od.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_units_sold DESC;

-- ============================================================
-- AVG QUERIES
-- Calculates the average of numeric values
-- ============================================================

-- ------------------------------------------------------------
-- 7. Average price of all products on the menu
-- ------------------------------------------------------------
SELECT
    AVG(price) AS average_product_price
FROM PRODUCT;

-- ------------------------------------------------------------
-- 8. Average order total per user
-- ------------------------------------------------------------
SELECT
    u.name                              AS customer_name,
    AVG(od.quantity * od.unit_price)    AS avg_spent_per_item
FROM ORDER_DETAIL od
INNER JOIN `ORDER` o ON od.order_id = o.order_id
INNER JOIN `USER`  u ON o.user_id   = u.user_id
GROUP BY u.user_id, u.name
ORDER BY avg_spent_per_item DESC;

-- ============================================================
-- GROUP BY + HAVING QUERIES
-- HAVING filters AFTER grouping (like WHERE but for groups)
-- ============================================================

-- ------------------------------------------------------------
-- 9. Products that have been ordered more than once
--    (HAVING filters groups with total_units_sold > 1)
-- ------------------------------------------------------------
SELECT
    p.name              AS product_name,
    SUM(od.quantity)    AS total_units_sold
FROM ORDER_DETAIL od
INNER JOIN PRODUCT p ON od.product_id = p.product_id
GROUP BY p.product_id, p.name
HAVING total_units_sold > 1
ORDER BY total_units_sold DESC;

-- ------------------------------------------------------------
-- 10. Users who have placed more than 0 orders
--     (HAVING filters only active customers)
-- ------------------------------------------------------------
SELECT
    u.name              AS customer_name,
    COUNT(o.order_id)   AS total_orders
FROM `USER` u
LEFT JOIN `ORDER` o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
HAVING total_orders > 0
ORDER BY total_orders DESC;

-- ------------------------------------------------------------
-- 11. Tables that have received more than 1 order
-- ------------------------------------------------------------
SELECT
    t.table_number,
    t.capacity,
    COUNT(o.order_id)   AS total_orders
FROM TABLES t
LEFT JOIN `ORDER` o ON t.table_id = o.table_id
GROUP BY t.table_id, t.table_number, t.capacity
HAVING total_orders > 1
ORDER BY total_orders DESC;

-- ------------------------------------------------------------
-- 12. Products with total revenue above $50
--     (HAVING on a SUM result)
-- ------------------------------------------------------------
SELECT
    p.name                           AS product_name,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM ORDER_DETAIL od
INNER JOIN PRODUCT p ON od.product_id = p.product_id
GROUP BY p.product_id, p.name
HAVING total_revenue > 50
ORDER BY total_revenue DESC;

-- ============================================================
-- END OF FILE - analytics.sql
-- ============================================================

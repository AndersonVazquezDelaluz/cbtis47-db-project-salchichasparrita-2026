-- ============================================================
--  DATABASE SCHEMA
--  Engine: MySQL 8.0+  
-- ============================================================

CREATE DATABASE IF NOT EXISTS restaurant_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE restaurant_db;

-- ------------------------------------------------------------
-- 1. USER
-- ------------------------------------------------------------
CREATE TABLE `USER` (
  user_id       INT          NOT NULL AUTO_INCREMENT,
  name          VARCHAR(100) NOT NULL,
  email         VARCHAR(100) NOT NULL,
  password_hash CHAR(60)     NOT NULL,

  CONSTRAINT pk_user       PRIMARY KEY (user_id),
  CONSTRAINT uq_user_email UNIQUE (email)
);

-- ------------------------------------------------------------
-- 2. ADDRESS
-- ------------------------------------------------------------
CREATE TABLE address (
  address_id  INT          NOT NULL AUTO_INCREMENT,
  user_id     INT          NOT NULL,
  street      VARCHAR(200) NOT NULL,
  neighborhood VARCHAR(50) NOT NULL,
  city        VARCHAR(100) NOT NULL,
  state       VARCHAR(100) NOT NULL,
  postal_code VARCHAR(10)  NOT NULL,

  CONSTRAINT pk_address PRIMARY KEY (address_id),
  CONSTRAINT fk_address_user FOREIGN KEY (user_id)
      REFERENCES user (user_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  CONSTRAINT chk_postal_code CHECK (LENGTH(postal_code) >= 3)
);

-- ------------------------------------------------------------
-- 3. PRODUCT
-- ------------------------------------------------------------
CREATE TABLE PRODUCT (
  product_id  INT            NOT NULL AUTO_INCREMENT,
  name        VARCHAR(100)   NOT NULL,
  description VARCHAR(255)   DEFAULT NULL,
  price       DECIMAL(10, 2) NOT NULL,

  CONSTRAINT pk_product        PRIMARY KEY (product_id),
  CONSTRAINT uq_product_name   UNIQUE (name),
  CONSTRAINT chk_product_price CHECK (price >= 0)
);

-- ------------------------------------------------------------
-- 4. TABLES
-- ------------------------------------------------------------
CREATE TABLE TABLES (
  table_id     INT NOT NULL AUTO_INCREMENT,
  table_number INT NOT NULL,
  capacity     INT NOT NULL,

  CONSTRAINT pk_tables          PRIMARY KEY (table_id),
  CONSTRAINT uq_table_number    UNIQUE (table_number),
  CONSTRAINT chk_table_capacity CHECK (capacity > 0)
);

-- ------------------------------------------------------------
-- 5. ORDER
-- ------------------------------------------------------------
CREATE TABLE `ORDER` (
  order_id   INT  NOT NULL AUTO_INCREMENT,
  user_id    INT  NOT NULL,
  table_id   INT  NOT NULL,
  order_date DATE NOT NULL DEFAULT (CURRENT_DATE),
  status     ENUM('pending', 'in_progress', 'delivered', 'cancelled')
             NOT NULL DEFAULT 'pending',

  CONSTRAINT pk_order       PRIMARY KEY (order_id),
  CONSTRAINT fk_order_user  FOREIGN KEY (user_id)
      REFERENCES `USER` (user_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  CONSTRAINT fk_order_table FOREIGN KEY (table_id)
      REFERENCES TABLES (table_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- 6. ORDER_DETAIL
-- ------------------------------------------------------------
CREATE TABLE ORDER_DETAIL (
  detail_id  INT            NOT NULL AUTO_INCREMENT,
  order_id   INT            NOT NULL,
  product_id INT            NOT NULL,
  quantity   INT            NOT NULL,
  unit_price DECIMAL(10, 2) NOT NULL,

  CONSTRAINT pk_order_detail         PRIMARY KEY (detail_id),
  CONSTRAINT fk_order_detail_order   FOREIGN KEY (order_id)
      REFERENCES `ORDER` (order_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  CONSTRAINT fk_order_detail_product FOREIGN KEY (product_id)
      REFERENCES PRODUCT (product_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  CONSTRAINT chk_detail_quantity   CHECK (quantity   >= 0),
  CONSTRAINT chk_detail_unit_price CHECK (unit_price >= 0)
);

-- ------------------------------------------------------------
-- 7. INVENTORY_MOVEMENTS
-- ------------------------------------------------------------
CREATE TABLE INVENTORY_MOVEMENTS (
  inventory_id  INT  NOT NULL AUTO_INCREMENT,
  product_id    INT  NOT NULL,
  movement_date DATE NOT NULL DEFAULT (CURRENT_DATE),
  movement_type ENUM('SALE', 'RESTOCK') NOT NULL,
  quantity      INT  NOT NULL,

  CONSTRAINT pk_inventory         PRIMARY KEY (inventory_id),
  CONSTRAINT fk_inventory_product FOREIGN KEY (product_id)
      REFERENCES PRODUCT (product_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  CONSTRAINT chk_inventory_qty CHECK (quantity >= 0)
);


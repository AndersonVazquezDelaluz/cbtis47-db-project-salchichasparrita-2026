-- ============================================================
-- Week 7: SQL DDL - Create Structures
-- Description: Creation of database and core tables (no relations yet)
-- ============================================================

-- Create Database
CREATE DATABASE IF NOT EXISTS restaurant_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE restaurant_db;

-- ------------------------------------------------------------
-- TABLE: USER
-- Stores system users
-- ------------------------------------------------------------
CREATE TABLE USER (
  user_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password_hash CHAR(60) NOT NULL,

  CONSTRAINT pk_user PRIMARY KEY (user_id),
  CONSTRAINT uq_user_email UNIQUE (email)
);

-- ------------------------------------------------------------
-- TABLE: ADDRESS
-- Stores user addresses
-- ------------------------------------------------------------
CREATE TABLE ADDRESS (
  address_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  street VARCHAR(200) NOT NULL,
  city VARCHAR(100) NOT NULL,
  state VARCHAR(100) NOT NULL,
  postal_code VARCHAR(10) NOT NULL,

  CONSTRAINT pk_address PRIMARY KEY (address_id)
);

-- ------------------------------------------------------------
-- TABLE: PRODUCT
-- Stores menu products
-- ------------------------------------------------------------
CREATE TABLE PRODUCT (
  product_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(255),
  price DECIMAL(10,2) NOT NULL,

  CONSTRAINT pk_product PRIMARY KEY (product_id),
  CONSTRAINT uq_product_name UNIQUE (name)
);

-- ------------------------------------------------------------
-- TABLE: TABLES
-- Stores restaurant tables
-- ------------------------------------------------------------
CREATE TABLE TABLES (
  table_id INT NOT NULL AUTO_INCREMENT,
  table_number INT NOT NULL,
  capacity INT NOT NULL,

  CONSTRAINT pk_tables PRIMARY KEY (table_id),
  CONSTRAINT uq_table_number UNIQUE (table_number)
);

-- ------------------------------------------------------------
-- TABLE: ORDER
-- Stores customer orders
-- ------------------------------------------------------------
CREATE TABLE `ORDER` (
  order_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  table_id INT NOT NULL,
  order_date DATE NOT NULL DEFAULT (CURRENT_DATE),
  status ENUM('pending','in_progress','delivered','cancelled') 
         NOT NULL DEFAULT 'pending',

  CONSTRAINT pk_order PRIMARY KEY (order_id)
);

-- ------------------------------------------------------------
-- TABLE: ORDER_DETAIL
-- Stores products within orders
-- ------------------------------------------------------------
CREATE TABLE ORDER_DETAIL (
  detail_id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,

  CONSTRAINT pk_order_detail PRIMARY KEY (detail_id)
);

-- ------------------------------------------------------------
-- TABLE: INVENTORY_MOVEMENTS
-- Tracks inventory changes
-- ------------------------------------------------------------
CREATE TABLE INVENTORY_MOVEMENTS (
  inventory_id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  movement_date DATE NOT NULL DEFAULT (CURRENT_DATE),
  movement_type ENUM('SALE','RESTOCK') NOT NULL,
  quantity INT NOT NULL,

  CONSTRAINT pk_inventory PRIMARY KEY (inventory_id)
);

## USER

| Attribute     | Type         | Key                          | Constraints / Notes                                                                          |
| ------------- | ------------ | ---------------------------- | -------------------------------------------------------------------------------------------- |
| user_id       | int          | PK, AUTO_INCREMENT, NOT NULL | Auto-generated identifier; never null or repeated since it is a PK.                          |
| name          | varchar(100) | NOT NULL                     | A user must always have a registered name.                                                   |
| email         | varchar(100) | NOT NULL, UNIQUE             | Marked as unique in the description; NOT NULL because it is essential for authentication.    |
| password_hash | char(60)     | NOT NULL                     | A user cannot exist without a hashed password; CHAR(60) is correct for BCrypt.              |

## ADDRESS

| Attribute   | Type         | Key                                                    | Constraints / Notes                                                                                  |
| ----------- | ------------ | ------------------------------------------------------ | ---------------------------------------------------------------------------------------------------- |
| address_id  | int          | PK, AUTO_INCREMENT, NOT NULL                           | Auto-generated identifier.                                                                           |
| user_id     | int          | FK, NOT NULL                                           | An address always belongs to a user; ON DELETE CASCADE recommended if the user is deleted.           |
| street      | varchar(200) | NOT NULL                                               | Essential component of any address.                                                                  |
| city        | varchar(100) | NOT NULL                                               | Every valid address requires a city.                                                                 |
| state       | varchar(100) | NOT NULL                                               | Required for complete geographic location.                                                           |
| postal_code | varchar(10)  | NOT NULL, CHECK (postal_code ~ '^[A-Z0-9\- ]{3,10}$') | Minimum validatable format; NOT NULL because it is part of a functional address.                     |

## PRODUCT

| Attribute   | Type          | Key                          | Constraints / Notes                                                              |
| ----------- | ------------- | ---------------------------- | -------------------------------------------------------------------------------- |
| product_id  | int           | PK, AUTO_INCREMENT, NOT NULL | Auto-generated identifier.                                                       |
| name        | varchar(100)  | NOT NULL, UNIQUE             | Duplicate product names must not exist; always required.                         |
| description | varchar(255)  | DEFAULT NULL                 | Optional; can be left empty for simple products.                                 |
| price       | decimal(10,2) | NOT NULL, CHECK (price >= 0) | Price cannot be negative or absent; CHECK prevents data entry errors.            |

## ORDER

| Attribute  | Type | Key                            | Constraints / Notes                                                                      |
| ---------- | ---- | ------------------------------ | ---------------------------------------------------------------------------------------- |
| order_id   | int  | PK, AUTO_INCREMENT, NOT NULL   | Auto-generated identifier.                                                               |
| user_id    | int  | FK, NOT NULL                   | An order is always associated with a user; ON DELETE RESTRICT recommended.               |
| table_id   | int  | FK, NOT NULL                   | Every order in a restaurant must be associated with a table.                             |
| order_date | date | NOT NULL, DEFAULT CURRENT_DATE | Automatically recorded when the order is created; must never be empty.                   |
| status     | enum | NOT NULL, DEFAULT 'pending'    | Must always have a status; 'pending' is the logical initial value when creating an order.|

## ORDER_DETAIL

| Attribute  | Type          | Key                                | Constraints / Notes                                                              |
| ---------- | ------------- | ---------------------------------- | -------------------------------------------------------------------------------- |
| detail_id  | int           | PK, AUTO_INCREMENT, NOT NULL       | Auto-generated identifier.                                                       |
| order_id   | int           | FK, NOT NULL                       | Each detail belongs to an order; ON DELETE CASCADE if the order is deleted.      |
| product_id | int           | FK, NOT NULL                       | Must always reference an existing product; ON DELETE RESTRICT recommended.       |
| quantity   | int           | NOT NULL, CHECK (quantity >= 0)    | Quantity must be zero or greater; negative values are not allowed.               |
| unit_price | decimal(10,2) | NOT NULL, CHECK (unit_price >= 0)  | Captures the historical price at order time; must never be null or negative.     |

## TABLES

| Attribute    | Type | Key                            | Constraints / Notes                                                        |
| ------------ | ---- | ------------------------------ | -------------------------------------------------------------------------- |
| table_id     | int  | PK, AUTO_INCREMENT, NOT NULL   | Auto-generated identifier.                                                 |
| table_number | int  | NOT NULL, UNIQUE               | Each table has a unique physical number within the venue.                  |
| capacity     | int  | NOT NULL, CHECK (capacity > 0) | Minimum capacity is 1 person; zero or negative values are invalid.         |

## INVENTORY_MOVEMENTS

| Attribute     | Type | Key                            | Constraints / Notes                                                                                  |
| ------------- | ---- | ------------------------------ | ---------------------------------------------------------------------------------------------------- |
| inventory_id  | int  | PK, AUTO_INCREMENT, NOT NULL   | Auto-generated identifier.                                                                           |
| product_id    | int  | FK, NOT NULL                   | Every movement must be linked to a product; ON DELETE RESTRICT recommended.                          |
| movement_date | date | NOT NULL, DEFAULT CURRENT_DATE | Automatically recorded; a movement without a date cannot be audited.                                 |
| movement_type | enum | NOT NULL                       | Must always specify whether it is a SALE or RESTOCK to maintain traceability.                        |
| quantity      | int  | NOT NULL, CHECK (quantity >= 0)| Quantity must be zero or greater; the type (SALE/RESTOCK) defines the direction of the movement.    |

---

> **General Notes:**
> - `ON DELETE RESTRICT` on FKs referencing `PRODUCT` and `USER` protects the historical integrity of orders and inventory.
> - `ON DELETE CASCADE` is appropriate for `ADDRESS.user_id` if the business policy requires deleting all user data.
> - `CHECK` constraints with regex (e.g., `postal_code`) depend on the database engine: MySQL supports simple `CHECK`; PostgreSQL supports regular expressions using `~`.

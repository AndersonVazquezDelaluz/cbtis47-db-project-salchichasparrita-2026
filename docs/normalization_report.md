# Normalization Report of the ER Diagram (Up to Third Normal Form)

## Introduction

In this report, I will explain the normalization process of my ER diagram for a café database system. During my conversation, I analyzed my tables to check if they follow the Third Normal Form (3NF). I made several corrections to improve the structure of the database and remove problems like repeated data and calculated values.

The goal of normalization is to organize the database correctly and avoid update, insert, and delete anomalies.

---

## What is Third Normal Form (3NF)?

Third Normal Form means that:

- Every non-key attribute must depend only on the primary key.
- No non-key attribute can depend on another non-key attribute.
- There should be no transitive dependencies.

In simple words, each column must depend only on the main ID of the table and nothing else.

---

## Initial Problems in the Diagram

At the beginning, my ER diagram had some violations of 3NF.

### 1. The `total` Field in ORDER

In the first version, the ORDER table had a field called `total`.

This was a problem because the total value can be calculated using:

- `quantity` (from ORDER_DETAIL)
- `unit_price` (from ORDER_DETAIL)

So, `total` was a derived value. It did not directly depend on the primary key (`order_id`). Because it can be calculated from other data, keeping it in the table violates 3NF.

**Solution:**  
I removed the `total` field from ORDER.

---

### 2. The `stock` Field in PRODUCT

Originally, the PRODUCT table had a `stock` field.

The problem is that stock changes every time there is a sale or restock. Instead of saving the final stock number, it is better to save each inventory movement.

If we keep stock in PRODUCT, it becomes derived data because we can calculate it by adding and subtracting all inventory movements.

**Solution:**  
I removed `stock` from PRODUCT and created a new table called `INVENTORY_MOVEMENTS`.

---

## Creation of INVENTORY_MOVEMENTS Table

To solve the stock problem and follow 3NF, I created a new table:

### INVENTORY_MOVEMENTS

- `inventory_id` (PK)  
- `product_id` (FK)  
- `movement_date`  
- `movement_type` (ENUM: `'SALE'`, `'RESTOCK'`)  
- `quantity`  

This table stores events (movements), not results.

The stock is not saved directly. Instead, it is calculated using all the `quantity` values. This avoids redundancy and follows 3NF.

---

## Separation of ADDRESS from USER

At the beginning, the USER table had an `address` field.

This was not flexible because:

- A user can have more than one address.
- The address can be divided into `street`, `city`, `state`, and `postal_code`.

**Solution:**  
I created a separate ADDRESS table with a foreign key to USER.

This improves normalization and allows multiple addresses per user.

---

## Improvement of Data Types

Some improvements were also made:

- Changed `float` to `decimal` for money values (like `price` and `unit_price`).
- Changed `ORDER.status` to ENUM (`pending`, `confirmed`, `preparing`, `ready`, `served`, `paid`, `cancelled`).
- Used `DATE` type instead of `VARCHAR` for dates.

These changes improve data integrity and professionalism.

---

## Final ER Diagram Structure

The final system includes these main tables:

- USER  
- ADDRESS  
- TABLE  
- ORDER  
- ORDER_DETAIL  
- PRODUCT  
- INVENTORY_MOVEMENTS  

All tables now follow 3NF because:

- There are no derived attributes stored.
- There are no transitive dependencies.
- Every non-key attribute depends only on its primary key.

---

## Conclusion

After analyzing and modifying the ER diagram, I can say that the database now follows Third Normal Form (3NF).

The biggest improvements were:

- Removing derived fields like `total` and `stock`.
- Creating the `INVENTORY_MOVEMENTS` table.
- Separating `ADDRESS` from `USER`.

Now the database structure is cleaner, more efficient, and avoids data redundancy. This makes the system more professional and easier to maintain.

I learned that normalization is very important to design a correct and reliable database system.

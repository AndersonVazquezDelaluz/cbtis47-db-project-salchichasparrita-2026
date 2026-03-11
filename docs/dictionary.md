## USER
| Attribute | Type         | Key | Description                        |
| --------- | ------------ | --- | ---------------------------------- |
| user_id   | int          | PK  | Unique identifier for the user     |
| name      | varchar(100) |     | Full name of the user              |
| email     | varchar(100) |     | Email address of the user (unique) |
| password_hash| char(60) |     | Securely hashed password (optimized for BCrypt/Argon2). |


## ADDRESS
| Attribute   | Type         | Key | Description                       |
| ----------- | ------------ | --- | --------------------------------- |
| address_id  | int          | PK  | Unique identifier for the address |
| user_id     | int          | FK  | References USER(user_id)          |
| street      | varchar(200) |     | Street name and number            |
| city        | varchar(100) |     | City                              |
| state       | varchar(100) |     | State or province                 |
| postal_code | varchar(10)  |     | Postal code                       |


## PRODUCT
| Attribute   | Type          | Key | Description                          |
| ----------- | ------------- | --- | ------------------------------------ |
| product_id  | int           | PK  | Unique identifier for the product    |
| name        | varchar(100)  |     | Name of the product                  |
| description | varchar(255)  |     | Description of the product           |
| price       | decimal(10,2) |     | Current selling price of the product |


## ORDER
| Attribute  | Type | Key | Description                                              |
| ---------- | ---- | --- | -------------------------------------------------------- |
| order_id   | int  | PK  | Unique identifier for the order                          |
| user_id    | int  | FK  | References USER(user_id)                                 |
| table_id   | int  | FK  | References TABLE(table_id)                               |
| order_date | date |     | Date when the order was placed                           |
| status     | enum |     | Order status (e.g., pending, paid, cancelled, completed) |



## ORDER_DETAIL
| Attribute  | Type          | Key | Description                            |
| ---------- | ------------- | --- | -------------------------------------- |
| detail_id  | int           | PK  | Unique identifier for the order detail |
| order_id   | int           | FK  | References ORDER(order_id)             |
| product_id | int           | FK  | References PRODUCT(product_id)         |
| quantity   | int           |     | Quantity of the product ordered        |
| unit_price | decimal(10,2) |     | Product price at the time of the order |


## Tables
| Attribute    | Type | Key | Description                      |
| ------------ | ---- | --- | -------------------------------- |
| table_id     | int  | PK  | Unique identifier for the table  |
| table_number | int  |     | Physical table number            |
| capacity     | int  |     | Maximum number of people allowed |


## INVENTORY_MOVEMENTS
| Attribute     | Type | Key | Description                                  |
| ------------- | ---- | --- | -------------------------------------------- |
| inventory_id  | int  | PK  | Unique identifier for the inventory movement |
| product_id    | int  | FK  | References PRODUCT(product_id)               |
| movement_date | date |     | Date of the inventory movement               |
| movement_type | enum |     | Type of movement (SALE, RESTOCK)             |
| quantity      | int  |     | Quantity added or removed from inventory     |

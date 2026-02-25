## USER
| Attribute | Type         | Key | Description                    |
| --------- | ------------ | --- | ------------------------------ |
| user_id   | int          | PK  | Unique identifier for the user |
| name      | varchar(100) |     | Full name of the user          |
| email     | varchar(100) |     | Email address of the user      |

## ADDRESS
| Attribute   | Type         | Key | Description                       |
| ----------- | ------------ | --- | --------------------------------- |
| address_id  | int          | PK  | Unique identifier for the address |
| user_id     | int          | FK  | References USER                   |
| street      | varchar(200) |     | Street and number                 |
| city        | varchar(100) |     | City                              |
| state       | varchar(100) |     | State                             |
| postal_code | varchar(10)  |     | Postal code                       |

## PRODUCT
| Attribute   | Type          | Key | Description                       |
| ----------- | ------------- | --- | --------------------------------- |
| product_id  | int           | PK  | Unique identifier for the product |
| name        | varchar(100)  |     | Name of the product               |
| description | varchar(255)  |     | Description of the product        |
| price       | decimal(10,2) |     | Price of the product              |
| stock       | int           |     | Quantity available in inventory   |


## ORDER
| Attribute  | Type        | Key | Description                               |
| ---------- | ----------- | --- | ----------------------------------------- |
| order_id   | int         | PK  | Unique identifier for the order           |
| user_id    | int         | FK  | References USER                           |
| table_id   | int         | FK  | References TABLE                          |
| order_date | date        |     | Date when the order was placed            |
| status     | varchar(20) |     | Status of the order (pending, paid, etc.) |


## ORDER_DETAIL
| Attribute  | Type          | Key | Description                             |
| ---------- | ------------- | --- | --------------------------------------- |
| detail_id  | int           | PK  | Unique identifier for the order detail  |
| order_id   | int           | FK  | References ORDER                        |
| product_id | int           | FK  | References PRODUCT                      |
| quantity   | int           |     | Quantity of the product in this detail  |
| unit_price | decimal(10,2) |     | Price per unit at the time of the order |


## Tables
| Attribute    | Type | Key | Description                     |
| ------------ | ---- | --- | ------------------------------- |
| table_id     | int  | PK  | Unique identifier for the table |
| table_number | int  |     | Physical table number           |
| capacity     | int  |     | Number of people the table fits |



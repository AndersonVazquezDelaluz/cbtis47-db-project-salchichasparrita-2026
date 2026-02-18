USER
| Attribute | Type   | Key | Description                    |
| --------- | ------ | --- | ------------------------------ |
| user_id   | int    | PK  | Unique identifier for the user |
| name      | string |     | Full name of the user          |
| email     | string |     | Email address of the user      |
| address   | string |     | Physical address of the user   |

PRODUCT
| Attribute   | Type   | Key | Description                       |
| ----------- | ------ | --- | --------------------------------- |
| product_id  | int    | PK  | Unique identifier for the product |
| name        | string |     | Name of the product               |
| description | string |     | Description of the product        |
| price       | float  |     | Price of the product              |
| stock       | int    |     | Quantity available in inventory   |

ORDER
| Attribute  | Type  | Key | Description                     |
| ---------- | ----- | --- | ------------------------------- |
| order_id   | int   | PK  | Unique identifier for the order |
| user_id    | int   | FK  | References USER                 |
| order_date | date  |     | Date when the order was placed  |
| total      | float |     | Total amount of the order       |

ORDER_DETAIL
| Attribute  | Type  | Key | Description                             |
| ---------- | ----- | --- | --------------------------------------- |
| detail_id  | int   | PK  | Unique identifier for the order detail  |
| order_id   | int   | FK  | References ORDER                        |
| product_id | int   | FK  | References PRODUCT                      |
| quantity   | int   |     | Quantity of the product in this detail  |
| unit_price | float |     | Price per unit at the time of the order |

Tables
| Attribute | Type | Key | Description                     |
| --------- | ---- | --- | ------------------------------- |
| tables_id | int  | PK  | Unique identifier for the table |
| detail_id | int  | FK  | References ORDER_DETAIL         |

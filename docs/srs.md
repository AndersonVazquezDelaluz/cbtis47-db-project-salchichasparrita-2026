# Software Requirements Specification
## Chicaffe — Cafeteria Management System

| Field | Value |
|---|---|
| **Project** | Chicaffe Web |
| **Document Version** | 2.0 |
| **Date** | May 29, 2026 |
| **Repository** | `cbtis47-db-project-salchichasparrita-2026` |
| **Stack** | Node.js · Express · MySQL · HTML/CSS/JavaScript |
| **Prepared by** | Anderson Vázquez (Analyst & Designer) |
| **Institution** | CBTIS 47 — 2026 |
| **Status** | In Progress |

---

## 1. Introduction

This document specifies the functional and non-functional requirements of **Chicaffe**, a web-based cafeteria management system developed as an academic project at CBTIS 47. It serves as the reference for the development team, covering all system behaviors, quality attributes, and constraints derived from the Technical Summary v1.1 and the Sprint Backlog v2.1.

**System actors:**

| Actor | Description |
|---|---|
| **Administrator** | Full access to all modules: users, products, tables, orders, and reports. |
| **Employee** | Operational access: order management and read-only access to products and tables. |

---

## 2. Functional Requirements

### 2.1 Authentication (EP-01)

| ID | Description |
|---|---|
| FR-01 | The system must allow administrators to register users with name, email, and password. |
| FR-02 | The system must validate that the email is unique before creating a new user. |
| FR-03 | The system must display validation messages when a required field is empty or contains an invalid value. |
| FR-04 | The system must authenticate users by verifying the password against hashed credentials stored in the database. |
| FR-05 | The system must redirect the user to the dashboard after a successful login. |
| FR-06 | The system must allow users to log out at any time. |
| FR-07 | Protected routes must require authentication; unauthenticated requests must be redirected to the login page. |

---

### 2.2 User Management (EP-02)

| ID | Description |
|---|---|
| FR-08 | The system must allow administrators to view the complete list of registered users. |
| FR-09 | The system must allow searching users by name using a search field. |
| FR-10 | The system must allow assigning a role (Administrator or Employee) when creating a user. |
| FR-11 | The system must store the assigned role in the database and display it in the user's profile. |

---

### 2.3 Products & Inventory (EP-03)

| ID | Description |
|---|---|
| FR-12 | The system must allow creating, updating, and deleting products from the catalogue. |
| FR-13 | The system must manage inventory movements of type SALE and RESTOCK. |
| FR-14 | The system must display a visual indicator for products with zero stock. |

---

### 2.4 Tables (EP-04)

| ID | Description |
|---|---|
| FR-15 | The system must allow managing tables with table number and capacity (create, read, update, and delete). |

---

### 2.5 Orders (EP-05)

| ID | Description |
|---|---|
| FR-16 | The system must allow creating orders linked to a user and a table. |
| FR-17 | The system must allow adding products to an existing order. |
| FR-18 | The system must manage the order lifecycle: `pending → in_progress → delivered → cancelled`. |
| FR-19 | The system must decrease the inventory of a product when it is added to an order. |
| FR-20 | The system must restore the inventory of products when an order is cancelled. |
| FR-21 | The system must prevent invalid order status transitions. |
| FR-22 | The system must preserve the product price at the time of order creation via a `unit_price` snapshot field. |

---

### 2.6 Sales Reports (EP-06)

| ID | Description |
|---|---|
| FR-23 | The system must generate daily sales reports based on orders with status `delivered`. |
| FR-24 | The system must allow filtering reports by a user-defined date range. |
| FR-25 | The system must display a bar chart (sales by day), a pie chart (top-selling products), and a line chart (cumulative sales trend). |
| FR-26 | The system must display an informational message when no orders exist within the selected date range. |

---

### 2.7 Order History (EP-07)

| ID | Description |
|---|---|
| FR-27 | The system must display all past orders including date, table, total amount, and status. |
| FR-28 | The system must allow searching order history by order ID, customer name, or date. |
| FR-29 | The system must display a detail view for a selected order showing all products, quantities, unit prices, and subtotal. |

---

### 2.8 Report Export (EP-07)

| ID | Description |
|---|---|
| FR-30 | The system must allow exporting reports as CSV files with all records and column headers. |
| FR-31 | The system must allow exporting reports as PDF files including the report title, generation date, and all data rows. |
| FR-32 | Export buttons must be disabled when no report has been generated. |

---

### 2.9 Role-Based Access Control — RBAC (EP-07)

| ID | Description |
|---|---|
| FR-33 | Employees must be denied access to the user management and reports sections. |
| FR-34 | The system must display an access-denied message when an employee attempts to access a restricted section. |
| FR-35 | Administrators must have full access to all system features and data. |

---

### 2.10 Performance & Error Handling (EP-07)

| ID | Description |
|---|---|
| FR-36 | The system must apply server-side pagination to lists exceeding 500 records. |
| FR-37 | The system must display a network error message and preserve form data when a request fails due to no internet connection. |
| FR-38 | The system must display per-field validation messages and keep the form populated when it is submitted with invalid data. |
| FR-39 | The system must display a generic error message and keep the UI stable when an unhandled server-side exception occurs. |

---

## 3. Non-Functional Requirements

### 3.1 Performance

| ID | Description |
|---|---|
| NFR-01 | Any page must be fully rendered and interactive within 2 seconds under normal load. |
| NFR-02 | Data must load in under 3 seconds. |
| NFR-03 | Save operations must complete in under 2 seconds. |
| NFR-04 | Server-side pagination must limit the query payload to the current page; MySQL indexes must be applied to frequently queried columns (`order_date`, `user_id`, `status`). |

---

### 3.2 Security

| ID | Description |
|---|---|
| NFR-05 | Passwords must be stored as bcrypt hashes (`char(60)`); plain-text passwords must never be stored. |
| NFR-06 | All protected routes must be validated server-side via Express middleware before granting access. |
| NFR-07 | Role checks must be enforced on the server, not only on the client. |

---

### 3.3 Reliability

| ID | Description |
|---|---|
| NFR-08 | The system must detect internet disconnection and notify the user without losing form data. |
| NFR-09 | The product price must be captured as a snapshot (`unit_price`) at order creation time; subsequent price changes must not affect existing orders. |
| NFR-10 | Internal server errors must be logged and must not crash the server process. |

---

### 3.4 Compatibility

| ID | Description |
|---|---|
| NFR-11 | The system must run correctly on Chromium-based browsers (Google Chrome, Microsoft Edge). |
| NFR-12 | The system must be built using Node.js v18+, Express.js, MySQL, HTML5, CSS3, and vanilla JavaScript. |
| NFR-13 | The system must be deployable in a local XAMPP environment on port 3000. |

---

### 3.5 Maintainability

| ID | Description |
|---|---|
| NFR-14 | Code must be clean, well-commented, and organized according to the defined project structure. |
| NFR-15 | All source code must be version-controlled using Git and hosted on GitHub. |
| NFR-16 | The database schema, seed data, and maintenance scripts must be kept in separate `.sql` files under `/src`. |

---

### 3.6 Usability

| ID | Description |
|---|---|
| NFR-17 | The interface must be fully responsive across desktop and mobile viewports. |
| NFR-18 | Destructive actions (delete, cancel order) must require a confirmation dialog before proceeding. |

---

## 4. Requirements Summary

### 4.1 Functional Requirements

| Module / Epic | Identifiers | Total |
|---|---|:---:|
| EP-01 — Authentication | FR-01 to FR-07 | 7 |
| EP-02 — User Management | FR-08 to FR-11 | 4 |
| EP-03 — Products & Inventory | FR-12 to FR-14 | 3 |
| EP-04 — Tables | FR-15 | 1 |
| EP-05 — Orders | FR-16 to FR-22 | 7 |
| EP-06 — Sales Reports | FR-23 to FR-26 | 4 |
| EP-07 — Order History | FR-27 to FR-29 | 3 |
| EP-07 — Report Export | FR-30 to FR-32 | 3 |
| EP-07 — RBAC | FR-33 to FR-35 | 3 |
| EP-07 — Performance & Error Handling | FR-36 to FR-39 | 4 |
| **Total** | **FR-01 to FR-39** | **39** |

### 4.2 Non-Functional Requirements

| Category | Identifiers | Total |
|---|---|:---:|
| Performance | NFR-01 to NFR-04 | 4 |
| Security | NFR-05 to NFR-07 | 3 |
| Reliability | NFR-08 to NFR-10 | 3 |
| Compatibility | NFR-11 to NFR-13 | 3 |
| Maintainability | NFR-14 to NFR-16 | 3 |
| Usability | NFR-17 to NFR-18 | 2 |
| **Total** | **NFR-01 to NFR-18** | **18** |

---

*Document generated for academic use — CBTIS 47 · 2026*

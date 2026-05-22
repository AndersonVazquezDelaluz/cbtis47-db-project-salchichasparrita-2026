# 📋 Product Backlog — Chicaffe

**Project:** Chicaffe - Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Stack:** HTML · CSS · JavaScript · Supabase
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 1.2 | **Date:** May 14, 2026

---

## 🎯 Product Goal

> Develop a comprehensive cafeteria management system that enables efficient administration of users, inventory, tables, orders, and reports — optimizing daily operations, reducing manual errors, improving stock control, and increasing service speed for Chicaffe customers.

---

## 🗺️ Epics

| ID | Epic | Priority | Partial |
|---|---|---|---|
| EP-01 | Authentication | High | 1st Partial |
| EP-02 | User Management | High | 1st Partial |
| EP-03 | Products & Inventory | High | 1st Partial |
| EP-04 | Tables | Medium | 2nd Partial |
| EP-05 | Orders | High | 2nd Partial |
| EP-06 | Reports | Medium | 2nd Partial |
| EP-07 | Enhancements & Polish | Medium | 3rd Partial |

---

# 🟦 FIRST PARTIAL

## Sprint 1 — Authentication `EP-01`

**Sprint Goal:** Enable secure access to the system through registration, login, logout, and protected routes.

---

### US-01 · User Registration by Administrator

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to register new users with name, email and password so that staff can access the system. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: User Registration

  Scenario: Successful registration
    Given the admin is on the registration form
    And all fields are completed
    When the admin submits the form
    Then the system creates the account in Supabase Auth
    And shows a success message

  Scenario: Duplicate email
    Given an account with that email already exists
    When the admin tries to register the user
    Then the system shows "This email is already registered"

  Scenario: Empty fields
    Given the admin leaves any field empty
    When the form is submitted
    Then the system highlights the missing fields and shows validation messages
```

---

### US-02 · User Login

| Field | Detail |
|---|---|
| **Role** | Registered user |
| **User Story** | As a registered user, I want to log in with my email and password so that I can access the dashboard. |
| **Story Points** | 3 SP |

**Acceptance Criteria:**

```gherkin
Feature: User Login

  Scenario: Successful login
    Given a registered user
    When correct email and password are entered
    Then the system authenticates and redirects to the dashboard

  Scenario: Invalid credentials
    Given incorrect email or password
    When login is attempted
    Then the system shows "Invalid email or password"
```

---

### US-03 · Logout

| Field | Detail |
|---|---|
| **Role** | Authenticated user |
| **User Story** | As an authenticated user, I want to log out at any time so that my session is safely terminated. |
| **Story Points** | 2 SP |

**Acceptance Criteria:**

```gherkin
Feature: Logout

  Scenario: Successful logout
    Given the user has an active session
    When the user clicks "Logout"
    Then the session is terminated
    And the user is redirected to the login page
```

---

### US-04 · Protected Routes

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want protected pages to be accessible only by authenticated users so that unauthorized access is prevented. |
| **Story Points** | 3 SP |

**Acceptance Criteria:**

```gherkin
Feature: Protected Routes

  Scenario: Access without session
    Given the user is not logged in
    When trying to access a protected page
    Then the system redirects to the login page

  Scenario: Access with valid session
    Given the user is logged in
    When accessing a protected page
    Then the page loads normally
```

---

## Sprint 2 — User Management `EP-02`

**Sprint Goal:** Provide admins with full visibility and searchability over registered system users.

---

### US-05 · View Users List

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to see all registered users in a table so that I have full visibility of the system's staff. |
| **Story Points** | 3 SP |

**Acceptance Criteria:**

```gherkin
Feature: Users List

  Scenario: Display all users
    Given the admin is on the users page
    When the page loads
    Then all registered users are shown in a table
```

---

### US-06 · Search Users by Name

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to search users by name so that I can quickly find a specific user. |
| **Story Points** | 2 SP |

**Acceptance Criteria:**

```gherkin
Feature: Search Users

  Scenario: Search with results
    Given the users list is loaded
    When the admin types a name
    Then only matching users are shown
```

---

## Sprint 3 — Products & Inventory `EP-03`

**Sprint Goal:** Give admins full CRUD control over products and maintain accurate real-time inventory.

---

### US-07 · Create Product

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to create new products with name, price and initial stock so that the catalog stays up to date. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Create Product

  Scenario: Successful creation
    Given the admin is on the new product form
    When all required fields are filled and submitted
    Then the product is saved and appears in the products list
```

---

### US-08 · Edit and Delete Product

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to edit and delete existing products so that the catalog remains accurate. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Edit and Delete Product

  Scenario: Edit product
    Given a product exists
    When the admin edits and saves
    Then the changes are updated

  Scenario: Delete product
    Given a product exists
    When the admin deletes it with confirmation
    Then the product is removed from the system
```

---

### US-09 · Restock Inventory

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to restock products so that stock levels are always accurate. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Restock Inventory

  Scenario: Successful restock
    Given a product exists
    When a restock quantity is registered
    Then the stock increases accordingly
```

---

### US-10 · Out of Stock Visual Indicator

| Field | Detail |
|---|---|
| **Role** | User |
| **User Story** | As a user, I want to visually identify out-of-stock products so that I avoid attempting to order unavailable items. |
| **Story Points** | 2 SP |

**Acceptance Criteria:**

```gherkin
Feature: Out of Stock Indicator

  Scenario: Product without stock
    Given a product has zero stock
    When it is displayed in the list
    Then a clear visual indicator "Out of Stock" is shown
```

---

# 🟩 SECOND PARTIAL

## Sprint 4 — Tables `EP-04`

**Sprint Goal:** Allow admins to manage physical cafeteria tables to support order assignment.

---

### US-11 · Tables Management (CRUD)

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to create, edit and delete tables so that orders can be accurately assigned to physical tables. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Tables Management

  Scenario: Create table
    Given the admin is on the tables section
    When entering a number and capacity and confirming
    Then the table is created successfully

  Scenario: Edit table
    Given a table exists
    When the admin updates its details
    Then the changes are saved

  Scenario: Delete table
    Given a table exists with no active orders
    When the admin deletes it
    Then the table is removed from the system
```

---

## Sprint 5 — Orders `EP-05`

**Sprint Goal:** Enable employees to fully manage the lifecycle of customer orders with automatic inventory control.

---

### US-12 · Create Order

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | As an employee, I want to create a new order linked to a user and table so that customer requests are tracked from the start. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Create Order

  Scenario: Successful order creation
    Given a user and a table are selected
    When the order is created
    Then the order is registered with status "pending"
```

---

### US-13 · Add Products to Order

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | As an employee, I want to add products to an order with automatic inventory deduction so that stock is always kept accurate. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: Add Products to Order

  Scenario: Add product with available stock
    Given the product has available stock
    When the product is added to the order
    Then inventory is decreased and the product appears in the order

  Scenario: Product out of stock
    Given the product has zero stock
    When trying to add it to the order
    Then the system blocks the action and shows a warning
```

---

### US-14 · Change Order Status

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | As an employee, I want to change the order status through valid transitions so that order progress is accurately tracked. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Order Status Change

  Scenario: Valid status transition
    Given an order in a valid status
    When changing to the next allowed status
    Then the status is updated

  Scenario: Invalid status transition
    Given a delivered order
    When trying to revert the status
    Then the system prevents the change and shows a message
```

---

### US-15 · Cancel Order and Restore Inventory

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | As an employee, I want to cancel an active order and restore the consumed stock so that inventory stays accurate even when orders are cancelled. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: Cancel Order

  Scenario: Cancel with stock restoration
    Given an active order containing products
    When the order is cancelled
    Then the status changes to "cancelled"
    And the inventory for each product is restored
```

---

## Sprint 6 — Reports `EP-06`

**Sprint Goal:** Provide administrators with actionable daily sales insights.

---

### US-16 · Daily Sales Report

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to generate a daily sales report so that I can monitor revenue and order volume. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: Daily Sales Report

  Scenario: Generate report
    Given there are delivered orders for the selected day
    When the report is generated
    Then total sales, order count, and product details are displayed

  Scenario: No orders for the day
    Given no orders were delivered that day
    When the report is generated
    Then the system shows "No sales data for the selected period"
```

---

# 🟨 THIRD PARTIAL

## Sprint 7 — Enhancements & Polish `EP-07`

**Sprint Goal:** Elevate the system with advanced analytics, role-based security, export capabilities, and production-grade reliability.

---

### US-17 · Advanced Sales Reports with Charts

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want interactive charts and date range filters so that I can analyze sales trends more effectively. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: Advanced Sales Reports

  Scenario: Generate report with date filter
    Given the admin is on the reports page
    When selecting a date range and clicking "Generate"
    Then the system shows total sales, number of orders, and top products

  Scenario: Interactive charts
    Given a report has been generated
    When the page loads
    Then bar charts, pie charts and line charts are displayed using Chart.js

  Scenario: No data in range
    Given no orders exist in the selected period
    When generating the report
    Then the system shows "No sales data for the selected period"
```

---

### US-18 · Order History and Search

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to search and filter past orders so that I can easily find specific transactions. |
| **Story Points** | 6 SP |

**Acceptance Criteria:**

```gherkin
Feature: Order History

  Scenario: View order history
    Given the admin accesses the order history page
    When the page loads
    Then all past orders are displayed with date, table, total and status

  Scenario: Search and filter orders
    Given the history is loaded
    When searching by order ID, customer name or date
    Then only matching orders are shown

  Scenario: View order details
    Given an order exists in history
    When clicking on it
    Then a modal shows all products, quantities and subtotal
```

---

### US-19 · User Roles and Permissions

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to assign roles (Admin / Employee) to control access to system features so that each user only sees what they are authorized to use. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: User Roles

  Scenario: Assign role when creating user
    Given the admin is registering a new user
    When selecting a role (Admin or Employee)
    Then the role is saved in the database

  Scenario: Role-based access — Employee
    Given a user with "Employee" role
    When trying to access user management or reports
    Then access is denied and an informational message is shown

  Scenario: Role-based access — Admin
    Given a user with "Admin" role
    When accessing any section of the system
    Then full access is granted
```

---

### US-20 · Export Reports (PDF / CSV)

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to export reports in PDF and CSV formats so that I can share and archive sales data externally. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Export Reports

  Scenario: Export to CSV
    Given a report has been generated
    When clicking "Export CSV"
    Then a .csv file is downloaded with all report data

  Scenario: Export to PDF
    Given a report has been generated
    When clicking "Export PDF"
    Then a formatted .pdf file is downloaded (generated via jsPDF)
```

---

### US-21 · Performance Optimization

| Field | Detail |
|---|---|
| **Role** | Developer |
| **User Story** | As a developer, I want the system to load fast and respond quickly so that the user experience is smooth even with large data sets. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Performance Optimization

  Scenario: Fast page loading
    Given the user navigates between pages
    When any page is loaded
    Then loading time is under 2 seconds

  Scenario: Optimized queries
    Given large volumes of data exist
    When loading users, products or orders
    Then pagination and indexing are applied
```

---

### US-22 · Improved Error Handling

| Field | Detail |
|---|---|
| **Role** | User |
| **User Story** | As a user, I want clear and friendly error messages so that I understand what went wrong and can take corrective action. |
| **Story Points** | 4 SP |

**Acceptance Criteria:**

```gherkin
Feature: Error Handling

  Scenario: Network error
    Given there is no internet connection
    When performing any action
    Then the message "Connection error. Please check your internet." is shown

  Scenario: Validation error
    Given incorrect data is entered in a form
    When submitting
    Then specific and clear validation messages are displayed per field

  Scenario: Server error
    Given an unexpected server-side error occurs
    When the action fails
    Then the message "An unexpected error occurred. Please try again later." is shown
```

---

## 📊 Project Summary

| Partial | Sprints | User Stories | Story Points |
|---|---|---|---|
| 1st Partial | 1 – 3 | 10 | 35 SP |
| 2nd Partial | 4 – 6 | 6 | 39 SP |
| 3rd Partial | 7 | 6 | 36 SP |
| **Total** | **7** | **22** | **110 SP** |

---

## ⚙️ Functional Requirements (SRS)

| ID | Requirement |
|---|---|
| RF-01 | The system shall allow administrators to register, edit, and deactivate users. |
| RF-02 | The system shall authenticate users via Supabase Auth with email and password. |
| RF-03 | The system shall enforce session-based protected routes; unauthenticated users are redirected to login. |
| RF-04 | The system shall support full CRUD operations for products, including name, price, and stock. |
| RF-05 | The system shall automatically decrease product stock when a product is added to an order. |
| RF-06 | The system shall restore product stock when an order is cancelled. |
| RF-07 | The system shall prevent adding out-of-stock products to an order. |
| RF-08 | The system shall allow orders to transition through defined statuses: `pending → in-progress → delivered / cancelled`. |
| RF-09 | The system shall generate daily and date-ranged sales reports with totals and top products. |
| RF-10 | The system shall support role-based access control (Admin / Employee). |
| RF-11 | The system shall allow exporting reports in CSV and PDF formats. |
| RF-12 | The system shall display interactive charts (bar, pie, line) in the reports section. |

---

## 🔒 Non-Functional Requirements (SRS)

| ID | Category | Requirement |
|---|---|---|
| RNF-01 | Performance | Any page must load within 2 seconds under normal conditions. |
| RNF-02 | Security | All routes must be protected; passwords handled exclusively by Supabase Auth. |
| RNF-03 | Usability | The UI must be responsive and functional on screens ≥ 768 px wide. |
| RNF-04 | Availability | The system must maintain 99% uptime during school operating hours. |
| RNF-05 | Scalability | Queries must use pagination and indexing when data exceeds 500 records. |
| RNF-06 | Maintainability | Code must follow consistent naming conventions and be modularized by feature. |
| RNF-07 | Error Handling | All API errors must be caught and surfaced as user-friendly messages. |

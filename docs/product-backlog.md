# Product Backlog — Chicaffe

**Project:** Chicaffe - Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Stack:** HTML · CSS · JavaScript · Supabase
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 1.2 | **Date:** May 14, 2026

---

## Product Goal

> Develop a comprehensive cafeteria management system that enables efficient administration of users, inventory, tables, orders, and reports — optimizing daily operations, reducing manual errors, improving stock control, and increasing service speed for Chicaffe customers.

---

## Epics

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
| **User Story** | As an administrator, I want to register new users with name, email, and password so that staff members can access the system. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: User Registration

  Scenario: Successful registration
    Given the administrator is on the registration form
    When all required fields are completed and the form is submitted
    Then the system creates the account
    And a success message is displayed

  Scenario: Duplicate email
    Given an account with that email already exists in the system
    When the administrator attempts to register a new user with that email
    Then the system displays the message "This email is already registered"

  Scenario: Empty fields
    Given the administrator leaves one or more fields empty
    When the form is submitted
    Then the system highlights the missing fields
    And displays a validation message for each empty field
```

---

### US-02 · User Login

| Field | Detail |
|---|---|
| **Role** | Registered user |
| **User Story** | As a registered user, I want to log in with my email and password so that I can access the system dashboard. |
| **Story Points** | 3 SP |

**Acceptance Criteria:**

```gherkin
Feature: User Login

  Scenario: Successful login
    Given a registered user is on the login page
    When the correct email and password are entered and submitted
    Then the system authenticates the user
    And redirects them to the dashboard

  Scenario: Invalid credentials
    Given a user is on the login page
    When an incorrect email or password is entered
    Then the system displays the message "Invalid email or password"
    And the user remains on the login page
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
    When the user clicks the "Logout" button
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

  Scenario: Access attempt without an active session
    Given the user is not logged in
    When the user tries to access a protected page
    Then the system redirects them to the login page

  Scenario: Access with a valid session
    Given the user is logged in with a valid session
    When the user navigates to a protected page
    Then the page loads normally
```

---

## Sprint 2 — User Management `EP-02`

**Sprint Goal:** Provide administrators with full visibility and searchability over all registered system users.

---

### US-05 · View Users List

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to see all registered users displayed in a table so that I have full visibility of the system's staff. |
| **Story Points** | 3 SP |

**Acceptance Criteria:**

```gherkin
Feature: Users List

  Scenario: Display all users
    Given the administrator is on the users page
    When the page finishes loading
    Then all registered users are shown in a table with their name, email, role, and status
```

---

### US-06 · Search Users by Name

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to search for users by name so that I can quickly locate a specific staff member. |
| **Story Points** | 2 SP |

**Acceptance Criteria:**

```gherkin
Feature: Search Users

  Scenario: Search returns matching results
    Given the users list is loaded on the page
    When the administrator types a name in the search field
    Then only users whose names match the search input are displayed

  Scenario: Search returns no results
    Given the users list is loaded on the page
    When the administrator types a name that does not match any user
    Then the system displays a message indicating no users were found
```

---

## Sprint 3 — Products & Inventory `EP-03`

**Sprint Goal:** Give administrators full control over the product catalog and maintain accurate real-time inventory.

---

### US-07 · Create Product

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to create new products with a name, price, and initial stock so that the product catalog stays up to date. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Create Product

  Scenario: Successful product creation
    Given the administrator is on the new product form
    When all required fields are filled in and the form is submitted
    Then the product is saved in the system
    And it appears in the products list

  Scenario: Missing required fields
    Given the administrator leaves one or more required fields empty
    When the form is submitted
    Then the system highlights the missing fields
    And displays a validation message for each one
```

---

### US-08 · Edit and Delete Product

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to edit and delete existing products so that the catalog remains accurate and current. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Edit Product

  Scenario: Successful product edit
    Given a product exists in the catalog
    When the administrator modifies the product details and saves the changes
    Then the updated information is reflected in the products list

Feature: Delete Product

  Scenario: Successful product deletion
    Given a product exists in the catalog
    When the administrator selects delete and confirms the action
    Then the product is permanently removed from the system
```

---

### US-09 · Restock Inventory

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to restock products by adding units so that stock levels are always accurate. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Restock Inventory

  Scenario: Successful restock
    Given a product exists in the system
    When the administrator enters a restock quantity and confirms
    Then the product's stock level increases by the entered amount

  Scenario: Invalid restock quantity
    Given a product exists in the system
    When the administrator enters a quantity of zero or a negative number
    Then the system displays a validation error and does not update the stock
```

---

### US-10 · Out of Stock Visual Indicator

| Field | Detail |
|---|---|
| **Role** | User |
| **User Story** | As a user, I want to visually identify out-of-stock products so that I can avoid attempting to order unavailable items. |
| **Story Points** | 2 SP |

**Acceptance Criteria:**

```gherkin
Feature: Out of Stock Indicator

  Scenario: Product with zero stock is displayed
    Given a product has a stock level of zero
    When it is shown in the product list
    Then a clear "Out of Stock" badge is displayed on that product

  Scenario: Out-of-stock product cannot be added to an order
    Given a product has a stock level of zero
    When the user views the product in the order interface
    Then the option to add the product to an order is disabled
```

---

# 🟩 SECOND PARTIAL

## Sprint 4 — Tables `EP-04`

**Sprint Goal:** Allow administrators to manage physical cafeteria tables to support accurate order assignment.

---

### US-11 · Tables Management (CRUD)

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to create, edit, and delete cafeteria tables so that orders can be accurately assigned to physical tables. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Create Table

  Scenario: Successful table creation
    Given the administrator is on the tables management page
    When a table number and capacity are entered and the form is submitted
    Then the new table is saved and appears in the tables list

Feature: Edit Table

  Scenario: Successful table edit
    Given a table exists in the system
    When the administrator updates the table details and saves
    Then the changes are reflected in the tables list

Feature: Delete Table

  Scenario: Successful table deletion
    Given a table exists with no active orders linked to it
    When the administrator selects delete and confirms the action
    Then the table is removed from the system

  Scenario: Delete table with active orders
    Given a table has one or more active orders linked to it
    When the administrator attempts to delete the table
    Then the system prevents the deletion
    And displays a message indicating the table has active orders
```

---

## Sprint 5 — Orders `EP-05`

**Sprint Goal:** Enable employees to fully manage the lifecycle of customer orders with automatic inventory control.

---

### US-12 · Create Order

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | As an employee, I want to create a new order linked to a customer and a table so that customer requests are tracked from the start. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Create Order

  Scenario: Successful order creation
    Given the employee selects a customer and a table
    When the new order is submitted
    Then the order is registered in the system with status "pending"
    And it appears in the active orders list
```

---

### US-13 · Add Products to Order

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | As an employee, I want to add products to an order with automatic inventory deduction so that stock levels are always kept accurate. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: Add Products to Order

  Scenario: Add product with available stock
    Given a product has available stock
    When the employee adds the product to the order
    Then the product appears in the order
    And the product's stock is decreased by the selected quantity

  Scenario: Attempt to add out-of-stock product
    Given a product has a stock level of zero
    When the employee attempts to add it to the order
    Then the system blocks the action
    And displays a warning message indicating the product is out of stock
```

---

### US-14 · Change Order Status

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | As an employee, I want to update the order status through valid transitions so that order progress is accurately tracked. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Order Status Change

  Scenario: Valid status transition
    Given an order is in a status that allows a forward transition
    When the employee changes it to the next allowed status
    Then the order status is updated successfully

  Scenario: Invalid status transition
    Given an order has a status of "delivered" or "cancelled"
    When the employee attempts to revert or change the status to a previous one
    Then the system prevents the change
    And displays a message explaining the transition is not allowed
```

---

### US-15 · Cancel Order and Restore Inventory

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | As an employee, I want to cancel an active order and have the consumed stock automatically restored so that inventory remains accurate even when orders are cancelled. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: Cancel Order

  Scenario: Successful order cancellation with stock restoration
    Given an active order contains one or more products
    When the employee cancels the order and confirms the action
    Then the order status changes to "cancelled"
    And the inventory for each product in the order is restored to its previous level
```

---

## Sprint 6 — Reports `EP-06`

**Sprint Goal:** Provide administrators with actionable daily sales insights to support informed decision-making.

---

### US-16 · Daily Sales Report

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to generate a daily sales report so that I can monitor revenue and order volume for any given day. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: Daily Sales Report

  Scenario: Generate report with available data
    Given there are delivered orders for the selected day
    When the administrator generates the report
    Then the system displays the total sales amount, total order count, and a breakdown by product

  Scenario: No orders for the selected day
    Given no orders were delivered on the selected day
    When the administrator generates the report
    Then the system displays the message "No sales data for the selected period"
```

---

# 🟨 THIRD PARTIAL

## Sprint 7 — Enhancements & Polish `EP-07`

**Sprint Goal:** Elevate the system with advanced analytics, role-based access control, export capabilities, and production-grade reliability.

---

### US-17 · Advanced Sales Reports with Charts

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to view interactive charts and filter reports by date range so that I can analyze sales trends more effectively. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: Advanced Sales Reports

  Scenario: Generate report with a date range filter
    Given the administrator is on the reports page
    When a start date and end date are selected and the report is generated
    Then the system displays total sales, number of orders, and top-selling products for that period

  Scenario: Interactive charts are rendered
    Given a report has been successfully generated
    When the results are displayed
    Then bar, pie, and line charts are shown representing the sales data

  Scenario: No data available for the selected range
    Given no orders exist within the selected date range
    When the report is generated
    Then the system displays the message "No sales data for the selected period"
```

---

### US-18 · Order History and Search

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to search and filter past orders so that I can easily locate specific transactions. |
| **Story Points** | 6 SP |

**Acceptance Criteria:**

```gherkin
Feature: Order History

  Scenario: View all past orders
    Given the administrator accesses the order history page
    When the page loads
    Then all past orders are displayed with their date, table, total, and status

  Scenario: Search and filter orders
    Given the order history is loaded
    When the administrator searches by order ID, customer name, or date
    Then only orders matching the search criteria are displayed

  Scenario: View order details
    Given an order exists in the history
    When the administrator clicks on it
    Then a detail view shows all products, quantities, and subtotals for that order
```

---

### US-19 · User Roles and Permissions

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to assign roles (Admin or Employee) to users so that each person only has access to the features they are authorized to use. |
| **Story Points** | 8 SP |

**Acceptance Criteria:**

```gherkin
Feature: User Roles

  Scenario: Assign role during user creation
    Given the administrator is registering a new user
    When a role is selected (Admin or Employee) and the form is submitted
    Then the assigned role is saved and associated with the user account

  Scenario: Role-based access — Employee restrictions
    Given a user with the "Employee" role is logged in
    When the user attempts to access user management or reports sections
    Then access is denied
    And an informational message is displayed explaining the restriction

  Scenario: Role-based access — Admin full access
    Given a user with the "Admin" role is logged in
    When the user navigates to any section of the system
    Then full access is granted without restrictions
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

  Scenario: Export report to CSV
    Given a report has been generated with data
    When the administrator clicks "Export CSV"
    Then a .csv file containing all the report data is downloaded

  Scenario: Export report to PDF
    Given a report has been generated with data
    When the administrator clicks "Export PDF"
    Then a formatted .pdf file containing the report is downloaded
```

---

### US-21 · Performance Optimization

| Field | Detail |
|---|---|
| **Role** | Developer |
| **User Story** | As a developer, I want the system to load quickly and respond efficiently so that the user experience remains smooth even with large volumes of data. |
| **Story Points** | 5 SP |

**Acceptance Criteria:**

```gherkin
Feature: Performance Optimization

  Scenario: Fast page loading
    Given the user navigates between pages
    When any page is loaded under normal conditions
    Then the page is fully loaded within 2 seconds

  Scenario: Optimized data queries
    Given a large volume of records exists in the system
    When the user loads a list of users, products, or orders
    Then pagination is applied and the data loads without delays
```

---

### US-22 · Improved Error Handling

| Field | Detail |
|---|---|
| **Role** | User |
| **User Story** | As a user, I want to receive clear and friendly error messages so that I understand what went wrong and can take the appropriate corrective action. |
| **Story Points** | 4 SP |

**Acceptance Criteria:**

```gherkin
Feature: Error Handling

  Scenario: Network connection error
    Given there is no internet connection
    When the user attempts to perform any action
    Then the system displays the message "Connection error. Please check your internet connection."

  Scenario: Form validation error
    Given incorrect or incomplete data is entered in a form
    When the form is submitted
    Then specific validation messages are displayed next to each invalid field

  Scenario: Unexpected server error
    Given an unexpected error occurs on the server side
    When the user's action fails
    Then the system displays the message "An unexpected error occurred. Please try again later."
```

---

## Project Summary

| Partial | Sprints | User Stories | Story Points |
|---|---|---|---|
| 1st Partial | 1 – 3 | 10 | 35 SP |
| 2nd Partial | 4 – 6 | 6 | 39 SP |
| 3rd Partial | 7 | 6 | 36 SP |
| **Total** | **7** | **22** | **110 SP** |

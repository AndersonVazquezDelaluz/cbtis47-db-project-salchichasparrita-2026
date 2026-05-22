```markdown
# 📋 Product Backlog — Chicaffe

**Project:** Chicaffe - Cafeteria Management System  
**Repository:** cbtis47-db-project-salchichasparrita-2026  
**Stack:** HTML · CSS · JavaScript · Supabase  
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras  
**Document Version:** 1.2  
**Date:** May 14, 2026

---

## 🗺️ Project Epics

| ID     | Epic                       | Priority | Partial       |
|--------|----------------------------|----------|---------------|
| EP-01  | Authentication             | High     | 1st Partial   |
| EP-02  | User Management            | High     | 1st Partial   |
| EP-03  | Products & Inventory       | High     | 1st Partial   |
| EP-04  | Tables                     | Medium   | 2nd Partial   |
| EP-05  | Orders                     | High     | 2nd Partial   |
| EP-06  | Reports                    | Medium   | 2nd Partial   |
| EP-07  | Enhancements & Polish      | Medium   | 3rd Partial   |

---

# 🟦 FIRST PARTIAL

## Sprint 1 — Authentication (EP-01)

### US-01 · User Registration by Administrator
**User Story:** As an administrator, I want to register new users with name, email and password so that staff can access the system.  
**Story Points:** 5

**Acceptance Criteria (Gherkin):**
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

### US-02 · User Login
**User Story:** As a registered user, I want to log in with my email and password to access the dashboard.  
**Story Points:** 3

**Acceptance Criteria (Gherkin):**
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

### US-03 · Logout
**User Story:** As an authenticated user, I want to log out at any time.  
**Story Points:** 2

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Logout
  Scenario: Successful logout
    Given the user has an active session
    When the user clicks "Logout"
    Then the session is terminated
    And the user is redirected to the login page
```

### US-04 · Protected Routes
**User Story:** As an administrator, I want protected pages to be accessible only by authenticated users.  
**Story Points:** 3

**Acceptance Criteria (Gherkin):**
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

## Sprint 2 — User Management (EP-02)

### US-05 · View Users List
**User Story:** As an administrator, I want to see all registered users in a table.  
**Story Points:** 3

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Users List
  Scenario: Display all users
    Given the admin is on the users page
    When the page loads
    Then all registered users are shown in a table
```

### US-06 · Search Users by Name
**User Story:** As an administrator, I want to search users by name.  
**Story Points:** 2

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Search Users
  Scenario: Search with results
    Given the users list is loaded
    When the admin types a name
    Then only matching users are shown
```

---

## Sprint 3 — Products & Inventory (EP-03)

### US-07 · Create Product
**User Story:** As an administrator, I want to create new products with name, price and initial stock.  
**Story Points:** 5

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Create Product
  Scenario: Successful creation
    Given the admin is on the new product form
    When all required fields are filled and submitted
    Then the product is saved and appears in the products list
```

### US-08 · Edit and Delete Product
**User Story:** As an administrator, I want to edit and delete existing products.  
**Story Points:** 5

**Acceptance Criteria (Gherkin):**
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

### US-09 · Restock Inventory
**User Story:** As an administrator, I want to restock products.  
**Story Points:** 5

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Restock Inventory
  Scenario: Successful restock
    Given a product exists
    When a restock quantity is registered
    Then the stock increases
```

### US-10 · Out of Stock Visual Indicator
**User Story:** As a user, I want to visually identify out-of-stock products.  
**Story Points:** 2

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Out of Stock Indicator
  Scenario: Product without stock
    Given a product has zero stock
    When it is displayed
    Then it shows a clear visual indicator "Out of Stock"
```

---

# 🟩 SECOND PARTIAL

## Sprint 4 — Tables (EP-04)

### US-11 · Tables Management (CRUD)
**User Story:** As an administrator, I want to create, edit and delete tables.  
**Story Points:** 5

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Tables Management
  Scenario: Create table
    Given the admin is on the tables section
    When entering number and capacity
    Then the table is created successfully
```

---

## Sprint 5 — Orders (EP-05)

### US-12 · Create Order
**User Story:** As an employee, I want to create a new order linked to a user and table.  
**Story Points:** 5

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Create Order
  Scenario: Successful order creation
    Given a user and table are selected
    When the order is created
    Then the order is registered with status "pending"
```

### US-13 · Add Products to Order
**User Story:** As an employee, I want to add products to an order with automatic inventory deduction.  
**Story Points:** 8

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Add Products to Order
  Scenario: Add product with stock
    Given available stock
    When the product is added to the order
    Then inventory is decreased and the product is added

  Scenario: Product out of stock
    Given the product has zero stock
    When trying to add it
    Then the system blocks the action
```

### US-14 · Change Order Status
**User Story:** As an employee, I want to change the order status.  
**Story Points:** 5

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Order Status Change
  Scenario: Valid transition
    Given an order in valid status
    When changing to the next status
    Then the status is updated

  Scenario: Invalid transition
    Given a delivered order
    When trying to revert the status
    Then the system prevents the change
```

### US-15 · Cancel Order and Restore Inventory
**User Story:** As an employee, I want to cancel an order and restore inventory.  
**Story Points:** 8

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Cancel Order
  Scenario: Cancel with stock restoration
    Given an active order with products
    When the order is cancelled
    Then status changes to "cancelled" and inventory is restored
```

---

## Sprint 6 — Reports (EP-06)

### US-16 · Daily Sales Report
**User Story:** As an administrator, I want to generate a daily sales report.  
**Story Points:** 8

**Acceptance Criteria (Gherkin):**
```gherkin
Feature: Daily Sales Report
  Scenario: Generate report
    Given there are delivered orders
    When the report is generated
    Then total sales and details are displayed
```

---

# 🟨 THIRD PARTIAL

## Sprint 7 — Enhancements & Polish (EP-07)

### US-17 · Advanced Sales Reports with Charts
**User Story:** As an administrator, I want interactive charts and date range filters.  
**Story Points:** 8

### US-18 · Order History and Search
**User Story:** As an administrator, I want to search and filter past orders.  
**Story Points:** 6

### US-19 · User Roles and Permissions
**User Story:** As an administrator, I want to assign roles (admin / employee).  
**Story Points:** 8

### US-20 · Export Reports (PDF / CSV)
**User Story:** As an administrator, I want to export reports.  
**Story Points:** 5

### US-21 · Performance Optimization
**User Story:** As a developer, I want the system to load fast.  
**Story Points:** 5

### US-22 · Improved Error Handling
**User Story:** As a user, I want clear and friendly error messages.  
**Story Points:** 4

---

### 📊 Project Summary

| Partial       | Sprints | User Stories | Story Points |
|---------------|---------|--------------|--------------|
| 1st Partial   | 1-3     | 10           | 35 SP        |
| 2nd Partial   | 4-6     | 6            | 39 SP        |
| 3rd Partial   | 7       | 6            | 36 SP        |
| **Total**     | **7**   | **22**       | **110 SP**   |

---

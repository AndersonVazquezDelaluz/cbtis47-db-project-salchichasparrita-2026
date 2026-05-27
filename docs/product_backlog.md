# Product Backlog — Chicaffe

**Project:** Chicaffe — Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 2.0 | **Date:** May 27, 2026

---

## Product Goal

> Develop a comprehensive cafeteria management system that enables efficient administration of users, inventory, tables, orders, and reports — optimizing daily operations, reducing manual errors, improving stock control, and increasing service speed for Chicaffe customers.

---

## Epics

| ID | Epic | Priority | User Stories | Story Points |
|---|---|---|---|---|
| EP-01 | Authentication | High | US-01, US-02, US-03, US-04 | 13 SP |
| EP-02 | User Management | High | US-05, US-06 | 5 SP |
| EP-03 | Products & Inventory | High | US-07, US-08, US-09, US-10 | 17 SP |
| EP-04 | Tables | Medium | US-11 | 5 SP |
| EP-05 | Orders | High | US-12, US-13, US-14, US-15 | 26 SP |
| EP-06 | Reports | Medium | US-16 | 8 SP |
| EP-07 | Enhancements & Polish | Medium | US-17, US-18, US-19, US-20, US-21, US-22 | 36 SP |
| | | | **Total** | **110 SP** |

---

# EPICS

## Epic 1 — Authentication `EP-01`

---

### US-01 · User Registration by Administrator

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to register new users with name, email, and password **so that** staff members can access the system. |

**Acceptance Criteria:**

```gherkin
Feature: User Registration

  Scenario: Successful registration
    Given the administrator is on the user registration form
    When all required fields are completed with valid data and the form is submitted
    Then the system creates the user account in the database
    And the system displays the message "User registered successfully"
    And the new user appears in the registered users list

  Scenario: Registration with a duplicate email address
    Given an active user account with the same email address already exists in the system
    When the administrator attempts to register a new user with that email address
    Then the system rejects the submission
    And the system displays the message "This email address is already registered"
    And no new account is created in the database

  Scenario: Registration form submitted with empty required fields
    Given the administrator is on the user registration form
    When the form is submitted with one or more required fields left empty
    Then the system halts the submission
    And the system highlights each empty field with a visual indicator
    And the system displays a specific validation message for each missing field

  Scenario: Display loading screen during registration
    Given the administrator has completed the registration form with valid data
    When the form is submitted and the system is processing the request
    Then the system must display a loading indicator
    And the system must show the message "Creating account, please wait..."
    And the system must disable the submit button to prevent duplicate submission attempts

  Scenario: Registration attempt with a slow or degraded connection
    Given the administrator has submitted a valid registration form
    When the server response is delayed due to network congestion or high latency
    Then the system must maintain the loading indicator for the duration of the request
    And the system must display the message "This is taking longer than expected. Please wait..."
    And the system must not discard the submitted form data during the delay

  Scenario: Registration attempt without internet connection
    Given the administrator has completed the registration form
    When the user attempts to submit the form without an active internet connection
    Then the system must display the message "No internet connection. Please check your network settings."
    And the system must preserve all data entered in the form fields
    And the system must provide an option to retry the submission once connectivity is restored
```

---

### US-02 · User Login

| Field | Detail |
|---|---|
| **Role** | Registered user |
| **User Story** | **As a** registered user, **I want** to log in with my email and password **so that** I can access the system dashboard. |

**Acceptance Criteria:**

```gherkin
Feature: User Login

  Scenario: Successful login with valid credentials
    Given a registered user is on the login page
    When a valid email address and the correct password are entered and submitted
    Then the system authenticates the user against the database
    And the system creates an active session for the authenticated user
    And the system redirects the user to the main dashboard

  Scenario: Login attempt with invalid credentials
    Given a user is on the login page
    When an unrecognized email address or an incorrect password is entered
    Then the system rejects the authentication attempt
    And the system displays the message "Invalid email or password"
    And the user remains on the login page with the password field cleared
    And no session is created

  Scenario: Login attempt with empty fields
    Given a user is on the login page
    When the login form is submitted with one or more fields left empty
    Then the system halts the submission
    And the system highlights the empty fields with a visual indicator
    And the system displays the message "All fields are required"

  Scenario: Display loading screen during login authentication
    Given the user has entered valid credentials on the login page
    When the form is submitted and the system is processing the authentication request
    Then the system must display a loading indicator on the login button or screen
    And the system must show the message "Signing in..."
    And the system must disable the submit button to prevent multiple submission attempts

  Scenario: Login attempt with a slow or degraded connection
    Given the user has submitted valid login credentials
    When the authentication request is delayed due to network congestion or high server latency
    Then the system must maintain the loading indicator for the duration of the request
    And the system must display the message "This is taking longer than expected. Please wait..."
    And the system must not discard the entered credentials during the delay

  Scenario: Login attempt without internet connection
    Given the user is on the login page with credentials entered
    When the user attempts to submit the form without an active internet connection
    Then the system must display the message "No internet connection. Please check your network settings."
    And the system must preserve the email address entered in the form
    And the system must provide an option to retry the request once connectivity is restored
```

---

### US-03 · Logout

| Field | Detail |
|---|---|
| **Role** | Authenticated user |
| **User Story** | **As an** authenticated user, **I want** to log out at any time **so that** my session is safely terminated. |

**Acceptance Criteria:**

```gherkin
Feature: Logout

  Scenario: Successful logout
    Given the user has an active authenticated session
    When the user clicks the "Logout" button
    Then the system terminates the active session
    And the system clears all session tokens and authentication data from the client
    And the system redirects the user to the login page
    And the system displays the message "You have been logged out successfully"

  Scenario: Display loading screen during logout
    Given the user has clicked the "Logout" button
    When the system is processing the session termination request
    Then the system must display a loading indicator
    And the system must show the message "Signing out..."
    And the system must prevent the user from navigating or triggering other actions during the process

  Scenario: Logout attempt with a slow or degraded connection
    Given the user has initiated a logout request
    When the server response is delayed due to network congestion or high latency
    Then the system must maintain the loading indicator for the duration of the request
    And the system must display the message "This is taking longer than expected. Please wait..."
    And the system must not allow the session to remain active in the event of an incomplete request

  Scenario: Logout attempt without internet connection
    Given the user attempts to log out without an active internet connection
    When the logout request cannot be sent to the server
    Then the system must clear the local session data and tokens from the client
    And the system must display the message "No internet connection. You have been logged out locally."
    And the system must redirect the user to the login page
```

---

### US-04 · Protected Routes

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** protected pages to be accessible only by authenticated users **so that** unauthorized access is prevented. |

**Acceptance Criteria:**

```gherkin
Feature: Protected Routes

  Scenario: Access attempt to a protected route without an active session
    Given the user does not have an active authenticated session
    When the user attempts to navigate directly to a protected page
    Then the system must block access to the requested page
    And the system must redirect the user to the login page
    And the system must display the message "Access denied. Please log in to continue."

  Scenario: Access to a protected route with a valid active session
    Given the user has a valid and active authenticated session
    When the user navigates to any protected page
    Then the system must grant access and render the requested page normally
    And the system must not interrupt the navigation flow

  Scenario: Session expiration during active use
    Given the user has an authenticated session that has expired due to inactivity
    When the user attempts to access or interact with a protected page
    Then the system must invalidate the expired session
    And the system must redirect the user to the login page
    And the system must display the message "Your session has expired. Please log in again."
```

---

## Epic 2 — User Management `EP-02`

---

### US-05 · View Users List

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to see all registered users displayed in a table **so that** I have full visibility of the system's staff. |

**Acceptance Criteria:**

```gherkin
Feature: Users List

  Scenario: Successful display of all registered users
    Given the administrator is on the user management page
    When the page finishes loading
    Then the system must display all registered users in a structured table
    And the table must include the following columns: full name, email address, role, and account status

  Scenario: No registered users exist in the system
    Given the system has no registered user accounts
    When the administrator navigates to the user management page
    Then the system must display the message "No users have been registered yet"
    And the table must remain visible but empty

  Scenario: Page loading indicator while retrieving user data
    Given the administrator has navigated to the user management page
    When the system is fetching user records from the database
    Then the system must display a loading indicator
    And the system must show the message "Loading users..."
    And the table must not render incomplete or partial data during retrieval
```

---

### US-06 · Search Users by Name

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to search for users by name **so that** I can quickly locate a specific staff member. |

**Acceptance Criteria:**

```gherkin
Feature: Search Users

  Scenario: Search returns one or more matching results
    Given the users list is fully loaded on the user management page
    When the administrator types a full or partial name in the search input field
    Then the system must filter the table in real time
    And only user records whose names match the search input must be displayed

  Scenario: Search returns no matching results
    Given the users list is fully loaded on the user management page
    When the administrator enters a name that does not correspond to any registered user
    Then the system must display the message "No users found matching your search"
    And the table must display no records
```

---

## Epic 3 — Products & Inventory `EP-03`

---

### US-07 · Create Product

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to create new products with a name, price, and initial stock quantity **so that** the product catalog stays up to date. |

**Acceptance Criteria:**

```gherkin
Feature: Create Product

  Scenario: Successful product creation
    Given the administrator is on the product registration form
    When all required fields are completed with valid data and the form is submitted
    Then the system must save the new product record in the database
    And the system must display the message "Product created successfully"
    And the new product must appear in the product catalog list

  Scenario: Product creation with missing required fields
    Given the administrator is on the product registration form
    When the form is submitted with one or more required fields left empty
    Then the system must halt the submission
    And the system must highlight each empty field with a visual indicator
    And the system must display a specific validation message for each missing field
```

---

### US-08 · Edit and Delete Product

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to edit and delete existing products **so that** the product catalog remains accurate and current. |

**Acceptance Criteria:**

```gherkin
Feature: Edit Product

  Scenario: Successful product edit
    Given a product record exists in the system catalog
    When the administrator modifies one or more product fields and saves the changes
    Then the system must update the product record in the database
    And the system must display the message "Product updated successfully"
    And the updated information must be immediately reflected in the catalog list

Feature: Delete Product

  Scenario: Successful product deletion with confirmation
    Given a product record exists in the system catalog
    When the administrator initiates deletion and confirms the action in the confirmation dialog
    Then the system must permanently remove the product record from the database
    And the system must display the message "Product deleted successfully"
    And the product must no longer appear in the catalog list

  Scenario: Product deletion cancelled by the administrator
    Given a product record exists in the system catalog
    When the administrator initiates deletion but cancels the action in the confirmation dialog
    Then the system must not delete the product record
    And the product must remain unchanged in the catalog list
```

---

### US-09 · Restock Inventory

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to restock products by adding units **so that** inventory levels are always accurate. |

**Acceptance Criteria:**

```gherkin
Feature: Restock Inventory

  Scenario: Successful inventory restock
    Given a product record exists in the system
    When the administrator enters a valid positive restock quantity and confirms the operation
    Then the system must increment the product's stock level by the entered amount
    And the system must display the message "Stock updated successfully"
    And the updated stock value must be reflected in the product catalog list

  Scenario: Invalid restock quantity entered
    Given a product record exists in the system
    When the administrator enters a quantity of zero or a negative number
    Then the system must reject the submission
    And the system must display the message "Restock quantity must be greater than zero"
    And the product's stock level must remain unchanged
```

---

### US-10 · Out of Stock Visual Indicator

| Field | Detail |
|---|---|
| **Role** | User |
| **User Story** | **As a** user, **I want** to visually identify out-of-stock products **so that** I can avoid attempting to order unavailable items. |

**Acceptance Criteria:**

```gherkin
Feature: Out of Stock Indicator

  Scenario: Product with zero stock is displayed in the catalog
    Given a product has a current stock level of zero
    When the product is displayed in the catalog or product list
    Then the system must render a clearly visible "Out of Stock" badge on that product entry
    And the badge must be visually distinct from available product indicators

  Scenario: Out-of-stock product cannot be added to an active order
    Given a product has a current stock level of zero
    When the user views the product in the order creation interface
    Then the system must disable the option to add that product to the order
    And the system must display the message "This product is currently out of stock"
```

---

# EPICS

## Epic 4 — Tables `EP-04`

---

### US-11 · Tables Management (CRUD)

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to create, edit, and delete cafeteria tables **so that** orders can be accurately assigned to the corresponding physical tables. |

**Acceptance Criteria:**

```gherkin
Feature: Create Table

  Scenario: Successful table creation
    Given the administrator is on the tables management page
    When a valid table number and seating capacity are entered and the form is submitted
    Then the system must save the new table record in the database
    And the system must display the message "Table created successfully"
    And the new table must appear in the tables list

Feature: Edit Table

  Scenario: Successful table edit
    Given a table record exists in the system
    When the administrator updates the table details and saves the changes
    Then the system must update the record in the database
    And the system must display the message "Table updated successfully"
    And the updated details must be reflected in the tables list

Feature: Delete Table

  Scenario: Successful deletion of a table with no active orders
    Given a table record exists in the system with no active orders currently linked to it
    When the administrator initiates deletion and confirms the action
    Then the system must permanently remove the table record from the database
    And the system must display the message "Table deleted successfully"

  Scenario: Deletion attempt on a table with active linked orders
    Given a table record exists with one or more active orders currently assigned to it
    When the administrator attempts to delete that table
    Then the system must prevent the deletion
    And the system must display the message "This table cannot be deleted because it has active orders assigned to it"
```

---

## Epic 5 — Orders `EP-05`

---

### US-12 · Create Order

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | **As an** employee, **I want** to create a new order linked to a customer and a table **so that** customer requests are tracked from the start of service. |

**Acceptance Criteria:**

```gherkin
Feature: Create Order

  Scenario: Successful order creation
    Given the employee is on the order creation form
    When a valid customer and an available table are selected and the form is submitted
    Then the system must register the new order in the database with the status "pending"
    And the system must display the message "Order created successfully"
    And the new order must appear in the active orders list

  Scenario: Order creation with missing required fields
    Given the employee is on the order creation form
    When the form is submitted without selecting a customer or a table
    Then the system must halt the submission
    And the system must display the message "Please select a customer and a table before creating the order"
```

---

### US-13 · Add Products to Order

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | **As an** employee, **I want** to add products to an active order with automatic inventory deduction **so that** stock levels are kept accurate at all times. |

**Acceptance Criteria:**

```gherkin
Feature: Add Products to Order

  Scenario: Successful addition of a product with available stock
    Given an active order exists and the selected product has sufficient available stock
    When the employee adds the product to the order with a specified quantity
    Then the system must register the product and quantity in the order record
    And the system must automatically deduct the specified quantity from the product's stock level
    And the product must appear in the order's item list with its corresponding subtotal

  Scenario: Attempt to add an out-of-stock product to an order
    Given a product has a current stock level of zero
    When the employee attempts to add that product to an active order
    Then the system must block the operation
    And the system must display the message "This product is currently out of stock and cannot be added to the order"
    And the order's item list and inventory levels must remain unchanged
```

---

### US-14 · Change Order Status

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | **As an** employee, **I want** to update the order status through valid transitions **so that** the progress of each order is accurately tracked. |

**Acceptance Criteria:**

```gherkin
Feature: Order Status Change

  Scenario: Valid forward status transition
    Given an active order is in a status that permits a forward transition
    When the employee changes the order to the next allowed status in the workflow
    Then the system must update the order's status record in the database
    And the system must display the message "Order status updated successfully"
    And the updated status must be reflected in the orders list

  Scenario: Invalid or backward status transition attempt
    Given an order has reached a terminal status such as "delivered" or "cancelled"
    When the employee attempts to change the order to a previous or disallowed status
    Then the system must reject the operation
    And the system must display the message "This status transition is not permitted"
    And the order's current status must remain unchanged
```

---

### US-15 · Cancel Order and Restore Inventory

| Field | Detail |
|---|---|
| **Role** | Employee |
| **User Story** | **As an** employee, **I want** to cancel an active order and have the consumed stock automatically restored **so that** inventory remains accurate even when orders are cancelled. |

**Acceptance Criteria:**

```gherkin
Feature: Cancel Order

  Scenario: Successful order cancellation with automatic stock restoration
    Given an active order contains one or more products with associated quantities
    When the employee initiates the cancellation and confirms the action
    Then the system must update the order's status to "cancelled" in the database
    And the system must automatically restore the inventory level of each product included in the order
    And the system must display the message "Order cancelled and inventory has been restored"

  Scenario: Cancellation attempt on a delivered order
    Given an order has a terminal status of "delivered"
    When the employee attempts to cancel that order
    Then the system must reject the operation
    And the system must display the message "Delivered orders cannot be cancelled"
    And both the order status and inventory levels must remain unchanged
```

---

## Epic 6 — Reports `EP-06`

---

### US-16 · Daily Sales Report

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to generate a daily sales report **so that** I can monitor revenue and order volume for any selected day. |

**Acceptance Criteria:**

```gherkin
Feature: Daily Sales Report

  Scenario: Successful report generation with available sales data
    Given delivered orders exist in the system for the selected date
    When the administrator selects a date and generates the report
    Then the system must display the total sales amount for that day
    And the system must display the total number of completed orders
    And the system must display a breakdown of products sold with quantities and subtotals per item

  Scenario: Report generation for a date with no recorded sales
    Given no orders with a "delivered" status exist for the selected date
    When the administrator generates the report for that date
    Then the system must display the message "No sales data available for the selected period"
    And all summary fields must reflect a value of zero
```

---

# EPICS

## Epic 7 — Enhancements & Polish `EP-07`

---

### US-17 · Advanced Sales Reports with Charts

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to view interactive charts and apply date range filters to reports **so that** I can analyze sales trends more effectively. |

**Acceptance Criteria:**

```gherkin
Feature: Advanced Sales Reports

  Scenario: Successful report generation using a date range filter
    Given the administrator is on the reports page
    When a valid start date and end date are selected and the report is generated
    Then the system must display the total sales amount, the number of orders, and the top-selling products for the specified period

  Scenario: Interactive charts rendered upon report generation
    Given a report has been successfully generated for a specified date range
    When the report results are displayed
    Then the system must render a bar chart representing sales aggregated by day
    And the system must render a pie chart representing the distribution of top-selling products
    And the system must render a line chart representing the cumulative sales trend over the period

  Scenario: Report generation for a date range with no recorded data
    Given no orders exist within the selected date range
    When the report is generated
    Then the system must display the message "No sales data available for the selected period"
    And no charts must be rendered
```

---

### US-18 · Order History and Search

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to search and filter past orders **so that** I can easily locate specific transactions in the system's history. |

**Acceptance Criteria:**

```gherkin
Feature: Order History

  Scenario: Successful display of all past orders
    Given the administrator accesses the order history page
    When the page finishes loading
    Then the system must display all past orders in a structured table
    And each record must include the order date, assigned table, total amount, and current status

  Scenario: Search and filter order history records
    Given the order history table is fully loaded
    When the administrator enters a value in the search field using an order ID, customer name, or date
    Then the system must filter the table in real time
    And only records matching the search criteria must be displayed

  Scenario: View detailed information for a specific order
    Given a specific order record exists in the order history
    When the administrator selects that order
    Then the system must display a detailed view containing all products, their quantities, unit prices, and the order subtotal
```

---

### US-19 · User Roles and Permissions

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to assign roles to users (Administrator or Employee) **so that** each person only has access to the system features they are authorized to use. |

**Acceptance Criteria:**

```gherkin
Feature: User Roles and Permissions

  Scenario: Role assignment during user account creation
    Given the administrator is completing the user registration form
    When a role is selected from the available options (Administrator or Employee) and the form is submitted
    Then the system must save the assigned role in association with the user account in the database
    And the role must be visible in the user's profile within the users list

  Scenario: Role-based access restriction for the Employee role
    Given a user with an assigned role of "Employee" is authenticated and logged in
    When the user attempts to navigate to the user management or reports sections
    Then the system must deny access to those sections
    And the system must display the message "You do not have permission to access this section"

  Scenario: Unrestricted access for the Administrator role
    Given a user with an assigned role of "Administrator" is authenticated and logged in
    When the user navigates to any section of the system
    Then the system must grant full access without restrictions
    And all administrative features and data must be accessible
```

---

### US-20 · Export Reports (PDF / CSV)

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | **As an** administrator, **I want** to export generated reports in PDF and CSV formats **so that** I can share and archive sales data externally. |

**Acceptance Criteria:**

```gherkin
Feature: Export Reports

  Scenario: Successful export of a report to CSV format
    Given a report has been successfully generated and contains data
    When the administrator clicks the "Export CSV" button
    Then the system must generate and download a .csv file containing all report records
    And the file must include column headers corresponding to the report fields

  Scenario: Successful export of a report to PDF format
    Given a report has been successfully generated and contains data
    When the administrator clicks the "Export PDF" button
    Then the system must generate and download a formatted .pdf file containing the complete report
    And the file must include the report title, generation date, and all data rows

  Scenario: Export attempt when no report data is available
    Given the reports page has been loaded but no report has been generated
    When the administrator attempts to click an export button
    Then the system must disable both export buttons
    And the system must display the message "Generate a report before exporting"
```

---

### US-21 · Performance Optimization

| Field | Detail |
|---|---|
| **Role** | Developer |
| **User Story** | **As a** developer, **I want** the system to load quickly and respond efficiently **so that** the user experience remains smooth even with large volumes of data. |

**Acceptance Criteria:**

```gherkin
Feature: Performance Optimization

  Scenario: Page load time under normal operating conditions
    Given the system is operating under normal load conditions
    When a user navigates to any page within the system
    Then the page must be fully rendered and interactive within 2 seconds

  Scenario: Paginated data retrieval for large record sets
    Given the system contains more than 500 records in any given data table
    When a user loads a list of users, products, or orders
    Then the system must apply server-side pagination to the query
    And the system must load only the records for the current page without performance degradation
    And navigation controls must be available to access additional pages
```

---

### US-22 · Improved Error Handling

| Field | Detail |
|---|---|
| **Role** | User |
| **User Story** | **As a** user, **I want** to receive clear and friendly error messages **so that** I understand what went wrong and can take the appropriate corrective action. |

**Acceptance Criteria:**

```gherkin
Feature: Error Handling

  Scenario: Network connection error during any system operation
    Given the user is performing any action within the system
    When the request fails due to the absence of an internet connection
    Then the system must display the message "Connection error. Please check your internet connection."
    And the system must not lose any data the user was working with
    And the system must provide an option to retry the failed operation

  Scenario: Form validation error on submission
    Given a user is completing any form within the system
    When the form is submitted with incorrect, incomplete, or invalid data
    Then the system must halt the submission
    And the system must display specific and descriptive validation messages adjacent to each invalid field
    And the form must remain populated with the data the user had entered

  Scenario: Unexpected server-side error
    Given a user has triggered an operation that causes an unhandled server-side exception
    When the system receives an error response from the server
    Then the system must display the message "An unexpected error occurred. Please try again later."
    And the system must log the error details internally for diagnostic purposes
    And the user interface must remain stable and functional
```

---

## Project Summary

| Partial | Epics | User Stories | Story Points |
|---|---|---|---|
| 1st Partial | EP-01, EP-02, EP-03 | US-01 – US-10 | 35 SP |
| 2nd Partial | EP-04, EP-05, EP-06 | US-11 – US-16 | 39 SP |
| 3rd Partial | EP-07 | US-17 – US-22 | 36 SP |
| **Total** | **7** | **22** | **110 SP** |

# Sprint Backlog — Chicaffe · First Partial

**Project:** Chicaffe - Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Stack:** Node.js · Express · MySQL · HTML/CSS/JavaScript
**Team:** Anderson Vázquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 2.1 | **Date:** May 29, 2026

---

## Partial Overview

| Sprint | Name | Epic | User Stories | Story Points |
|--------|------|------|--------------|--------------|
| Sprint 1 | Authentication | EP-01 | US-01, US-02, US-03, US-04 | 14 SP |
| Sprint 2 | User Management | EP-02 | US-05, US-06 | 8 SP |
| Sprint 3 | Products & Inventory | EP-03 | US-07, US-08, US-09, US-10 | 18 SP |
| **Total** | | | | **40 SP** |

**Partial Duration:** 4 weeks · **Real Available Hours:** 32 h · **Estimated Hours (with buffer):** ~50 h

---

## SPRINT 1 — Authentication (EP-01)

**Sprint Goal:** Implement a secure authentication system with user registration, login, logout, and route protection using JWT and bcrypt.

---

### User Stories

| US | User Story | Priority | SP |
|----|------------|----------|----|
| US-01 | As an Administrator, I want to register new users (name, email, password, role) | High | 5 |
| US-02 | As a Registered User, I want to log in with email and password | High | 4 |
| US-03 | As an Authenticated User, I want to log out | High | 2 |
| US-04 | As an Authenticated User, I want protected routes | High | 3 |

---

### Acceptance Criteria

#### US-01 · User Registration

```gherkin
  Scenario: Successful user registration
    Given the administrator is on the user registration form
    When all required fields (name, email, password, role) are completed and the form is submitted
    Then the system must save the user to the database with a hashed password
    And the system must confirm the registration was successful

  Scenario: Registration with a duplicate email
    Given the administrator is completing the registration form
    When an email address that already exists in the system is entered and the form is submitted
    Then the system must reject the submission
    And the system must display a message indicating the email is already registered

  Scenario: Registration with missing or invalid fields
    Given the administrator is completing the registration form
    When the form is submitted with one or more empty or invalid fields
    Then the system must halt the submission
    And the system must display specific validation messages next to each invalid field
```

---

#### US-02 · User Login

```gherkin
  Scenario: Successful login
    Given a registered user is on the login page
    When valid credentials (email and password) are entered and the form is submitted
    Then the system must generate a JWT token
    And the user must be redirected to the dashboard

  Scenario: Login with invalid credentials
    Given a user is on the login page
    When an incorrect email or password is entered and the form is submitted
    Then the system must display a clear error message
    And no token must be issued

  Scenario: Correct redirection after login
    Given a registered user has successfully authenticated
    When the login process completes
    Then the user must be redirected to the corresponding dashboard based on their role
```

---

#### US-03 · User Logout

```gherkin
  Scenario: Successful logout
    Given an authenticated user is on any page of the system
    When the user clicks the logout button
    Then the system must invalidate the JWT token on the client side
    And the user must be redirected to the login page
```

---

#### US-04 · Protected Routes

```gherkin
  Scenario: Access to protected route with valid token
    Given an authenticated user has a valid JWT token
    When the user navigates to any protected route
    Then the system must grant access and load the requested page normally

  Scenario: Access attempt without token
    Given a user is not authenticated
    When the user attempts to access a protected route directly
    Then the authentication middleware must block the request
    And the user must be redirected to the login page

  Scenario: Access attempt with expired token
    Given a user's JWT token has expired
    When the user attempts to navigate to a protected route
    Then the system must deny access
    And the session must be cleared and the user redirected to the login page
```

---

### Tasks

| # | Task | Hours | US | Status |
|---|------|-------|----|--------|
| T-01 | Create `users` table in MySQL | 2 | US-01 | ✅ Done |
| T-02 | Implement POST `/api/auth/register` endpoint with bcrypt password hashing | 3 | US-01 | ✅ Done |
| T-03 | Create registration form (HTML + Fetch) with field validations | 2 | US-01 | ✅ Done |
| T-04 | Implement POST `/api/auth/login` endpoint with JWT generation | 3 | US-02 | ✅ Done |
| T-05 | Create login form with error handling and validation messages | 2 | US-02 | ✅ Done |
| T-06 | Implement logout functionality (clear token from client) | 1.5 | US-03 | ✅ Done |
| T-07 | Create authentication middleware (`authMiddleware.js`) | 2 | US-04 | ✅ Done |
| T-08 | Protect dashboard and admin routes with middleware | 2 | US-04 | ✅ Done |
| T-09 | Functional testing and bug fixing | 3 | All | ✅ Done |

**Total estimated hours: 20.5 h**

---

### Week-by-Week Plan

| Week | Focus | Tasks |
|------|-------|-------|
| Week 1 | Database setup + Registration + Basic Login | T-01 to T-04 |
| Week 2 | Logout + Route Protection + Testing | T-05 to T-09 |

---

## SPRINT 2 — User Management (EP-02)

**Sprint Goal:** Allow the administrator to view, edit, and delete system users, improving administrative control over system access.

---

### User Stories

| US | User Story | Priority | SP |
|----|------------|----------|----|
| US-05 | As an Administrator, I want to view the list of users | High | 4 |
| US-06 | As an Administrator, I want to edit or delete users | High | 4 |

---

### Acceptance Criteria

#### US-05 · User List

```gherkin
  Scenario: Display complete list of users
    Given the administrator accesses the user management page
    When the page finishes loading
    Then the system must display a complete list of all registered users
    And the list must support filters to narrow down results
```

---

#### US-06 · Edit and Delete Users

```gherkin
  Scenario: Secure update of user information
    Given the administrator is on the user management page
    When the administrator selects a user and submits updated information
    Then the system must save the changes securely to the database
    And the updated data must be reflected immediately in the users list

  Scenario: User deletion with confirmation
    Given the administrator selects a user to delete
    When the administrator confirms the deletion action
    Then the system must permanently remove the user from the database
    And the user must no longer appear in the users list
```

---

### Tasks

| # | Task | Hours | US | Status |
|---|------|-------|----|--------|
| T-10 | Implement GET `/api/users` endpoint to list all users | 2 | US-05 | ✅ Done |
| T-11 | Create user management page with users table | 2 | US-05 | ✅ Done |
| T-12 | Implement PUT `/api/users/:id` endpoint to update user data | 2 | US-06 | ✅ Done |
| T-13 | Implement DELETE `/api/users/:id` endpoint with self-deletion guard | 2 | US-06 | ✅ Done |
| T-14 | Create edit and delete user interface with confirmation modal | 2 | US-06 | ✅ Done |
| T-15 | Restrict user management section to administrators only | 1 | All | ✅ Done |

**Total estimated hours: 11 h**

---

### Week-by-Week Plan

| Week | Focus | Tasks |
|------|-------|-------|
| Week 3 | Backend endpoints for user management | T-10 to T-13 |
| Week 4 | Frontend integration + Access control + Testing | T-14, T-15 |

---

## SPRINT 3 — Products & Inventory (EP-03)

**Sprint Goal:** Implement complete product and inventory management to control the cafeteria's offerings and stock levels.

---

### User Stories

| US | User Story | Priority | SP |
|----|------------|----------|----|
| US-07 | As an Administrator, I want to create products | High | 5 |
| US-08 | As an Administrator, I want to edit or delete products | High | 5 |
| US-09 | As an Administrator, I want to restock inventory | High | 5 |
| US-10 | As a User, I want to see when a product is out of stock | Medium | 3 |

---

### Acceptance Criteria

#### US-07 · Product Creation

```gherkin
  Scenario: Successful product creation
    Given the administrator is on the product creation form
    When all required fields (name, price, stock, category) are completed and the form is submitted
    Then the system must save the product to the database
    And the product must appear in the products list
```

---

#### US-08 · Edit and Delete Products

```gherkin
  Scenario: Real-time product update
    Given the administrator selects a product to edit
    When updated data is submitted
    Then the system must save the changes to the database
    And the products list must reflect the updated information immediately

  Scenario: Product deletion
    Given the administrator confirms deletion of a product
    When the deletion action is executed
    Then the product must be permanently removed from the database
    And the product must no longer appear in the products list
```

---

#### US-09 · Inventory Restock

```gherkin
  Scenario: Successful inventory restock
    Given the administrator is on the product management page
    When a valid quantity is entered for a product and the restock action is confirmed
    Then the system must update the stock quantity in the database
    And the new stock value must be reflected in the products list
```

---

#### US-10 · Out-of-Stock Indicator

```gherkin
  Scenario: Visual out-of-stock indicator displayed
    Given a product's stock quantity has reached zero
    When any user views the products list
    Then the system must display a clear visual indicator marking the product as out of stock
```

---

### Tasks

| # | Task | Hours | US | Status |
|---|------|-------|----|--------|
| T-16 | Create `products` table in MySQL with name, price, stock, and category fields | 1.5 | US-07 | ✅ Done |
| T-17 | Implement POST `/api/products` endpoint to create a product | 2 | US-07 | ✅ Done |
| T-18 | Create product creation form with field validations | 2 | US-07 | ✅ Done |
| T-19 | Create products list page in the admin interface | 2 | US-07, US-08 | ✅ Done |
| T-20 | Implement PUT `/api/products/:id` endpoint to update a product | 2 | US-08 | ✅ Done |
| T-21 | Implement DELETE `/api/products/:id` endpoint with active-order guard | 2 | US-08 | ✅ Done |
| T-22 | Create edit and delete product interface with confirmation modal | 2 | US-08 | ✅ Done |
| T-23 | Implement PUT `/api/products/:id/restock` endpoint for inventory update | 2 | US-09 | ✅ Done |
| T-24 | Create restock interface with quantity input and validation | 2 | US-09 | ✅ Done |
| T-25 | Add out-of-stock and low-stock visual indicators to the products list | 1.5 | US-10 | ✅ Done |

**Total estimated hours: 19 h**

---

### Week-by-Week Plan

| Week | Focus | Tasks |
|------|-------|-------|
| Week 1 | Database + Product creation endpoints | T-16 to T-18 |
| Week 2 | Product editing, deletion + Inventory management | T-19 to T-25 |

---

## Definition of Done

- Clean and well-commented code
- Endpoints properly documented
- Manual tests completed
- Fully functional in local environment (XAMPP)
- No critical security issues
- Correct integration between authentication, users, and products modules
- Proper error handling and validations
- Approved by the team and professor

---

**Current Status:** Completed

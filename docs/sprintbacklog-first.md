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

## User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-01 | As an Administrator, I want to register new users (name, email, password, role) | High | 5 | Successful registration | Admin is on the registration form | All required fields are completed and the form is submitted | User is saved to the database with a hashed password; success confirmation is displayed |
| | | | | Duplicate email | Admin attempts to register a user with an existing email | The form is submitted | System displays the message "This email is already registered"; no duplicate record is created |
| | | | | Missing or invalid fields | Admin submits the form with one or more empty or invalid fields | The form is submitted | Submission halts; specific validation messages appear next to each invalid field; form stays populated |
| US-02 | As a Registered User, I want to log in with email and password | High | 4 | Successful login | A registered user is on the login page | Valid credentials are entered and the form is submitted | System generates a JWT token; user is redirected to the dashboard |
| | | | | Invalid credentials | A user enters an incorrect email or password | The form is submitted | System displays the message "Invalid email or password"; the form remains populated; no token is issued |
| | | | | Empty fields | A user attempts to submit the login form without filling in all fields | The form is submitted | Submission halts; validation messages appear next to each empty field |
| US-03 | As an Authenticated User, I want to log out | High | 2 | Successful logout | An authenticated user is on any page | User clicks the logout button | JWT token is removed from the client; user is redirected to the login page |
| | | | | Session cleared | A user has just logged out | User attempts to access a protected route directly via URL | Access is denied; user is redirected to the login page |
| US-04 | As an Authenticated User, I want protected routes | High | 3 | Access with valid token | An authenticated user has a valid JWT | User navigates to any protected route | Access is granted; the requested page loads normally |
| | | | | Access without token | An unauthenticated user attempts to access a protected route | Request is made without a valid JWT | Access is denied; user is redirected to the login page with an appropriate message |
| | | | | Expired token | A user's JWT has expired | User attempts to navigate to a protected route | Access is denied; session is cleared; user is redirected to the login page |

---

## Tasks

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

## Week-by-Week Plan

| Week | Focus | Tasks |
|------|-------|-------|
| Week 1 | Database setup + Registration + Basic Login | T-01 to T-04 |
| Week 2 | Logout + Route Protection + Testing | T-05 to T-09 |

---

## SPRINT 2 — User Management (EP-02)

**Sprint Goal:** Allow the administrator to view, edit, and delete system users, improving administrative control over system access.

---

## User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-05 | As an Administrator, I want to view the list of users | High | 4 | Display all users | Admin accesses the user management page | Page finishes loading | A table displaying all registered users with their name, email, and role is shown |
| | | | | Empty state | No users are registered in the system | Admin accesses the user management page | Message "No users registered yet" is displayed |
| US-06 | As an Administrator, I want to edit or delete users | High | 4 | Edit user | Admin is on the user management page | Admin selects a user and modifies their data | Changes are saved to the database; updated data is reflected in the table |
| | | | | Delete user | Admin selects a user and confirms deletion | Deletion is confirmed | User is removed from the database; user no longer appears in the list |
| | | | | Delete own account | Admin attempts to delete their own account | Deletion is attempted | Action is blocked; message "You cannot delete your own account" is displayed |

---

## Tasks

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

## Week-by-Week Plan

| Week | Focus | Tasks |
|------|-------|-------|
| Week 3 | Backend endpoints for user management | T-10 to T-13 |
| Week 4 | Frontend integration + Access control + Testing | T-14, T-15 |

---

## SPRINT 3 — Products & Inventory (EP-03)

**Sprint Goal:** Implement complete product and inventory management to control the cafeteria's offerings and stock levels.

---

## User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-07 | As an Administrator, I want to create products | High | 5 | Successful creation | Admin is on the product creation form | All required fields (name, price, stock, category) are completed and submitted | Product is saved to the database and appears in the products list |
| | | | | Missing fields | Admin submits the form with incomplete data | The form is submitted | Submission halts; validation messages appear next to each invalid field |
| US-08 | As an Administrator, I want to edit or delete products | High | 5 | Edit product | Admin selects a product to edit | Updated data is submitted | Changes are saved and the products list reflects the updated information |
| | | | | Delete product | Admin confirms deletion of a product | Deletion is confirmed | Product is removed from the database and no longer appears in the list |
| | | | | Delete with active orders | Admin attempts to delete a product linked to active orders | Deletion is attempted | Action is blocked; message "Cannot delete a product with active orders" is displayed |
| US-09 | As an Administrator, I want to restock inventory | High | 5 | Successful restock | Admin is on the product inventory page | A valid quantity is entered and the restock action is confirmed | Stock is updated in the database; new quantity is reflected in the product list |
| | | | | Invalid quantity | Admin enters a negative or non-numeric value | Restock is attempted | Action is blocked; message "Please enter a valid positive number" is displayed |
| US-10 | As a User, I want to see when a product is out of stock | Medium | 3 | Out-of-stock indicator | A product's stock reaches zero | Any user views the products list | Product is displayed with a clear visual indicator "Out of stock"; it cannot be added to an order |
| | | | | Low stock warning | A product's stock falls below a defined threshold | Any user views the products list | Product is displayed with a "Low stock" warning indicator |

---

## Tasks

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

## Week-by-Week Plan

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

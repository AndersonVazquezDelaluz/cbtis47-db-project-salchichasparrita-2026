# Sprint Backlog — Chicaffe · First Partial

**Project:** Chicaffe - Cafeteria Management System
**Repository:** [`cbtis47-db-project-salchichasparrita-2026`](https://github.com/AndersonVazquezDelaluz/cbtis47-db-project-salchichasparrita-2026)
**Stack:** Node.js · Express · MySQL · HTML/CSS/JavaScript
**Dependencies:** `express ^4.18.2` · `mysql2 ^3.6.0` · `cors ^2.8.5` · `nodemon ^3.0.1` (dev)
**Local Environment:** XAMPP (Apache + MySQL) · `node server.js` / `nodemon server.js`
**Team:** Anderson Vázquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 3.0 | **Date:** May 29, 2026

---

## Team Roles

| Name | Role | Primary Responsibility |
|------|------|------------------------|
| Anderson Vázquez | Analyst & Designer | UI/UX design, business logic modeling, ERD, data dictionary |
| Jayden Reyes | SQL Developer | DDL scripts, schema creation, constraints (PK, FK), data types |
| Matthew Venegas | Database Administrator | Security, users, backups, final deliverable assembly |
| Axel de la Cruz | Query Master | Seed data, complex queries, JOINs, aggregates, reports |
| Anuar Contreras | SQL Tester | Referential integrity testing, bug reports, test cases |

---

## Partial Overview

| Sprint | Name | Epic | User Stories | Story Points | Est. Hours | Real Hours |
|--------|------|------|--------------|--------------|------------|------------|
| Sprint 1 | Authentication | EP-01 | US-01, US-02, US-03, US-04 | 14 SP | 20.5 h | ~28 h |
| Sprint 2 | User Management | EP-02 | US-05, US-06 | 8 SP | 11 h | ~14 h |
| Sprint 3 | Products & Inventory | EP-03 | US-07, US-08, US-09, US-10 | 18 SP | 19 h | ~24 h |
| **Total** | | | | **40 SP** | **50.5 h** | **~66 h** |

**Partial Duration:** ~10 weeks (2.5 months total for both partials)
**Real Available Hours:** ~32 h/partial · **Buffer applied:** ~30 % over estimate
**Team Velocity:** ~4 SP/week · ~16 SP/sprint

> **Note on hours:** Estimated hours reflect ideal conditions. Real hours were consistently higher due to environment setup, debugging MySQL connection issues, and JWT integration complexity. The buffer accounts for this overhead and is distributed across heavier technical tasks (T-02, T-04, T-07, T-20, T-21).

---

## Key Technical Decisions

| Decision | Chosen | Reason |
|----------|--------|--------|
| Auth strategy | JWT (stateless) | No session storage needed for a local system; simpler to implement with `mysql2` |
| Password hashing | bcrypt | Industry standard; built into the auth sprint from day one |
| DB driver | `mysql2` | Faster than `mysql`, supports Promises natively |
| Frontend approach | Vanilla HTML/CSS/JS + Fetch API | No framework overhead; matches team's skill level and DGETI scope |
| Local environment | XAMPP | Standard tool used in class; consistent across all team machines |
| Token storage | `localStorage` (client side) | Simplest approach for a school-scoped local system |

---

## SPRINT 1 — Authentication (EP-01)

**Sprint Goal:** Implement a secure authentication system with user registration, login, logout, and route protection using JWT and bcrypt.

**Sprint Velocity:** 14 SP · **Estimated:** 20.5 h · **Real:** ~28 h
*(Overrun due to JWT middleware debugging and bcrypt async integration)*

---

### User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-01 | As an Administrator, I want to register new users (name, email, password, role) | High | 5 | Successful registration | The administrator is on the user registration form | All required fields (name, email, password, role) are completed and the form is submitted | The system must save the user to the database with a hashed password and confirm the registration was successful |
| | | | | Duplicate email | The administrator is completing the registration form | An email address that already exists in the system is entered and the form is submitted | The system must reject the submission and display a message indicating the email is already registered |
| | | | | Missing or invalid fields | The administrator is completing the registration form | The form is submitted with one or more empty or invalid fields | The system must halt the submission and display specific validation messages next to each invalid field |
| US-02 | As a Registered User, I want to log in with email and password | High | 4 | Successful login | A registered user is on the login page | Valid credentials (email and password) are entered and the form is submitted | The system must generate a JWT token and redirect the user to the dashboard |
| | | | | Invalid credentials | A user is on the login page | An incorrect email or password is entered and the form is submitted | The system must display a clear error message and issue no token |
| | | | | Correct redirection | A registered user has successfully authenticated | The login process completes | The user must be redirected to the corresponding dashboard based on their role |
| US-03 | As an Authenticated User, I want to log out | High | 2 | Successful logout | An authenticated user is on any page of the system | The user clicks the logout button | The system must invalidate the JWT token on the client side and redirect the user to the login page |
| US-04 | As an Authenticated User, I want protected routes | High | 3 | Access with valid token | An authenticated user has a valid JWT token | The user navigates to any protected route | The system must grant access and load the requested page normally |
| | | | | Access without token | A user is not authenticated | The user attempts to access a protected route directly | The authentication middleware must block the request and redirect the user to the login page |
| | | | | Expired token | A user's JWT token has expired | The user attempts to navigate to a protected route | The system must deny access, clear the session, and redirect the user to the login page |

---

### Tasks

| # | Task | Priority | Est. h | Real h | Assignee | US | Status |
|---|------|----------|--------|--------|----------|----|--------|
| T-01 | Create `users` table in MySQL | High | 2 | 2 | Jayden Reyes (SQL Dev) | US-01 | Done |
| T-02 | Implement POST `/api/auth/register` endpoint with bcrypt password hashing | High | 3 | 4.5 | Jayden Reyes (SQL Dev) | US-01 | Done |
| T-03 | Create registration form (HTML + Fetch) with field validations | Medium | 2 | 2.5 | Anderson Vázquez (Designer) | US-01 | Done |
| T-04 | Implement POST `/api/auth/login` endpoint with JWT generation | High | 3 | 5 | Jayden Reyes (SQL Dev) | US-02 | Done |
| T-05 | Create login form with error handling and validation messages | Medium | 2 | 2 | Anderson Vázquez (Designer) | US-02 | Done |
| T-06 | Implement logout functionality (clear token from client) | Medium | 1.5 | 1.5 | Anderson Vázquez (Designer) | US-03 | Done |
| T-07 | Create authentication middleware (`authMiddleware.js`) | High | 2 | 4 | Matthew Venegas (DBA) | US-04 | Done |
| T-08 | Protect dashboard and admin routes with middleware | High | 2 | 3 | Matthew Venegas (DBA) | US-04 | Done |
| T-09 | Functional testing and bug fixing | High | 3 | 3.5 | Anuar Contreras (Tester) | All | Done |
---


### Week-by-Week Plan

| Week | Focus | Tasks | Assignees |
|------|-------|-------|-----------|
| Week 1 | Database setup + Registration + Basic Login | T-01 to T-04 | Jayden, Anderson |
| Week 2 | Logout + Route Protection + Testing | T-05 to T-09 | Anderson, Matthew, Anuar |

---

## SPRINT 2 — User Management (EP-02)

**Sprint Goal:** Allow the administrator to view, edit, and delete system users, improving administrative control over system access.

**Sprint Velocity:** 8 SP · **Estimated:** 11 h · **Real:** ~14 h
*(Overrun due to self-deletion guard edge case and confirmation modal polish)*

---

### User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-05 | As an Administrator, I want to view the list of users | High | 4 | Display complete list of users | The administrator accesses the user management page | The page finishes loading | The system must display a complete list of all registered users with support for filters to narrow down results |
| US-06 | As an Administrator, I want to edit or delete users | High | 4 | Secure update of user information | The administrator is on the user management page | The administrator selects a user and submits updated information | The system must save the changes securely to the database and reflect the updated data immediately in the users list |
| | | | | User deletion with confirmation | The administrator selects a user to delete | The administrator confirms the deletion action | The system must permanently remove the user from the database and the user must no longer appear in the users list |

---

### Tasks

| # | Task | Priority | Est. h | Real h | Assignee | US | Status |
|---|------|----------|--------|--------|----------|----|--------|
| T-10 | Implement GET `/api/users` endpoint to list all users | High | 2 | 2 | Jayden Reyes (SQL Dev) | US-05 | Done |
| T-11 | Create user management page with users table | Medium | 2 | 2.5 | Anderson Vázquez (Designer) | US-05 | Done |
| T-12 | Implement PUT `/api/users/:id` endpoint to update user data | High | 2 | 2.5 | Jayden Reyes (SQL Dev) | US-06 | Done |
| T-13 | Implement DELETE `/api/users/:id` endpoint with self-deletion guard | High | 2 | 3 | Matthew Venegas (DBA) | US-06 | Done |
| T-14 | Create edit and delete user interface with confirmation modal | Medium | 2 | 2.5 | Anderson Vázquez (Designer) | US-06 | Done |
| T-15 | Restrict user management section to administrators only | High | 1 | 1.5 | Anuar Contreras (Tester) | All | Done |
---

### Week-by-Week Plan

| Week | Focus | Tasks | Assignees |
|------|-------|-------|-----------|
| Week 3 | Backend endpoints for user management | T-10 to T-13 | Jayden, Matthew |
| Week 4 | Frontend integration + Access control + Testing | T-14, T-15 | Anderson, Anuar |

---

## SPRINT 3 — Products & Inventory (EP-03)

**Sprint Goal:** Implement complete product and inventory management to control the cafeteria's offerings and stock levels.

**Sprint Velocity:** 18 SP · **Estimated:** 19 h · **Real:** ~24 h
*(Overrun due to DELETE guard for active orders requiring cross-module logic ahead of schedule)*

---

### User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-07 | As an Administrator, I want to create products | High | 5 | Successful product creation | The administrator is on the product creation form | All required fields (name, price, stock, category) are completed and the form is submitted | The system must save the product to the database and display it in the products list |
| US-08 | As an Administrator, I want to edit or delete products | High | 5 | Real-time product update | The administrator selects a product to edit | Updated data is submitted | The system must save the changes to the database and reflect the updated information immediately in the products list |
| | | | | Product deletion | The administrator confirms deletion of a product | The deletion action is executed | The system must permanently remove the product from the database and it must no longer appear in the products list |
| US-09 | As an Administrator, I want to restock inventory | High | 5 | Successful inventory restock | The administrator is on the product management page | A valid quantity is entered for a product and the restock action is confirmed | The system must update the stock quantity in the database and reflect the new value in the products list |
| US-10 | As a User, I want to see when a product is out of stock | Medium | 3 | Out-of-stock indicator displayed | A product's stock quantity has reached zero | Any user views the products list | The system must display a clear visual indicator marking the product as out of stock |

---

### Tasks

| # | Task | Priority | Est. h | Real h | Assignee | US | Status |
|---|------|----------|--------|--------|----------|----|--------|
| T-16 | Create `products` table in MySQL with name, price, stock, and category fields | High | 1.5 | 1.5 | Jayden Reyes (SQL Dev) | US-07 | Done |
| T-17 | Implement POST `/api/products` endpoint to create a product | High | 2 | 2 | Jayden Reyes (SQL Dev) | US-07 | Done |
| T-18 | Create product creation form with field validations | Medium | 2 | 2 | Anderson Vázquez (Designer) | US-07 | Done |
| T-19 | Create products list page in the admin interface | Medium | 2 | 2.5 | Anderson Vázquez (Designer) | US-07, US-08 | Done |
| T-20 | Implement PUT `/api/products/:id` endpoint to update a product | High | 2 | 3 | Jayden Reyes (SQL Dev) | US-08 | Done |
| T-21 | Implement DELETE `/api/products/:id` endpoint with active-order guard | High | 2 | 3.5 | Matthew Venegas (DBA) | US-08 | Done |
| T-22 | Create edit and delete product interface with confirmation modal | Medium | 2 | 2 | Anderson Vázquez (Designer) | US-08 | Done |
| T-23 | Implement PUT `/api/products/:id/restock` endpoint for inventory update | High | 2 | 2.5 | Axel de la Cruz (Query Master) | US-09 | Done |
| T-24 | Create restock interface with quantity input and validation | Medium | 2 | 2 | Anderson Vázquez (Designer) | US-09 | Done |
| T-25 | Add out-of-stock and low-stock visual indicators to the products list | Medium | 1.5 | 2 | Anuar Contreras (Tester) | US-10 | Done |
---

### Week-by-Week Plan

| Week | Focus | Tasks | Assignees |
|------|-------|-------|-----------|
| Week 1 (S3) | Database + Product creation endpoints | T-16 to T-18 | Jayden, Anderson |
| Week 2 (S3) | Product editing, deletion + Inventory management | T-19 to T-25 | Anderson, Jayden, Matthew, Axel, Anuar |

---

## Definition of Done

- Clean and well-commented code
- Endpoints properly documented
- Manual tests completed by Anuar (SQL Tester)
- Fully functional in local environment (XAMPP)
- No critical security issues
- Correct integration between authentication, users, and products modules
- Proper error handling and validations
- Approved by the team and professor

---

## Team Velocity Summary (First Partial)

| Sprint | SP Planned | SP Completed | Hours Estimated | Hours Real |
|--------|-----------|--------------|-----------------|------------|
| Sprint 1 | 14 | 14 | 20.5 h | ~28 h |
| Sprint 2 | 8 | 8 | 11 h | ~14 h |
| Sprint 3 | 18 | 18 | 19 h | ~24 h |
| **Total** | **40** | **40** | **50.5 h** | **~66 h** |

---


**Current Status:** Completed

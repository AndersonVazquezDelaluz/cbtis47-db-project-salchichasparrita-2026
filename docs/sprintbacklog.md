# Sprint Backlog — Chicaffe

**Project:** Chicaffe - Cafeteria Management System  
**Repository:** `cbtis47-db-project-salchichasparrita-2026`  
**Stack:** HTML · CSS · JavaScript · Supabase  
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras  
**Version:** 1.2 | **Date:** May 14, 2026

---

## Sprint Overview

| Sprint | Name | Epic | Partial | User Stories | Story Points |
|---|---|---|---|---|---|
| Sprint 1 | Authentication | EP-01 | 1st Partial | US-01, US-02, US-03, US-04 | 13 SP |
| Sprint 2 | User Management | EP-02 | 1st Partial | US-05, US-06 | 5 SP |
| Sprint 3 | Products & Inventory | EP-03 | 1st Partial | US-07, US-08, US-09, US-10 | 17 SP |

---

#  FIRST PARTIAL

## Sprint 1 — Authentication `EP-01`

**Sprint Goal:** Enable secure access to the system through registration, login, logout, and protected routes.

### Related Functional Requirements (SRS)

- RF-01: The system shall allow administrators to register users.
- RF-02: The system shall authenticate users via email and password.
- RF-03: The system shall enforce protected routes.

### Related Non-Functional Requirements (SRS)

- RNF-02: Passwords must be securely handled.
- RNF-07: API errors must be user-friendly.

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-01 | Set up Supabase Auth project and credentials | US-01 | ⬜ To Do |
| T-02 | Build registration form (name, email, password) | US-01 | ⬜ To Do |
| T-03 | Connect registration form to Supabase Auth | US-01 | ⬜ To Do |
| T-04 | Add duplicate email and empty field validations | US-01 | ⬜ To Do |
| T-05 | Build login form (email, password) | US-02 | ⬜ To Do |
| T-06 | Connect login form to Supabase Auth | US-02 | ⬜ To Do |
| T-07 | Handle invalid credentials error message | US-02 | ⬜ To Do |
| T-08 | Implement logout button and session termination | US-03 | ⬜ To Do |
| T-09 | Redirect to login page after logout | US-03 | ⬜ To Do |
| T-10 | Create route guard / session check function | US-04 | ⬜ To Do |
| T-11 | Redirect unauthenticated users to login | US-04 | ⬜ To Do |

---

## Sprint 2 — User Management `EP-02`

**Sprint Goal:** Provide admins with full visibility and searchability over registered system users.

### Related Functional Requirements (SRS)

- RF-01: The system shall allow administrators to manage users.

### Related Non-Functional Requirements (SRS)

- RNF-03: The interface must be responsive.
- RNF-06: Code must follow consistent naming conventions.

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-12 | Query all users from Supabase and render in table | US-05 | ⬜ To Do |
| T-13 | Style users table (name, email, role, status columns) | US-05 | ⬜ To Do |
| T-14 | Add search input field to users page | US-06 | ⬜ To Do |
| T-15 | Implement real-time filter by name on user list | US-06 | ⬜ To Do |

---

## Sprint 3 — Products & Inventory `EP-03`

**Sprint Goal:** Give admins full CRUD control over products and maintain accurate real-time inventory.

### Related Functional Requirements (SRS)

- RF-04: The system shall support CRUD operations for products.
- RF-05: The system shall automatically decrease product stock.
- RF-07: The system shall prevent out-of-stock orders.

### Related Non-Functional Requirements (SRS)

- RNF-01: Product pages must load quickly.
- RNF-06: Code must be modular and maintainable.

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-16 | Create `products` table in Supabase (name, price, stock) | US-07 | ⬜ To Do |
| T-17 | Build new product form and connect to Supabase | US-07 | ⬜ To Do |
| T-18 | Render products list on admin page | US-07 | ⬜ To Do |
| T-19 | Build edit product modal with pre-filled data | US-08 | ⬜ To Do |
| T-20 | Implement update product in Supabase | US-08 | ⬜ To Do |
| T-21 | Implement delete product with confirmation dialog | US-08 | ⬜ To Do |
| T-22 | Build restock form (add quantity to existing stock) | US-09 | ⬜ To Do |
| T-23 | Update stock value in Supabase on restock | US-09 | ⬜ To Do |
| T-24 | Add "Out of Stock" badge when stock = 0 | US-10 | ⬜ To Do |
| T-25 | Disable add-to-order button when product is out of stock | US-10 | ⬜ To Do |

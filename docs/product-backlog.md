# Product Backlog — Chicaffe

**Project:** Chicaffe - Cafeteria Management System  
**Repository:** `cbtis47-db-project-salchichasparrita-2026`  
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras  
**Version:** 1.2 | **Date:** May 14, 2026

---

## Product Goal

> Develop a cafeteria management system that improves operational efficiency by organizing users, orders, inventory, tables, and reports, reducing manual errors and improving customer service.

---

##  Epics

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

#  FIRST PARTIAL

## Sprint 1 — Authentication `EP-01`

**Sprint Goal:** Enable secure access to the system through registration, login, logout, and protected routes.

### US-01 · User Registration by Administrator

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to register new users with name, email and password so that staff can access the system. |
| **Story Points** | 5 SP |

### US-02 · User Login

| Field | Detail |
|---|---|
| **Role** | Registered user |
| **User Story** | As a registered user, I want to log in with my email and password so that I can access the dashboard. |
| **Story Points** | 3 SP |

### US-03 · Logout

| Field | Detail |
|---|---|
| **Role** | Authenticated user |
| **User Story** | As an authenticated user, I want to log out at any time so that my session is safely terminated. |
| **Story Points** | 2 SP |

### US-04 · Protected Routes

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want protected pages to be accessible only by authenticated users so that unauthorized access is prevented. |
| **Story Points** | 3 SP |

---

## Sprint 2 — User Management `EP-02`

**Sprint Goal:** Provide admins with full visibility and searchability over registered system users.

### US-05 · View Users List

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to see all registered users in a table so that I have full visibility of the system's staff. |
| **Story Points** | 3 SP |

### US-06 · Search Users by Name

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to search users by name so that I can quickly find a specific user. |
| **Story Points** | 2 SP |

---

## Sprint 3 — Products & Inventory `EP-03`

**Sprint Goal:** Give admins full CRUD control over products and maintain accurate real-time inventory.

### US-07 · Create Product

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to create new products with name, price and initial stock so that the catalog stays up to date. |
| **Story Points** | 5 SP |

### US-08 · Edit and Delete Product

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to edit and delete existing products so that the catalog remains accurate. |
| **Story Points** | 5 SP |

### US-09 · Restock Inventory

| Field | Detail |
|---|---|
| **Role** | Administrator |
| **User Story** | As an administrator, I want to restock products so that stock levels are always accurate. |
| **Story Points** | 5 SP |

### US-10 · Out of Stock Visual Indicator

| Field | Detail |
|---|---|
| **Role** | User |
| **User Story** | As a user, I want to visually identify out-of-stock products so that I avoid attempting to order unavailable items. |
| **Story Points** | 2 SP |

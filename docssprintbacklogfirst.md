# Sprint Backlog — Chicaffe · First Partial

**Project:** Chicaffe - Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Stack:** HTML · CSS · JavaScript · Supabase
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 1.2 | **Date:** May 14, 2026

---

## Partial Overview

| Sprint | Name | Epic | User Stories | Story Points |
|---|---|---|---|---|
| Sprint 1 | Authentication | EP-01 | US-01, US-02, US-03, US-04 | 13 SP |
| Sprint 2 | User Management | EP-02 | US-05, US-06 | 5 SP |
| Sprint 3 | Products & Inventory | EP-03 | US-07, US-08, US-09, US-10 | 17 SP |
| | **Total** | | | **35 SP** |

**Partial Duration:** 4 weeks
**Available Hours:** 8h/week × 4 weeks = 32 real hours
**Expected Hours (with buffer):** ~48h — accounts for setbacks, learning curve, and revisions

---

## Sprint 1 — Authentication `EP-01`

**Sprint Goal:** Enable secure access to the system through registration, login, logout, and protected routes.

**Time Estimate**
- Real availability: ~10h
- Expected with buffer: ~15h
- Suggested weeks: Weeks 1–2

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-01 | User Registration by Administrator | 5 SP | High |
| US-02 | User Login | 3 SP | High |
| US-03 | Logout | 2 SP | High |
| US-04 | Protected Routes | 3 SP | High |
| | **Total** | **13 SP** | |

### Tasks

| # | Task | US | Assigned To | Status |
|---|---|---|---|---|
| T-01 | Set up Supabase Auth project and configure credentials | US-01 | Anderson Vazquez | ⬜ To Do |
| T-02 | Build the registration form (name, email, password) | US-01 | Axel de la Cruz | ⬜ To Do |
| T-03 | Connect the registration form to Supabase Auth | US-01 | Anderson Vazquez | ⬜ To Do |
| T-04 | Add duplicate email and empty field validations | US-01 | Anuar Contreras | ⬜ To Do |
| T-05 | Build the login form (email, password) | US-02 | Axel de la Cruz | ⬜ To Do |
| T-06 | Connect the login form to Supabase Auth | US-02 | Anderson Vazquez | ⬜ To Do |
| T-07 | Handle and display invalid credentials error message | US-02 | Anuar Contreras | ⬜ To Do |
| T-08 | Implement logout button and session termination logic | US-03 | Anderson Vazquez | ⬜ To Do |
| T-09 | Redirect user to login page after logout | US-03 | Axel de la Cruz | ⬜ To Do |
| T-10 | Create route guard and session check function | US-04 | Anderson Vazquez | ⬜ To Do |
| T-11 | Redirect unauthenticated users to the login page | US-04 | Anuar Contreras | ⬜ To Do |

---

## Sprint 2 — User Management `EP-02`

**Sprint Goal:** Provide administrators with full visibility and searchability over all registered system users.

**Time Estimate**
- Real availability: ~8h
- Expected with buffer: ~12h
- Suggested weeks: Week 2–3

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-05 | View Users List | 3 SP | High |
| US-06 | Search Users by Name | 2 SP | Medium |
| | **Total** | **5 SP** | |

### Tasks

| # | Task | US | Assigned To | Status |
|---|---|---|---|---|
| T-12 | Query all users from Supabase and render them in a table | US-05 | Jayden Reyes | ⬜ To Do |
| T-13 | Style the users table (name, email, role, status columns) | US-05 | Axel de la Cruz | ⬜ To Do |
| T-14 | Add a search input field to the users page | US-06 | Axel de la Cruz | ⬜ To Do |
| T-15 | Implement real-time filter by name on the users list | US-06 | Jayden Reyes | ⬜ To Do |

---

## Sprint 3 — Products & Inventory `EP-03`

**Sprint Goal:** Give administrators full control over the product catalog and maintain accurate real-time inventory.

**Time Estimate**
- Real availability: ~14h
- Expected with buffer: ~21h
- Suggested weeks: Weeks 3–4

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-07 | Create Product | 5 SP | High |
| US-08 | Edit and Delete Product | 5 SP | High |
| US-09 | Restock Inventory | 5 SP | High |
| US-10 | Out of Stock Visual Indicator | 2 SP | Medium |
| | **Total** | **17 SP** | |

### Tasks

| # | Task | US | Assigned To | Status |
|---|---|---|---|---|
| T-16 | Create `products` table in Supabase (name, price, stock) | US-07 | Matthew Venegas | ⬜ To Do |
| T-17 | Build the new product form and connect it to Supabase | US-07 | Axel de la Cruz | ⬜ To Do |
| T-18 | Render the products list on the admin page | US-07 | Jayden Reyes | ⬜ To Do |
| T-19 | Build the edit product modal with pre-filled data | US-08 | Axel de la Cruz | ⬜ To Do |
| T-20 | Implement update product functionality in Supabase | US-08 | Matthew Venegas | ⬜ To Do |
| T-21 | Implement delete product with confirmation dialog | US-08 | Anuar Contreras | ⬜ To Do |
| T-22 | Build the restock form (add quantity to existing stock) | US-09 | Jayden Reyes | ⬜ To Do |
| T-23 | Update stock value in Supabase on restock submission | US-09 | Matthew Venegas | ⬜ To Do |
| T-24 | Display "Out of Stock" badge when stock equals 0 | US-10 | Axel de la Cruz | ⬜ To Do |
| T-25 | Disable the add-to-order button when product is out of stock | US-10 | Anuar Contreras | ⬜ To Do |

---

## Definition of Done

- Code implemented and tested locally
- No critical bugs open
- Feature approved by the team
- Tasks moved to ✅ Done in the board

---

## Team

| Member | Role |
|---|---|
| Anderson Vazquez | Analyst & Designer |
| Jayden Reyes | SQL Developer |
| Matthew Venegas | Database Administrator |
| Axel de la Cruz | Query Master |
| Anuar Contreras | SQL Tester |

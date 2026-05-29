# Sprint Backlog — Chicaffe · Second Partial

**Project:** Chicaffe - Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Stack:** HTML · CSS · JavaScript · Supabase
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 1.2 | **Date:** May 14, 2026

---

## Partial Overview

| Sprint | Name | Epic | User Stories | Story Points |
|---|---|---|---|---|
| Sprint 4 | Tables | EP-04 | US-11 | 5 SP |
| Sprint 5 | Orders | EP-05 | US-12, US-13, US-14, US-15 | 26 SP |
| Sprint 6 | Reports | EP-06 | US-16 | 8 SP |
| | **Total** | | | **39 SP** |

**Partial Duration:** 4 weeks
**Available Hours:** 8h/week × 4 weeks = 32 real hours
**Expected Hours (with buffer):** ~50h — Orders (Sprint 5) is the most complex sprint in the project; extra time is expected

---

## Sprint 4 — Tables `EP-04`

**Sprint Goal:** Allow administrators to manage physical cafeteria tables to support accurate order assignment.

**Time Estimate**
- Real availability: ~6h
- Expected with buffer: ~9h
- Suggested weeks: Week 1

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-11 | Tables Management (CRUD) | 5 SP | Medium |
| | **Total** | **5 SP** | |

### Tasks

| # | Task | US | Assigned To | Status |
|---|---|---|---|---|
| T-26 | Create `tables` table in Supabase (number, capacity, status) | US-11 | Matthew Venegas | ⬜ To Do |
| T-27 | Build the create table form | US-11 | Axel de la Cruz | ⬜ To Do |
| T-28 | Render the tables list on the admin page | US-11 | Jayden Reyes | ⬜ To Do |
| T-29 | Implement edit table functionality | US-11 | Axel de la Cruz | ⬜ To Do |
| T-30 | Implement delete table with confirmation dialog | US-11 | Anuar Contreras | ⬜ To Do |
| T-31 | Block table deletion if active orders are linked to it | US-11 | Anderson Vazquez | ⬜ To Do |

---

## Sprint 5 — Orders `EP-05`

**Sprint Goal:** Enable employees to fully manage the lifecycle of customer orders with automatic inventory control.

**Time Estimate**
- Real availability: ~18h
- Expected with buffer: ~28h
- Suggested weeks: Weeks 2–3 (this sprint may bleed into week 4)

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-12 | Create Order | 5 SP | High |
| US-13 | Add Products to Order | 8 SP | High |
| US-14 | Change Order Status | 5 SP | High |
| US-15 | Cancel Order and Restore Inventory | 8 SP | High |
| | **Total** | **26 SP** | |

### Tasks

| # | Task | US | Assigned To | Status |
|---|---|---|---|---|
| T-32 | Create `orders` table in Supabase (user, table, status, date) | US-12 | Matthew Venegas | ⬜ To Do |
| T-33 | Build the new order form (select customer and table) | US-12 | Axel de la Cruz | ⬜ To Do |
| T-34 | Save the new order with initial status "pending" | US-12 | Anderson Vazquez | ⬜ To Do |
| T-35 | Create `order_items` table (order_id, product_id, quantity) | US-13 | Matthew Venegas | ⬜ To Do |
| T-36 | Build the add-product-to-order interface | US-13 | Axel de la Cruz | ⬜ To Do |
| T-37 | Automatically deduct stock when a product is added to an order | US-13 | Jayden Reyes | ⬜ To Do |
| T-38 | Block adding out-of-stock products and display error message | US-13 | Anuar Contreras | ⬜ To Do |
| T-39 | Build the order status selector (pending / in-progress / delivered) | US-14 | Axel de la Cruz | ⬜ To Do |
| T-40 | Validate and enforce allowed status transitions | US-14 | Anderson Vazquez | ⬜ To Do |
| T-41 | Block invalid transitions and display an explanatory message | US-14 | Anuar Contreras | ⬜ To Do |
| T-42 | Implement the cancel order action with confirmation | US-15 | Axel de la Cruz | ⬜ To Do |
| T-43 | Restore the stock of each product upon order cancellation | US-15 | Jayden Reyes | ⬜ To Do |

---

## Sprint 6 — Reports `EP-06`

**Sprint Goal:** Provide administrators with actionable daily sales insights to support informed decision-making.

**Time Estimate**
- Real availability: ~8h
- Expected with buffer: ~13h
- Suggested weeks: Week 4

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-16 | Daily Sales Report | 8 SP | Medium |
| | **Total** | **8 SP** | |

### Tasks

| # | Task | US | Assigned To | Status |
|---|---|---|---|---|
| T-44 | Query delivered orders filtered by selected date | US-16 | Jayden Reyes | ⬜ To Do |
| T-45 | Calculate total sales amount and total order count | US-16 | Matthew Venegas | ⬜ To Do |
| T-46 | Render the report table (product, quantity sold, subtotal) | US-16 | Axel de la Cruz | ⬜ To Do |
| T-47 | Display "No sales data for the selected period" when no results found | US-16 | Anuar Contreras | ⬜ To Do |

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

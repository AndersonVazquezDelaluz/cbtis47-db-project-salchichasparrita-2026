# Sprint Backlog — Chicaffe · Second Partial

**Project:** Chicaffe - Cafeteria Management System  
**Repository:** `cbtis47-db-project-salchichasparrita-2026`  
**Stack:** Node.js · Express · MySQL · HTML/CSS/JavaScript  
**Team:** Anderson Vázquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras  
**Version:** 2.1 | **Date:** May 29, 2026

---

## Partial Overview

| Sprint | Name | Epic | User Stories | Story Points |
|--------|-------------------|--------|---------------------------------|--------------|
| Sprint 4 | Tables | EP-04 | US-11 | 6 SP |
| Sprint 5 | Orders | EP-05 | US-12, US-13, US-14, US-15 | 26 SP |
| Sprint 6 | Reports | EP-06 | US-16 | 8 SP |
| **Total** | | | | **40 SP** |

**Partial Duration:** 4 weeks  
**Real Available Hours:** 8h/week × 4 = 32 hours  
**Estimated Hours (with buffer):** ~52 hours

---

## SPRINT 4 — Tables (EP-04)

**Sprint Goal**  
Allow the administrator to manage cafeteria tables (CRUD operations).

**User Stories**

| US | User Story | Priority | SP |
|-------|------------|----------|----|
| US-11 | As an Administrator, I want to manage tables (create, edit, delete, assign number and status) | Medium | 6 |

**Tasks**

| # | Task | Hours | US | Status |
|---|------|-------|---|--------|
| T-26 | Create `tables` table in MySQL | 1.5 | US-11 | Done |
| T-27 | Implement CRUD endpoints for tables | 2 | US-11 | Done |
| T-28 | Create form to add new table | 1 | US-11 | Done |
| T-29 | Display tables list in admin interface | 1 | US-11 | Done |
| T-30 | Implement edit and delete table functionality | 1.5 | US-11 | Done |
| T-31 | Prevent deletion of tables with active orders | 1 | US-11 | Done |

---

## SPRINT 5 — Orders (EP-05)

**Sprint Goal**  
Implement the complete order flow: create orders, add products, change status, and cancel with inventory restoration.

**User Stories**

| US | User Story | Priority | SP | Acceptance Criteria |
|-------|------------|----------|----|---------------------|
| US-12 | As a User, I want to create a new order | High | 5 | Order created with table and user association, initial status "pending" |
| US-13 | As a User, I want to add products to an order | High | 8 | Products added to order, stock automatically deducted, prevent out-of-stock items |
| US-14 | As a User, I want to change order status | High | 6 | Valid status transitions (pending → in-progress → delivered) |
| US-15 | As a User, I want to cancel an order and restore inventory | High | 7 | Order cancelled, stock restored for all items |

**Tasks**

| # | Task | Hours | US | Status |
|---|------|-------|---|--------|
| T-32 | Create `orders` table in MySQL | 2 | US-12 | Done |
| T-33 | Create `order_items` table in MySQL | 2 | US-13 | Done |
| T-34 | Implement endpoint to create new order | 3 | US-12 | Done |
| T-35 | Implement endpoint to add products to order with stock deduction | 5 | US-13 | Done |
| T-36 | Create interface to select table and create order | 3 | US-12 | Done |
| T-37 | Create interface to add products to existing order | 4 | US-13 | Done |
| T-38 | Implement order status update with validation | 3 | US-14 | Done |
| T-39 | Implement order cancellation with inventory restoration | 4 | US-15 | Done |
| T-40 | Add validations and error handling for the entire order flow | 3 | All | Done |

---

## SPRINT 6 — Reports (EP-06)

**Sprint Goal**  
Generate basic daily sales reports for financial control.

**User Stories**

| US | User Story | Priority | SP | Acceptance Criteria |
|-------|------------|----------|----|---------------------|
| US-16 | As an Administrator, I want to generate daily sales reports | Medium | 8 | Report filtered by date, showing products sold, quantities, and totals |

**Tasks**

| # | Task | Hours | US | Status |
|---|------|-------|---|--------|
| T-41 | Implement endpoint for sales report by date | 3 | US-16 | Done |
| T-42 | Create reports interface with date selector | 2 | US-16 | Done |
| T-43 | Display table with sold products, quantities and subtotals | 2 | US-16 | Done |
| T-44 | Calculate and display general sales totals | 1 | US-16 | Done |

---

## Definition of Done (Second Partial)

- Clean and well-commented code
- Endpoints properly documented
- Manual tests completed
- Correct integration between orders, inventory and tables
- Proper error handling and validations
- Fully functional in local environment
- Approved by the team and professor

---

**Current Status:** Completed

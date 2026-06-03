# Sprint Backlog — Chicaffe · Second Partial

**Project:** Chicaffe - Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Stack:** Node.js · Express · MySQL · HTML/CSS/JavaScript
**Team:** Anderson Vázquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 2.1 | **Date:** May 29, 2026

---

## Partial Overview

| Sprint | Name | Epic | User Stories | Story Points |
|--------|------|------|--------------|--------------|
| Sprint 4 | Tables | EP-04 | US-11 | 6 SP |
| Sprint 5 | Orders | EP-05 | US-12, US-13, US-14, US-15 | 26 SP |
| Sprint 6 | Reports | EP-06 | US-16 | 8 SP |
| **Total** | | | | **40 SP** |

**Partial Duration:** 4 weeks · **Real Available Hours:** 32 h · **Estimated Hours (with buffer):** ~52 h

---

## SPRINT 4 — Tables (EP-04)

**Sprint Goal:** Allow the administrator to manage cafeteria tables through full CRUD operations, including number assignment and availability status control.

---

## User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-11 | As an Administrator, I want to manage tables (create, edit, delete, assign number and status) | Medium | 6 | Successful table creation | The administrator is on the table management page | A valid table number and status are entered and the form is submitted | The system must save the table to the database and display it in the tables list with the assigned number and status |
| | | | | Edit table information | The administrator selects an existing table to edit | Updated data is submitted | The system must save the changes to the database and reflect the updated information immediately in the tables list |
| | | | | Delete table without active orders | A table has no active orders associated with it | The administrator confirms the deletion of that table | The system must permanently remove the table from the database and it must no longer appear in the tables list |
| | | | | Delete table with active orders blocked | A table has one or more active orders associated with it | The administrator attempts to delete that table | The system must block the deletion and display a message indicating the table cannot be deleted while it has active orders |

---

## Tasks

| # | Task | Hours | US | Status |
|---|------|-------|----|--------|
| T-26 | Create `tables` table in MySQL with number and status fields | 1.5 | US-11 | Done |
| T-27 | Implement CRUD endpoints for tables (GET, POST, PUT, DELETE) | 2 | US-11 | Done |
| T-28 | Create form to add new table with field validations | 1 | US-11 | Done |
| T-29 | Display tables list in the admin interface | 1 | US-11 | Done |
| T-30 | Implement edit and delete table functionality with confirmation modal | 1.5 | US-11 | Done |
| T-31 | Prevent deletion of tables with active orders | 1 | US-11 | Done |

**Total estimated hours: 8 h**

---

## Week-by-Week Plan

| Week | Focus | Tasks |
|------|-------|-------|
| Week 1 | Database + CRUD endpoints + Admin interface | T-26 to T-31 |

---

## SPRINT 5 — Orders (EP-05)

**Sprint Goal:** Implement the complete order flow: create orders, add products, change status, and cancel with automatic inventory restoration.

---

## User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-12 | As a User, I want to create a new order | High | 5 | Successful order creation | The user is on the order creation page | A table is selected and the order is confirmed | The system must create the order with an initial status of "pending" associated with the selected table and the authenticated user |
| US-13 | As a User, I want to add products to an order | High | 8 | Successful product addition | An order with status "pending" exists | The user selects a product with available stock and a valid quantity and confirms | The system must add the product to the order and automatically deduct the stock from inventory |
| | | | | Out-of-stock product blocked | An order exists and a product has zero stock | The user attempts to add that product to the order | The system must prevent the addition and display a message indicating the product is out of stock |
| US-14 | As a User, I want to change order status | High | 6 | Valid status transition | An order exists with a current status | The user selects a valid next status following the flow (pending → in-progress → delivered) | The system must update the order status in the database and reflect the change in the order view |
| | | | | Invalid status transition blocked | An order exists with a current status | The user attempts to set a status that does not follow the valid transition flow | The system must block the change and display a message indicating the transition is not allowed |
| US-15 | As a User, I want to cancel an order and restore inventory | High | 7 | Successful cancellation with inventory restoration | An order exists with status "pending" or "in-progress" | The user confirms the cancellation of that order | The system must update the order status to "cancelled" and restore the stock for all products associated with that order |
| | | | | Cancellation of delivered order blocked | An order exists with status "delivered" | The user attempts to cancel that order | The system must block the cancellation and display a message indicating that delivered orders cannot be cancelled |

---

## Tasks

| # | Task | Hours | US | Status |
|---|------|-------|----|--------|
| T-32 | Create `orders` table in MySQL with status and associations | 2 | US-12 | Done |
| T-33 | Create `order_items` table in MySQL with product, quantity, and unit price | 2 | US-13 | Done |
| T-34 | Implement POST `/api/orders` endpoint to create a new order | 3 | US-12 | Done |
| T-35 | Implement POST `/api/orders/:id/items` endpoint to add products with stock deduction | 5 | US-13 | Done |
| T-36 | Create interface to select table and create order | 3 | US-12 | Done |
| T-37 | Create interface to add products to an existing order | 4 | US-13 | Done |
| T-38 | Implement PUT `/api/orders/:id/status` endpoint with transition validation | 3 | US-14 | Done |
| T-39 | Implement PUT `/api/orders/:id/cancel` endpoint with inventory restoration | 4 | US-15 | Done |
| T-40 | Add validations and error handling for the entire order flow | 3 | All | Done |

**Total estimated hours: 29 h**

---

## Week-by-Week Plan

| Week | Focus | Tasks |
|------|-------|-------|
| Week 2 | Orders database + Create order + Add products | T-32 to T-37 |
| Week 3 | Status management + Cancellation + Error handling | T-38 to T-40 |

---

## SPRINT 6 — Reports (EP-06)

**Sprint Goal:** Generate basic daily sales reports to support financial control and decision-making.

---

## User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-16 | As an Administrator, I want to generate daily sales reports | Medium | 8 | Successful report generation filtered by date | The administrator is on the reports page | A valid date is selected and the report is generated | The system must display a table with all products sold on that date, including product name, quantity sold, unit price, and subtotal per product, along with the general total of sales for the day |
| | | | | No data for selected date | No orders exist for the selected date | The report is generated | The system must display a message indicating no sales data is available for that date and must not render any table or totals |

---

## Tasks

| # | Task | Hours | US | Status |
|---|------|-------|----|--------|
| T-41 | Implement GET `/api/reports/sales` endpoint filtered by date | 3 | US-16 | Done |
| T-42 | Create reports page with date selector | 2 | US-16 | Done |
| T-43 | Display table with sold products, quantities, unit prices, and subtotals | 2 | US-16 | Done |
| T-44 | Calculate and display general sales total for the selected day | 1 | US-16 | Done |

**Total estimated hours: 8 h**

---

## Week-by-Week Plan

| Week | Focus | Tasks |
|------|-------|-------|
| Week 4 | Sales report endpoint + Interface + Totals | T-41 to T-44 |

---

## Definition of Done

- Clean and well-commented code
- Endpoints properly documented
- Manual tests completed
- Correct integration between orders, inventory, and tables modules
- Proper error handling and validations
- Fully functional in local environment
- Approved by the team and professor

---

**Current Status:** Completed

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
| US-11 | As an Administrator, I want to manage tables (create, edit, delete, assign number and status) | Medium | 6 | Create table | Admin is on the table management page | A valid table number is entered and the form is submitted | Table is saved to the database with status "available" and appears in the tables list |
| | | | | Edit table | Admin selects an existing table | Updated number or status is submitted | Changes are saved to the database; updated data is reflected in the table list |
| | | | | Delete table | Admin selects a table and confirms deletion | No active orders are associated with the table | Table is removed from the database and no longer appears in the list |
| | | | | Delete table with active orders | Admin attempts to delete a table that has active orders | Deletion is attempted | Action is blocked; message "Cannot delete a table with active orders" is displayed |
| | | | | Duplicate table number | Admin enters a table number that already exists | The form is submitted | Submission halts; message "This table number is already registered" is displayed |

---

## Tasks

| # | Task | Hours | US | Status |
|---|------|-------|----|--------|
| T-26 | Create `tables` table in MySQL with number and status fields | 1.5 | US-11 |  Done |
| T-27 | Implement CRUD endpoints for tables (GET, POST, PUT, DELETE) | 2 | US-11 |  Done |
| T-28 | Create form to add new table with field validations | 1 | US-11 |  Done |
| T-29 | Display tables list in the admin interface | 1 | US-11 |  Done |
| T-30 | Implement edit and delete table functionality with confirmation modal | 1.5 | US-11 | Done |
| T-31 | Prevent deletion of tables with active orders | 1 | US-11 |  Done |

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
| US-12 | As a User, I want to create a new order | High | 5 | Successful order creation | User is on the order creation page | A table is selected and the order is confirmed | Order is created with status "pending", associated to the selected table and the authenticated user |
| | | | | No table selected | User attempts to create an order without selecting a table | The form is submitted | Submission halts; message "Please select a table to continue" is displayed |
| US-13 | As a User, I want to add products to an order | High | 8 | Add product to order | An order with status "pending" exists | User selects a product and a valid quantity and confirms | Product is added to the order; stock is automatically deducted from inventory |
| | | | | Out-of-stock product | User attempts to add a product with zero stock | Addition is attempted | Action is blocked; message "This product is out of stock" is displayed |
| | | | | Insufficient stock | User requests a quantity greater than available stock | Addition is attempted | Action is blocked; message "Insufficient stock. Available: [n] units" is displayed |
| US-14 | As a User, I want to change order status | High | 6 | Valid status transition | An order exists in "pending" status | User changes the status to "in-progress" | Status is updated in the database; change is reflected in the order view |
| | | | | Complete order | An order exists in "in-progress" status | User changes the status to "delivered" | Status is updated to "delivered"; order is marked as completed |
| | | | | Invalid status transition | User attempts to set a status that does not follow the valid flow | Status change is attempted | Action is blocked; message "Invalid status transition" is displayed |
| US-15 | As a User, I want to cancel an order and restore inventory | High | 7 | Cancel pending order | An order with status "pending" or "in-progress" exists | User confirms the cancellation | Order status changes to "cancelled"; stock is restored for all associated items |
| | | | | Cancel delivered order | User attempts to cancel an order with status "delivered" | Cancellation is attempted | Action is blocked; message "Delivered orders cannot be cancelled" is displayed |

---

## Tasks

| # | Task | Hours | US | Status |
|---|------|-------|----|--------|
| T-32 | Create `orders` table in MySQL with status and associations | 2 | US-12 | ✅ Done |
| T-33 | Create `order_items` table in MySQL with product, quantity, and unit price | 2 | US-13 | ✅ Done |
| T-34 | Implement POST `/api/orders` endpoint to create a new order | 3 | US-12 | ✅ Done |
| T-35 | Implement POST `/api/orders/:id/items` endpoint to add products with stock deduction | 5 | US-13 | ✅ Done |
| T-36 | Create interface to select table and create order | 3 | US-12 | ✅ Done |
| T-37 | Create interface to add products to an existing order | 4 | US-13 | ✅ Done |
| T-38 | Implement PUT `/api/orders/:id/status` endpoint with transition validation | 3 | US-14 | ✅ Done |
| T-39 | Implement PUT `/api/orders/:id/cancel` endpoint with inventory restoration | 4 | US-15 | ✅ Done |
| T-40 | Add validations and error handling for the entire order flow | 3 | All | ✅ Done |

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
| US-16 | As an Administrator, I want to generate daily sales reports | Medium | 8 | Successful report generation | Admin is on the reports page | A valid date is selected and the report is generated | System displays a table with all products sold on that date, their quantities, unit prices, subtotals, and the general total |
| | | | | No data for selected date | No orders exist for the selected date | Report is generated | Message "No sales data available for the selected date" is displayed; no table is rendered |
| | | | | Invalid date | Admin leaves the date field empty or enters an invalid value | Report generation is attempted | Submission halts; message "Please select a valid date" is displayed |
| | | | | General totals displayed | A report with data has been generated | Report results are shown | General total of sales for the day is displayed below the product table |

---

## Tasks

| # | Task | Hours | US | Status |
|---|------|-------|----|--------|
| T-41 | Implement GET `/api/reports/sales` endpoint filtered by date | 3 | US-16 | ✅ Done |
| T-42 | Create reports page with date selector | 2 | US-16 | ✅ Done |
| T-43 | Display table with sold products, quantities, unit prices, and subtotals | 2 | US-16 | ✅ Done |
| T-44 | Calculate and display general sales total for the selected day | 1 | US-16 | ✅ Done |

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

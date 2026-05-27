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
| Sprint 4 | Tables | EP-04 | 2nd Partial | US-11 | 5 SP |
| Sprint 5 | Orders | EP-05 | 2nd Partial | US-12, US-13, US-14, US-15 | 26 SP |
| Sprint 6 | Reports | EP-06 | 2nd Partial | US-16 | 8 SP |
| Sprint 7 | Enhancements & Polish | EP-07 | 3rd Partial | US-17, US-18, US-19, US-20, US-21, US-22 | 36 SP |

---

# 🟦 FIRST PARTIAL

---

## Sprint 1 — Authentication `EP-01`

**Sprint Goal:** Enable secure access to the system through registration, login, logout, and protected routes.

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-01 | User Registration by Administrator | 5 SP | High |
| US-02 | User Login | 3 SP | High |
| US-03 | Logout | 2 SP | High |
| US-04 | Protected Routes | 3 SP | High |
| | **Total** | **13 SP** | |

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-01 | Set up Supabase Auth project and configure credentials | US-01 | ⬜ To Do |
| T-02 | Build the registration form (name, email, password) | US-01 | ⬜ To Do |
| T-03 | Connect the registration form to Supabase Auth | US-01 | ⬜ To Do |
| T-04 | Add duplicate email and empty field validations | US-01 | ⬜ To Do |
| T-05 | Build the login form (email, password) | US-02 | ⬜ To Do |
| T-06 | Connect the login form to Supabase Auth | US-02 | ⬜ To Do |
| T-07 | Handle and display invalid credentials error message | US-02 | ⬜ To Do |
| T-08 | Implement logout button and session termination logic | US-03 | ⬜ To Do |
| T-09 | Redirect user to login page after logout | US-03 | ⬜ To Do |
| T-10 | Create route guard and session check function | US-04 | ⬜ To Do |
| T-11 | Redirect unauthenticated users to the login page | US-04 | ⬜ To Do |

---

## Sprint 2 — User Management `EP-02`

**Sprint Goal:** Provide administrators with full visibility and searchability over all registered system users.

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-05 | View Users List | 3 SP | High |
| US-06 | Search Users by Name | 2 SP | Medium |
| | **Total** | **5 SP** | |

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-12 | Query all users from Supabase and render them in a table | US-05 | ⬜ To Do |
| T-13 | Style the users table (name, email, role, status columns) | US-05 | ⬜ To Do |
| T-14 | Add a search input field to the users page | US-06 | ⬜ To Do |
| T-15 | Implement real-time filter by name on the users list | US-06 | ⬜ To Do |

---

## Sprint 3 — Products & Inventory `EP-03`

**Sprint Goal:** Give administrators full control over the product catalog and maintain accurate real-time inventory.

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-07 | Create Product | 5 SP | High |
| US-08 | Edit and Delete Product | 5 SP | High |
| US-09 | Restock Inventory | 5 SP | High |
| US-10 | Out of Stock Visual Indicator | 2 SP | Medium |
| | **Total** | **17 SP** | |

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-16 | Create `products` table in Supabase (name, price, stock) | US-07 | ⬜ To Do |
| T-17 | Build the new product form and connect it to Supabase | US-07 | ⬜ To Do |
| T-18 | Render the products list on the admin page | US-07 | ⬜ To Do |
| T-19 | Build the edit product modal with pre-filled data | US-08 | ⬜ To Do |
| T-20 | Implement update product functionality in Supabase | US-08 | ⬜ To Do |
| T-21 | Implement delete product with confirmation dialog | US-08 | ⬜ To Do |
| T-22 | Build the restock form (add quantity to existing stock) | US-09 | ⬜ To Do |
| T-23 | Update stock value in Supabase on restock submission | US-09 | ⬜ To Do |
| T-24 | Display "Out of Stock" badge when stock equals 0 | US-10 | ⬜ To Do |
| T-25 | Disable the add-to-order button when product is out of stock | US-10 | ⬜ To Do |

---

# 🟩 SECOND PARTIAL

---

## Sprint 4 — Tables `EP-04`

**Sprint Goal:** Allow administrators to manage physical cafeteria tables to support accurate order assignment.

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-11 | Tables Management (CRUD) | 5 SP | Medium |
| | **Total** | **5 SP** | |

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-26 | Create `tables` table in Supabase (number, capacity, status) | US-11 | ⬜ To Do |
| T-27 | Build the create table form | US-11 | ⬜ To Do |
| T-28 | Render the tables list on the admin page | US-11 | ⬜ To Do |
| T-29 | Implement edit table functionality | US-11 | ⬜ To Do |
| T-30 | Implement delete table with confirmation dialog | US-11 | ⬜ To Do |
| T-31 | Block table deletion if active orders are linked to it | US-11 | ⬜ To Do |

---

## Sprint 5 — Orders `EP-05`

**Sprint Goal:** Enable employees to fully manage the lifecycle of customer orders with automatic inventory control.

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-12 | Create Order | 5 SP | High |
| US-13 | Add Products to Order | 8 SP | High |
| US-14 | Change Order Status | 5 SP | High |
| US-15 | Cancel Order and Restore Inventory | 8 SP | High |
| | **Total** | **26 SP** | |

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-32 | Create `orders` table in Supabase (user, table, status, date) | US-12 | ⬜ To Do |
| T-33 | Build the new order form (select customer and table) | US-12 | ⬜ To Do |
| T-34 | Save the new order with initial status "pending" | US-12 | ⬜ To Do |
| T-35 | Create `order_items` table (order_id, product_id, quantity) | US-13 | ⬜ To Do |
| T-36 | Build the add-product-to-order interface | US-13 | ⬜ To Do |
| T-37 | Automatically deduct stock when a product is added to an order | US-13 | ⬜ To Do |
| T-38 | Block adding out-of-stock products and display error message | US-13 | ⬜ To Do |
| T-39 | Build the order status selector (pending / in-progress / delivered) | US-14 | ⬜ To Do |
| T-40 | Validate and enforce allowed status transitions | US-14 | ⬜ To Do |
| T-41 | Block invalid transitions and display an explanatory message | US-14 | ⬜ To Do |
| T-42 | Implement the cancel order action with confirmation | US-15 | ⬜ To Do |
| T-43 | Restore the stock of each product upon order cancellation | US-15 | ⬜ To Do |

---

## Sprint 6 — Reports `EP-06`

**Sprint Goal:** Provide administrators with actionable daily sales insights to support informed decision-making.

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-16 | Daily Sales Report | 8 SP | Medium |
| | **Total** | **8 SP** | |

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-44 | Query delivered orders filtered by selected date | US-16 | ⬜ To Do |
| T-45 | Calculate total sales amount and total order count | US-16 | ⬜ To Do |
| T-46 | Render the report table (product, quantity sold, subtotal) | US-16 | ⬜ To Do |
| T-47 | Display "No sales data for the selected period" when no results are found | US-16 | ⬜ To Do |

---

# 🟨 THIRD PARTIAL

---

## Sprint 7 — Enhancements & Polish `EP-07`

**Sprint Goal:** Elevate the system with advanced analytics, role-based access control, export capabilities, and production-grade reliability.

| US | Title | Story Points | Priority |
|---|---|---|---|
| US-17 | Advanced Sales Reports with Charts | 8 SP | Medium |
| US-18 | Order History and Search | 6 SP | Medium |
| US-19 | User Roles and Permissions | 8 SP | High |
| US-20 | Export Reports (PDF / CSV) | 5 SP | Medium |
| US-21 | Performance Optimization | 5 SP | Medium |
| US-22 | Improved Error Handling | 4 SP | Medium |
| | **Total** | **36 SP** | |

### Tasks

| # | Task | US | Status |
|---|---|---|---|
| T-48 | Add a date range picker to the reports page | US-17 | ⬜ To Do |
| T-49 | Filter report queries by the selected date range | US-17 | ⬜ To Do |
| T-50 | Integrate Chart.js and render a bar chart (sales by day) | US-17 | ⬜ To Do |
| T-51 | Add a pie chart (top products) and a line chart (sales trend) | US-17 | ⬜ To Do |
| T-52 | Build the order history page with a full orders list | US-18 | ⬜ To Do |
| T-53 | Add search and filter by order ID, customer name, or date | US-18 | ⬜ To Do |
| T-54 | Build the order detail modal (products, quantities, subtotals) | US-18 | ⬜ To Do |
| T-55 | Add `role` column to the users table (admin / employee) | US-19 | ⬜ To Do |
| T-56 | Save the assigned role when a user is created | US-19 | ⬜ To Do |
| T-57 | Implement role-based access checks on protected sections | US-19 | ⬜ To Do |
| T-58 | Display an access denied message for unauthorized roles | US-19 | ⬜ To Do |
| T-59 | Implement CSV export with all report data | US-20 | ⬜ To Do |
| T-60 | Integrate jsPDF and implement PDF report export | US-20 | ⬜ To Do |
| T-61 | Add pagination to users, products, and orders lists | US-21 | ⬜ To Do |
| T-62 | Add indexes to frequently queried columns in Supabase | US-21 | ⬜ To Do |
| T-63 | Add a global network error handler | US-22 | ⬜ To Do |
| T-64 | Add per-field validation messages to all forms | US-22 | ⬜ To Do |
| T-65 | Add a generic server error fallback message | US-22 | ⬜ To Do |

---

## Sprint Summary

| Sprint | Story Points | Cumulative SP |
|---|---|---|
| Sprint 1 | 13 SP | 13 SP |
| Sprint 2 | 5 SP | 18 SP |
| Sprint 3 | 17 SP | 35 SP |
| Sprint 4 | 5 SP | 40 SP |
| Sprint 5 | 26 SP | 66 SP |
| Sprint 6 | 8 SP | 74 SP |
| Sprint 7 | 36 SP | 110 SP |
| **Total** | **110 SP** | |

---

# Software Requirements Specification (SRS)

## Functional Requirements

| ID | Requirement |
|---|---|
| RF-01 | The system shall allow administrators to register, edit, and deactivate user accounts. |
| RF-02 | The system shall authenticate users via email and password. |
| RF-03 | The system shall enforce session-based route protection; unauthenticated users are automatically redirected to the login page. |
| RF-04 | The system shall support full CRUD operations for products, including name, price, and stock quantity. |
| RF-05 | The system shall automatically decrease product stock when a product is added to an active order. |
| RF-06 | The system shall automatically restore product stock when an order is cancelled. |
| RF-07 | The system shall prevent adding out-of-stock products to any order. |
| RF-08 | The system shall allow orders to transition through the following defined statuses only: `pending → in-progress → delivered` or `pending → cancelled`. |
| RF-09 | The system shall generate daily and date-range sales reports showing totals, order count, and top-selling products. |
| RF-10 | The system shall enforce role-based access control distinguishing between Admin and Employee roles. |
| RF-11 | The system shall allow administrators to export reports in CSV and PDF formats. |
| RF-12 | The system shall display interactive charts (bar, pie, and line) in the reports section. |

---

## Non-Functional Requirements

| ID | Category | Requirement |
|---|---|---|
| RNF-01 | Performance | Any page must fully load within 2 seconds under normal operating conditions. |
| RNF-02 | Security | All routes must be protected; passwords must be managed exclusively through the authentication service. |
| RNF-03 | Usability | The interface must be responsive and fully functional on screens with a minimum width of 768 px. |
| RNF-04 | Availability | The system must maintain 99% uptime during school operating hours. |
| RNF-05 | Scalability | Queries must apply pagination and database indexing when data sets exceed 500 records. |
| RNF-06 | Maintainability | The codebase must follow consistent naming conventions and be organized into modules by feature. |
| RNF-07 | Error Handling | All API errors must be caught and displayed to the user as clear, friendly messages. |

# Technical Summary — Chicaffe

**Project:** Chicaffe Web  
**Document Version:** 1.1  
**Date:** May 14, 2026  
**Prepared by:** Anderson Vázquez

---

## 1. Functional Requirements

Functional requirements describe **what the system must do**.

### 1.1 Authentication
- **FR-01.** The system must allow administrators to register users with name, email, and password.
- **FR-02.** The system must validate that the email is unique.
- **FR-03.** The system must display validation messages for empty fields.
- **FR-04.** The system must authenticate users using Supabase Auth.
- **FR-05.** The system must redirect users to the dashboard after successful login.
- **FR-06.** The system must allow users to log out at any time.
- **FR-07.** Protected routes must require authentication.

### 1.2 User Management
- **FR-08.** The system must allow administrators to view all registered users.
- **FR-09.** The system must allow searching users by name.

### 1.3 Products & Inventory
- **FR-10.** The system must allow creating, updating, and deleting products.
- **FR-11.** The system must manage inventory movements (SALE / RESTOCK).

### 1.4 Tables
- **FR-14.** The system must allow managing tables (table number and capacity).

### 1.5 Orders
- **FR-15.** The system must allow creating orders linked to a user and a table.
- **FR-16.** The system must allow adding products to an order.
- **FR-17.** The system must manage the order lifecycle (pending → in_progress → delivered → cancelled).
- **FR-18.** The system must decrease inventory when products are added to an order.
- **FR-19.** The system must restore inventory when an order is cancelled.
- **FR-20.** The system must prevent invalid order status transitions.

### 1.6 Reports
- **FR-21.** The system must generate daily sales reports based on delivered orders.

---

## 2. Epics and Priorities

| ID      | Epic                    | Priority   | Suggested Sprint |
|---------|-------------------------|------------|------------------|
| EP-01   | Authentication          | **High**   | Sprint 1         |
| EP-02   | User Management         | **High**   | Sprint 1         |
| EP-03   | Products & Inventory    | **High**   | Sprint 1         |
| EP-05   | Orders                  | **High**   | Sprint 2         |
| EP-04   | Tables                  | **Medium** | Sprint 2         |
| EP-06   | Reports                 | **Medium** | Sprint 3         |

---

## 3. Agile Requirements
- **AG-01.** The project must be organized into Sprints.
- **AG-02.** User Stories must follow the format: *As a [user], I want to [action], so that [benefit]*.
- **AG-03.** Each User Story must include Gherkin acceptance criteria.
- **AG-04.** Each User Story must have Story Points assigned.
- **AG-05.** Code must be version-controlled using GitHub.

---

## 4. UI/UX Requirements
- **UX-01.** Consistent visual identity.
- **UX-02.** Fully responsive design.
- **UX-03.** Sidebar navigation.
- **UX-04.** Confirmation dialogs for destructive actions.
- **UX-05.** Visual indicator for out-of-stock products.
- **UX-06.** Search bar in data tables.

---

## 5. Non-Functional Requirements
- **NFR-01.** Data must load in under 3 seconds.
- **NFR-02.** Save operations must complete in under 2 seconds.
- **NFR-03.** Passwords must be securely handled by Supabase Auth.
- **NFR-04.** The system must detect internet disconnection.
- **NFR-05.** Product price must be preserved at the time of order creation.
- **NFR-06.** The system must be built using only HTML, CSS, JavaScript, and Supabase.
- **NFR-07.** The system must run on Chromium-based browsers.

---

## 6. Data Model

```mermaid
erDiagram
    USER ||--o{ ORDER : places
    TABLE ||--o{ ORDER : assigned
    ORDER ||--|{ ORDER_DETAIL : contains
    PRODUCT ||--o{ ORDER_DETAIL : included
    PRODUCT ||--o{ INVENTORY : tracked

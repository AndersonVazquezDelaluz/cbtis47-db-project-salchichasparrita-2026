# Sprint Backlog — Chicaffe

**Project:** Chicaffe - Cafeteria Management System  
**Repository:** `cbtis47-db-project-salchichasparrita-2026`  
**Stack:** Node.js · Express · MySQL · HTML/CSS/JavaScript  
**Team:** Anderson Vázquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras  
**Version:** 2.0 | **Date:** May 28, 2026

**Total Project Capacity:** 112 hours (7 sprints × 16 hours)

---

### SPRINT 1 — Authentication (EP-01)

**Sprint Goal**  
Implement a secure authentication system that allows user registration, login, logout, and route protection, providing a solid security foundation for the entire application.

**General Weekly Parameters**
- **Sprint Duration:** 2 weeks
- **Team Capacity:** 16 hours
- **Weekly Availability:** 8 hours per week
- **Roles Involved:** Anderson Vázquez (Backend), Axel de la Cruz (Frontend)
- **Tools & Technologies:** Node.js, Express, MySQL, bcrypt, JWT, Postman
- **Constraints / Dependencies:** MySQL database must be configured

**User Stories from Product Backlog**

| US    | User Story | Priority | Estimation (hours) | Acceptance Criteria |
|-------|------------|----------|--------------------|---------------------|
| US-01 | As an Administrator, I want to register new users (name, email, password, role) so that staff can access the system. | High | 5h | Successful registration, hashed password, unique email, field validation |
| US-02 | As a Registered User, I want to log in with email and password so that I can access the dashboard. | High | 4h | Successful login with JWT, clear error messages, correct redirection |
| US-03 | As an Authenticated User, I want to log out so that I can securely end my session. | High | 3h | Token invalidated, redirection to login |
| US-04 | As an Administrator, I want protected routes so that unauthorized access is prevented. | High | 4h | Authentication middleware working on all protected routes |

**Tasks**

| Task | Task Name | Hours | Status | US |
|------|-----------|-------|--------|----|
| T-01 | Create `users` table in MySQL |  2 | ✅ Done | US-01 |
| T-02 | Implement POST `/api/auth/register` endpoint + bcrypt |  2 | ⬜ To Do | US-01 |
| T-03 | Create registration form (HTML + Fetch) |  1.5 | ⬜ To Do | US-01 |
| T-04 | Implement POST `/api/auth/login` endpoint + JWT | 2 | ⬜ To Do | US-02 |
| T-05 | Create login form + error handling |  1.5 | ⬜ To Do | US-02 |
| T-06 | Implement logout + auth middleware | 2 | ⬜ To Do | US-03/US-04 |
| T-07 | Protect dashboard routes |  2 | ⬜ To Do | US-04 |
| T-08 | Functional testing and bug fixing  | 3 | ⬜ To Do | All |

**Tasks Through Time**
- **Week 1 (8 hours):** T-01 to T-04 → Registration and basic login
- **Week 2 (8 hours):** T-05 to T-08 → Logout and full protection

**Definition of Done**
- Code implemented and clean
- Manual tests passed
- Works in local environment
- Endpoints documented
- Product Owner approval
- No critical security errors

---

### SPRINT 2 — User Management (EP-02)

**Sprint Goal**  
Enable the administrator to manage system users (view, edit, and delete), improving administrative control.

**General Weekly Parameters**
- **Sprint Duration:** 2 weeks
- **Team Capacity:** 16 hours
- **Weekly Availability:** 8 hours per week
- **Roles Involved:** Anderson Vázquez (Backend), Axel de la Cruz (Frontend)
- **Tools & Technologies:** Node.js, Express, MySQL, JWT
- **Constraints / Dependencies:** Sprint 1 (Authentication) must be completed

**User Stories**

| US    | User Story | Priority | Estimation (hours) | Acceptance Criteria |
|-------|------------|----------|--------------------|---------------------|
| US-05 | As an Administrator, I want to view the list of users so that I can manage staff. | High | 5h | Complete or paginated list with filters |
| US-06 | As an Administrator, I want to edit or delete users so that information stays updated. | High | 6h | Secure update and deletion with confirmation |

**Tasks** (Summary)
- Backend endpoints (GET, PUT, DELETE users)
- Frontend user list and management pages
- Role-based access validation
- Error handling and user feedback

**Tasks Through Time**
- **Week 1:** Backend development
- **Week 2:** Frontend integration and testing

**Definition of Done**
- Full CRUD functionality
- Only accessible by administrators
- Responsive interface
- Tested and approved

---

### SPRINT 3 — Products & Inventory (EP-03)

**Sprint Goal**  
Implement complete product and inventory management to control the cafeteria’s offerings.

**General Weekly Parameters**
- **Sprint Duration:** 2 weeks
- **Team Capacity:** 16 hours
- **Roles Involved:** Anderson, Axel, Jayden Reyes
- **Technologies:** Node.js, Express, MySQL

**User Stories**

| US    | User Story | Priority | Estimation (hours) | Acceptance Criteria |
|-------|------------|----------|--------------------|---------------------|
| US-07 | As an Administrator, I want to create products so they can be offered in the cafeteria. | High | 5h | Name, price, stock, category |
| US-08 | As an Administrator, I want to edit or delete products. | High | 4h | Real-time updates |
| US-09 | As an Administrator, I want to restock inventory. | High | 4h | Stock quantity update |
| US-10 | As a User, I want to see when a product is out of stock. | Medium | 3h | Clear visual indicator |

**Definition of Done**
- Complete CRUD for products
- Inventory updated correctly
- Visual indicators working

---

### SPRINT 4 — Tables (EP-04)

**Sprint Goal**  
Manage cafeteria tables (CRUD) to better organize the physical space.

**User Stories**
- US-11: As an Administrator, I want to manage tables (create, assign number, status: available/occupied).

**Total Capacity:** 16 hours

---

### SPRINT 5 — Orders (EP-05)

**Sprint Goal**  
Implement the complete order flow: create orders, add products, change status, and cancel with inventory restoration.

**User Stories**
- US-12: Create Order
- US-13: Add Products to Order
- US-14: Change Order Status
- US-15: Cancel Order and Restore Inventory

**Total Capacity:** 16 hours

---

### SPRINT 6 — Reports (EP-06)

**Sprint Goal**  
Generate basic daily sales reports for financial control.

**User Stories**
- US-16: Generate Daily Sales Report

**Total Capacity:** 16 hours

---

### SPRINT 7 — Enhancements & Polish (EP-07)

**Sprint Goal**  
Improve user experience, add advanced reports, and polish the system for final delivery.

**User Stories**
- US-17: Advanced Sales Reports with Charts
- US-18: Responsive Design Improvements
- US-19: Better Error Handling
- US-20: Performance Optimization
- US-21: Role-Based Access Control (RBAC)
- US-22: Final Polish and Documentation

**Total Capacity:** 16 hours

---

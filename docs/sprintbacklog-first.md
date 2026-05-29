# Sprint Backlog — Chicaffe · First Partial

**Project:** Chicaffe - Cafeteria Management System  
**Repository:** `cbtis47-db-project-salchichasparrita-2026`  
**Stack:** Node.js · Express · MySQL · HTML/CSS/JavaScript  
**Team:** Anderson Vázquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras  
**Version:** 2.1 | **Date:** May 29, 2026

---

## Partial Overview

| Sprint | Name                    | Epic   | User Stories               | Story Points |
|--------|-------------------------|--------|----------------------------|--------------|
| Sprint 1 | Authentication         | EP-01  | US-01, US-02, US-03, US-04 | 14 SP |
| Sprint 2 | User Management        | EP-02  | US-05, US-06               | 8 SP |
| Sprint 3 | Products & Inventory   | EP-03  | US-07, US-08, US-09, US-10 | 18 SP |
| **Total** |                      |        |                            | **40 SP** |

**Partial Duration:** 4 weeks  
**Real Available Hours:** 8h/week × 4 = 32 hours  
**Estimated Hours (with buffer):** ~50 hours

---

## SPRINT 1 — Authentication (EP-01)

**Sprint Goal**  
Implement a secure authentication system with user registration, login, logout, and route protection using JWT + bcrypt.

**Roles:** Anderson Vázquez (Backend), Axel de la Cruz (Frontend)

**User Stories**

| US    | User Story | Priority | SP | Acceptance Criteria |
|-------|------------|----------|----|---------------------|
| US-01 | As an Administrator, I want to register new users (name, email, password, role) | High | 5 | Successful registration, hashed password, unique email, field validation |
| US-02 | As a Registered User, I want to log in with email and password | High | 4 | Successful login with JWT, clear error messages, correct redirection |
| US-03 | As an Authenticated User, I want to log out | High | 2 | Token invalidated on client side, redirection to login |
| US-04 | As an Authenticated User, I want protected routes | High | 3 | Authentication middleware working on all protected routes |

**Tasks**

| #   | Task | Hours | US    | Assigned to      | Status     |
|-----|------|-------|-------|------------------|------------|
| T-01 | Create `users` table in MySQL | 2 | US-01 | Anderson | Done |
| T-02 | Implement POST `/api/auth/register` endpoint + bcrypt | 3 | US-01 | Anderson | To Do |
| T-03 | Create registration form (HTML + Fetch) with validations | 2 | US-01 | Axel | To Do |
| T-04 | Implement POST `/api/auth/login` endpoint + JWT | 3 | US-02 | Anderson | To Do |
| T-05 | Create login form + error handling | 2 | US-02 | Axel | To Do |
| T-06 | Implement logout functionality (clear token) | 1.5 | US-03 | Axel | To Do |
| T-07 | Create authentication middleware (`authMiddleware.js`) | 2 | US-04 | Anderson | To Do |
| T-08 | Protect dashboard and admin routes | 2 | US-04 | Anderson | To Do |
| T-09 | Functional testing and bug fixing | 3 | All | Team | To Do |

**Weekly Plan:**
- **Week 1:** T-01 to T-04 (Registration + Basic Login)
- **Week 2:** T-05 to T-09 (Logout + Full Protection)

---

## SPRINT 2 — User Management (EP-02)

**Sprint Goal**  
Allow the administrator to view, edit, and delete system users.

**User Stories**

| US    | User Story | Priority | SP |
|-------|------------|----------|----|
| US-05 | As an Administrator, I want to view the list of users | High | 4 |
| US-06 | As an Administrator, I want to edit or delete users | High | 4 |

---

## SPRINT 3 — Products & Inventory (EP-03)

**Sprint Goal**  
Implement complete product and inventory management for the cafeteria.

**User Stories**

| US    | User Story | Priority | SP |
|-------|------------|----------|----|
| US-07 | As an Administrator, I want to create products | High | 5 |
| US-08 | As an Administrator, I want to edit or delete products | High | 5 |
| US-09 | As an Administrator, I want to restock inventory | High | 5 |
| US-10 | As a User, I want to see when a product is out of stock | Medium | 3 |

---

## Definition of Done (First Partial)

- Clean and well-commented code
- Endpoints properly documented
- Manual tests completed
- Fully functional in local environment (XAMPP)
- No critical security issues
- Approved by the team and professor

---

**Current Status:** In Progress

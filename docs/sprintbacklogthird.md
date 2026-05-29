# Sprint Backlog — Chicaffe · Third Partial

**Project:** Chicaffe - Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Stack:** HTML · CSS · JavaScript · Supabase
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 1.2 | **Date:** May 14, 2026

---

## Partial Overview

| Sprint | Name | Epic | User Stories | Story Points |
|---|---|---|---|---|
| Sprint 7 | Enhancements & Polish | EP-07 | US-17 to US-22 | 36 SP |
| | **Total** | | | **36 SP** |

**Partial Duration:** 4 weeks
**Available Hours:** 8h/week × 4 weeks = 32 real hours
**Expected Hours (with buffer):** ~52h — this partial integrates all previous work; integration issues and polish take more time than expected

---

## Sprint 7 — Enhancements & Polish `EP-07`

**Sprint Goal:** Elevate the system with advanced analytics, role-based access control, export capabilities, and production-grade reliability.

**Time Estimate**
- Real availability: ~32h
- Expected with buffer: ~52h
- Suggested weeks: Weeks 1–4 (full partial, parallel tracks recommended)

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

| # | Task | US | Assigned To | Status |
|---|---|---|---|---|
| T-48 | Add a date range picker to the reports page | US-17 | Axel de la Cruz | ⬜ To Do |
| T-49 | Filter report queries by the selected date range | US-17 | Jayden Reyes | ⬜ To Do |
| T-50 | Integrate Chart.js and render a bar chart (sales by day) | US-17 | Axel de la Cruz | ⬜ To Do |
| T-51 | Add a pie chart (top products) and a line chart (sales trend) | US-17 | Axel de la Cruz | ⬜ To Do |
| T-52 | Build the order history page with a full orders list | US-18 | Jayden Reyes | ⬜ To Do |
| T-53 | Add search and filter by order ID, customer name, or date | US-18 | Jayden Reyes | ⬜ To Do |
| T-54 | Build the order detail modal (products, quantities, subtotals) | US-18 | Axel de la Cruz | ⬜ To Do |
| T-55 | Add `role` column to the users table (admin / employee) | US-19 | Matthew Venegas | ⬜ To Do |
| T-56 | Save the assigned role when a user is created | US-19 | Anderson Vazquez | ⬜ To Do |
| T-57 | Implement role-based access checks on protected sections | US-19 | Anderson Vazquez | ⬜ To Do |
| T-58 | Display an access denied message for unauthorized roles | US-19 | Anuar Contreras | ⬜ To Do |
| T-59 | Implement CSV export with all report data | US-20 | Jayden Reyes | ⬜ To Do |
| T-60 | Integrate jsPDF and implement PDF report export | US-20 | Matthew Venegas | ⬜ To Do |
| T-61 | Add pagination to users, products, and orders lists | US-21 | Matthew Venegas | ⬜ To Do |
| T-62 | Add indexes to frequently queried columns in Supabase | US-21 | Matthew Venegas | ⬜ To Do |
| T-63 | Add a global network error handler | US-22 | Anderson Vazquez | ⬜ To Do |
| T-64 | Add per-field validation messages to all forms | US-22 | Anuar Contreras | ⬜ To Do |
| T-65 | Add a generic server error fallback message | US-22 | Anuar Contreras | ⬜ To Do |

---

## Suggested Week-by-Week Plan

| Week | Focus | Tasks |
|---|---|---|
| Week 1 | Roles & Permissions + Error Handling | T-55 to T-58, T-63 to T-65 |
| Week 2 | Advanced Reports + Charts | T-48 to T-51 |
| Week 3 | Order History + Export | T-52 to T-54, T-59, T-60 |
| Week 4 | Performance + Final Polish & Testing | T-61, T-62 + integration testing |

---

## Definition of Done

- Code implemented and tested locally
- No critical bugs open
- Feature approved by the team
- Tasks moved to ✅ Done in the board
- Final system demo ready for delivery

---

## Team

| Member | Role |
|---|---|
| Anderson Vazquez | Analyst & Designer |
| Jayden Reyes | SQL Developer |
| Matthew Venegas | Database Administrator |
| Axel de la Cruz | Query Master |
| Anuar Contreras | SQL Tester |

# Sprint Backlog — Chicaffe · Third Partial

**Project:** Chicaffe - Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Stack:** Node.js · Express · MySQL · HTML/CSS/JavaScript
**Version:** 2.1 | **Date:** May 29, 2026
**Status:** In Progress

---


## Key Technical Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Chart library | Chart.js (CDN) | Lightweight, zero-dependency, integrates directly with existing HTML/JS stack |
| PDF export | jsPDF | Client-side generation avoids server overhead; streams directly to download |
| RBAC | `role` ENUM column + Express middleware | Single column (admin/employee) on users table; middleware intercepts protected routes before granting access |
| Performance | Server-side pagination + MySQL indexes | Limits query payload to current page; indexes on date, user_id, status keep response time under 2 s |
| Error handling | Global fetch wrapper + inline validation | Intercepts network failures; form validation runs client-side before any request, preserving input state |
| CSV export | Node.js / Express `res.download()` | Server-side generation ensures full dataset fidelity regardless of client pagination state |

---

## SPRINT 7 — Enhancements & Polish (EP-07)

**Sprint Goal:** Improve user experience, add advanced features, implement role-based access control, and polish the system for final delivery.

---

## User Stories & Acceptance Criteria

| US | User Story | Priority | SP | Scenario | Given | When | Then |
|----|------------|----------|----|----------|-------|------|------|
| US-17 | As an Administrator, I want advanced sales reports with charts | Medium | 8 | Date range filter | Admin is on the reports page | Valid start/end dates are selected and report is generated | System displays total sales, order count, and top-selling products for the period |
| | | | | Interactive charts | A report has been generated for a date range | Report results are displayed | Bar chart (sales by day), pie chart (top products), and line chart (cumulative trend) are rendered |
| | | | | No data in range | No orders exist in the selected range | Report is generated | Message "No sales data available for the selected period" is shown; no charts are rendered |
| US-18 | As an Administrator, I want to view order history with search and filters | Medium | 6 | Display all orders | Admin accesses the order history page | Page finishes loading | All past orders appear in a table with date, table, total, and status |
| | | | | Search & filter | Order history table is loaded | Admin enters a value (order ID, customer name, or date) in the search field | Table filters in real time; only matching records are shown |
| | | | | Order detail | A specific order exists in the history | Admin selects that order | Detail view shows all products, quantities, unit prices, and subtotal |
| US-19 | As an Administrator, I want role-based access control (RBAC) | **High** | 8 | Role assignment | Admin is completing the user registration form | A role (Administrator or Employee) is selected and form is submitted | Role is saved to the database and visible in the user's profile |
| | | | | Employee restriction | A user with role "Employee" is logged in | User attempts to navigate to user management or reports | Access is denied; message "You do not have permission to access this section" is displayed |
| | | | | Admin full access | A user with role "Administrator" is logged in | User navigates to any section | Full access is granted; all features and data are accessible |
| US-20 | As an Administrator, I want to export reports (PDF and CSV) | Medium | 5 | CSV export | A report has been generated and contains data | Admin clicks "Export CSV" | A .csv file with all records and column headers is downloaded |
| | | | | PDF export | A report has been generated and contains data | Admin clicks "Export PDF" | A formatted .pdf with report title, generation date, and all data rows is downloaded |
| | | | | Export disabled | Reports page loaded but no report generated | Admin attempts to click an export button | Both export buttons are disabled; message "Generate a report before exporting" is shown |
| US-21 | As a Developer, I want performance optimization | Medium | 5 | Page load time | System is under normal load | User navigates to any page | Page is fully rendered and interactive within 2 seconds |
| | | | | Pagination for large sets | System contains more than 500 records in any table | User loads a list of users, products, or orders | Server-side pagination is applied; only current-page records load; navigation controls are available |
| US-22 | As a User, I want better error handling and user feedback | Medium | 4 | Network error | User is performing any action | Request fails due to no internet connection | Message "Connection error. Please check your internet connection." is shown; data is preserved; retry option is provided |
| | | | | Form validation | User is submitting any form | Form is submitted with invalid or incomplete data | Submission halts; specific validation messages appear next to each invalid field; form stays populated |
| | | | | Server error | User triggers an unhandled server-side exception | System receives an error response | Message "An unexpected error occurred. Please try again later." is shown; error is logged internally; UI remains stable |

**Total: 36 SP**

---

## Tasks

| # | Task | US | Priority | Assignee | Est. h | Real h | Status |
|---|------|----|----------|----------|--------|--------|--------|
| T-45 | Add date range picker to reports page | US-17 | Medium | Anderson Vázquez | 2 h | — | ⬜ To Do |
| T-46 | Filter report queries by the selected date range | US-17 | Medium | Jayden Reyes | 3 h | — | ⬜ To Do |
| T-47 | Integrate Chart.js and render a bar chart (sales by day) | US-17 | Medium | Anderson Vázquez | 3 h | — | ⬜ To Do |
| T-48 | Add a pie chart (top products) and a line chart (sales trend) | US-17 | Medium | Anderson Vázquez | 2 h | — | ⬜ To Do |
| T-49 | Build order history page with a full orders list | US-18 | Medium | Axel de la Cruz | 3 h | — | ⬜ To Do |
| T-50 | Add search and filter by order ID, customer name, or date | US-18 | Medium | Axel de la Cruz | 2 h | — | ⬜ To Do |
| T-51 | Build the order detail modal (products, quantities, subtotals) | US-18 | Medium | Jayden Reyes | 2 h | — | ⬜ To Do |
| T-52 | Add `role` column to the users table (admin / employee) | US-19 | **High** | Matthew Venegas | 1 h | — | ⬜ To Do |
| T-53 | Save the assigned role when a user is created | US-19 | **High** | Jayden Reyes | 2 h | — | ⬜ To Do |
| T-54 | Implement role-based access checks on protected sections | US-19 | **High** | Jayden Reyes | 3 h | — | ⬜ To Do |
| T-55 | Display an access denied message for unauthorized roles | US-19 | **High** | Anuar Contreras | 1 h | — | ⬜ To Do |
| T-56 | Implement CSV export with all report data | US-20 | Medium | Axel de la Cruz | 2 h | — | ⬜ To Do |
| T-57 | Integrate jsPDF and implement PDF report export | US-20 | Medium | Anderson Vázquez | 2 h | — | ⬜ To Do |
| T-58 | Add pagination to users, products, and orders lists | US-21 | Medium | Matthew Venegas | 2 h | — | ⬜ To Do |
| T-59 | Add indexes to frequently queried columns in the database | US-21 | Medium | Matthew Venegas | 2 h | — | ⬜ To Do |
| T-60 | Add a global network error handler | US-22 | Medium | Anuar Contreras | 2 h | — | ⬜ To Do |
| T-61 | Add per-field validation messages to all forms | US-22 | Medium | Anuar Contreras | 2 h | — | ⬜ To Do |
| T-62 | Add a generic server error fallback message | US-22 | Medium | Anuar Contreras | 1 h | — | ⬜ To Do |
| T-63 | Final testing, bug fixing and UI polish | All | **High** | All team | 5 h | — | ⬜ To Do |

**Total estimated hours: 42 h · With buffer: ~52 h**

---

## Week-by-Week Plan

| Week | Focus | Tasks | Assignees |
|------|-------|-------|-----------|
| Week 1 | Roles & Permissions + Error Handling | T-52, T-53, T-54, T-55, T-60, T-61, T-62 | Matthew Venegas (T-52) · Jayden Reyes (T-53, T-54) · Anuar Contreras (T-55, T-60, T-61, T-62) |
| Week 2 | Advanced Reports + Charts | T-45, T-46, T-47, T-48 | Anderson Vázquez (T-45, T-47, T-48) · Jayden Reyes (T-46) |
| Week 3 | Order History + Export | T-49, T-50, T-51, T-56, T-57 | Axel de la Cruz (T-49, T-50, T-56) · Jayden Reyes (T-51) · Anderson Vázquez (T-57) |
| Week 4 | Performance + Final Polish & Testing | T-58, T-59, T-63 | Matthew Venegas (T-58, T-59) · All team (T-63) |

---

## Definition of Done

- [ ] Clean and well-commented code
- [ ] All features fully functional
- [ ] Responsive and polished user interface
- [ ] Proper error handling and user feedback
- [ ] Performance optimizations applied
- [ ] Complete documentation
- [ ] System ready for final presentation
- [ ] Approved by the team and professor

---

**Current Status:**  In Progress

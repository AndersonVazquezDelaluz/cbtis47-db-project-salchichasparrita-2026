# Sprint Backlog — Chicaffe · Third Partial

**Project:** Chicaffe - Cafeteria Management System
**Repository:** `cbtis47-db-project-salchichasparrita-2026`
**Stack:** Node.js · Express · MySQL · HTML/CSS/JavaScript
**Team:** Anderson Vázquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras
**Version:** 2.1 | **Date:** May 29, 2026

---

## Partial Overview

| Sprint | Name | Epic | User Stories | Story Points |
|--------|------|------|--------------|--------------|
| Sprint 7 | Enhancements & Polish | EP-07 | US-17 to US-22 | 36 SP |
| **Total** | | | | **36 SP** |

**Partial Duration:** 4 weeks
**Real Available Hours:** 8h/week × 4 = 32 hours
**Estimated Hours (with buffer):** ~52 hours

---

## SPRINT 7 — Enhancements & Polish (EP-07)

**Sprint Goal**
Improve user experience, add advanced features, implement role-based access control, and polish the system for final delivery.

---

### User Stories

| US | User Story | Priority | SP |
|---|------------|----------|----|
| US-17 | As an Administrator, I want advanced sales reports with charts | Medium | 8 |
| US-18 | As an Administrator, I want to view order history with search and filters | Medium | 6 |
| US-19 | As an Administrator, I want role-based access control (RBAC) | High | 8 |
| US-20 | As an Administrator, I want to export reports (PDF and CSV) | Medium | 5 |
| US-21 | As a Developer, I want performance optimization | Medium | 5 |
| US-22 | As a User, I want better error handling and user feedback | Medium | 4 |

---

### Acceptance Criteria

#### US-17 · Advanced Sales Reports with Charts

```gherkin
  Scenario: Successful report generation using a date range filter
    Given the administrator is on the reports page
    When a valid start date and end date are selected and the report is generated
    Then the system must display the total sales amount, the number of orders,
    and the top-selling products for the specified period

  Scenario: Interactive charts rendered upon report generation
    Given a report has been successfully generated for a specified date range
    When the report results are displayed
    Then the system must render a bar chart representing sales aggregated by day
    And the system must render a pie chart representing the distribution of top-selling products
    And the system must render a line chart representing the cumulative sales trend over the period

  Scenario: Report generation for a date range with no recorded data
    Given no orders exist within the selected date range
    When the report is generated
    Then the system must display the message "No sales data available for the selected period"
    And no charts must be rendered
```

---

#### US-18 · Order History and Search

```gherkin
  Scenario: Successful display of all past orders
    Given the administrator accesses the order history page
    When the page finishes loading
    Then the system must display all past orders in a structured table
    And each record must include the order date, assigned table, total amount, and current status

  Scenario: Search and filter order history records
    Given the order history table is fully loaded
    When the administrator enters a value in the search field using an order ID, customer name, or date
    Then the system must filter the table in real time
    And only records matching the search criteria must be displayed

  Scenario: View detailed information for a specific order
    Given a specific order record exists in the order history
    When the administrator selects that order
    Then the system must display a detailed view containing all products, their quantities,
    unit prices, and the order subtotal
```

---

#### US-19 · User Roles and Permissions

```gherkin
  Scenario: Role assignment during user account creation
    Given the administrator is completing the user registration form
    When a role is selected from the available options (Administrator or Employee)
    and the form is submitted
    Then the system must save the assigned role in association with the user account in the database
    And the role must be visible in the user's profile within the users list

  Scenario: Role-based access restriction for the Employee role
    Given a user with an assigned role of "Employee" is authenticated and logged in
    When the user attempts to navigate to the user management or reports sections
    Then the system must deny access to those sections
    And the system must display the message "You do not have permission to access this section"

  Scenario: Unrestricted access for the Administrator role
    Given a user with an assigned role of "Administrator" is authenticated and logged in
    When the user navigates to any section of the system
    Then the system must grant full access without restrictions
    And all administrative features and data must be accessible
```

---

#### US-20 · Export Reports (PDF / CSV)

```gherkin
  Scenario: Successful export of a report to CSV format
    Given a report has been successfully generated and contains data
    When the administrator clicks the "Export CSV" button
    Then the system must generate and download a .csv file containing all report records
    And the file must include column headers corresponding to the report fields

  Scenario: Successful export of a report to PDF format
    Given a report has been successfully generated and contains data
    When the administrator clicks the "Export PDF" button
    Then the system must generate and download a formatted .pdf file containing the complete report
    And the file must include the report title, generation date, and all data rows

  Scenario: Export attempt when no report data is available
    Given the reports page has been loaded but no report has been generated
    When the administrator attempts to click an export button
    Then the system must disable both export buttons
    And the system must display the message "Generate a report before exporting"
```

---

#### US-21 · Performance Optimization

```gherkin
  Scenario: Page load time under normal operating conditions
    Given the system is operating under normal load conditions
    When a user navigates to any page within the system
    Then the page must be fully rendered and interactive within 2 seconds

  Scenario: Paginated data retrieval for large record sets
    Given the system contains more than 500 records in any given data table
    When a user loads a list of users, products, or orders
    Then the system must apply server-side pagination to the query
    And the system must load only the records for the current page without performance degradation
    And navigation controls must be available to access additional pages
```

---

#### US-22 · Improved Error Handling

```gherkin
  Scenario: Network connection error during any system operation
    Given the user is performing any action within the system
    When the request fails due to the absence of an internet connection
    Then the system must display the message "Connection error. Please check your internet connection."
    And the system must not lose any data the user was working with
    And the system must provide an option to retry the failed operation

  Scenario: Form validation error on submission
    Given a user is completing any form within the system
    When the form is submitted with incorrect, incomplete, or invalid data
    Then the system must halt the submission
    And the system must display specific and descriptive validation messages adjacent to each invalid field
    And the form must remain populated with the data the user had entered

  Scenario: Unexpected server-side error
    Given a user has triggered an operation that causes an unhandled server-side exception
    When the system receives an error response from the server
    Then the system must display the message "An unexpected error occurred. Please try again later."
    And the system must log the error details internally for diagnostic purposes
    And the user interface must remain stable and functional
```

---

### Tasks

| # | Task | Hours | US | Status |
|---|------|-------|---|--------|
| T-45 | Add date range picker to reports page | 2 | US-17 | ⬜ To Do |
| T-46 | Filter report queries by the selected date range | 3 | US-17 | ⬜ To Do |
| T-47 | Integrate Chart.js and render a bar chart (sales by day) | 3 | US-17 | ✅ Done |
| T-48 | Add a pie chart (top products) and a line chart (sales trend) | 2 | US-17 | ⬜ To Do |
| T-49 | Build order history page with a full orders list | 3 | US-18 | ✅ Done |
| T-50 | Add search and filter by order ID, customer name, or date | 2 | US-18 | ⬜ To Do |
| T-51 | Build the order detail modal (products, quantities, subtotals) | 2 | US-18 | ⬜ To Do |
| T-52 | Add `role` column to the users table (admin / employee) | 1 | US-19 | ⬜ To Do |
| T-53 | Save the assigned role when a user is created | 2 | US-19 | ⬜ To Do |
| T-54 | Implement role-based access checks on protected sections | 3 | US-19 | ⬜ To Do |
| T-55 | Display an access denied message for unauthorized roles | 1 | US-19 | ⬜ To Do |
| T-56 | Implement CSV export with all report data | 2 | US-20 | ⬜ To Do |
| T-57 | Integrate jsPDF and implement PDF report export | 2 | US-20 | ⬜ To Do |
| T-58 | Add pagination to users, products, and orders lists | 2 | US-21 | ✅ Done |
| T-59 | Add indexes to frequently queried columns in the database | 2 | US-21 | ✅ Done |
| T-60 | Add a global network error handler | 2 | US-22 | ⬜ To Do |
| T-61 | Add per-field validation messages to all forms | 2 | US-22 | ⬜ To Do |
| T-62 | Add a generic server error fallback message | 1 | US-22 | ⬜ To Do |
| T-63 | Final testing, bug fixing and UI polish | 5 | All | ⬜ To Do |

---

## Suggested Week-by-Week Plan

| Week | Focus | Tasks |
|---|---|---|
| Week 1 | Roles & Permissions + Error Handling | T-52 to T-55, T-60 to T-62 |
| Week 2 | Advanced Reports + Charts | T-45 to T-48 |
| Week 3 | Order History + Export | T-49 to T-51, T-56, T-57 |
| Week 4 | Performance + Final Polish & Testing | T-58, T-59, T-63 |

---

## Definition of Done (Third Partial)

- Clean and well-commented code
- All features fully functional
- Responsive and polished user interface
- Proper error handling and user feedback
- Performance optimizations applied
- Complete documentation
- System ready for final presentation
- Approved by the team and professor

---

**Current Status:** In Progress

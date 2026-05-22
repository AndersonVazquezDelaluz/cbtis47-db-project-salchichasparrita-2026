🏃 Sprint Backlog — Chicaffe
Project: Chicaffe - Cafeteria Management System Repository: cbtis47-db-project-salchichasparrita-2026 Stack: HTML · CSS · JavaScript · Supabase Team: Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras Version: 1.2 | Date: May 14, 2026
📊 Sprint Overview
Sprint Name Epic Partial User Stories Story Points Sprint 1 Authentication EP-01 1st Partial US-01, US-02, US-03, US-04 13 SP Sprint 2 User Management EP-02 1st Partial US-05, US-06 5 SP Sprint 3 Products & Inventory EP-03 1st Partial US-07, US-08, US-09, US-10 17 SP Sprint 4 Tables EP-04 2nd Partial US-11 5 SP Sprint 5 Orders EP-05 2nd Partial US-12, US-13, US-14, US-15 26 SP Sprint 6 Reports EP-06 2nd Partial US-16 8 SP Sprint 7 Enhancements & Polish EP-07 3rd Partial US-17, US-18, US-19, US-20, US-21, US-22 36 SP
🟦 FIRST PARTIAL
Sprint 1 — Authentication EP-01
Sprint Goal: Enable secure access to the system through registration, login, logout, and protected routes.
US Title Story Points Priority US-01 User Registration by Administrator 5 SP High US-02 User Login 3 SP High US-03 Logout 2 SP High US-04 Protected Routes 3 SP High Total 13 SP
Tasks
# Task US Status T-01 Set up Supabase Auth project and credentials US-01 ⬜ To Do T-02 Build registration form (name, email, password) US-01 ⬜ To Do T-03 Connect registration form to Supabase Auth US-01 ⬜ To Do T-04 Add duplicate email and empty field validations US-01 ⬜ To Do T-05 Build login form (email, password) US-02 ⬜ To Do T-06 Connect login form to Supabase Auth US-02 ⬜ To Do T-07 Handle invalid credentials error message US-02 ⬜ To Do T-08 Implement logout button and session termination US-03 ⬜ To Do T-09 Redirect to login page after logout US-03 ⬜ To Do T-10 Create route guard / session check function US-04 ⬜ To Do T-11 Redirect unauthenticated users to login US-04 ⬜ To Do
Sprint 2 — User Management EP-02
Sprint Goal: Provide admins with full visibility and searchability over registered system users.
US Title Story Points Priority US-05 View Users List 3 SP High US-06 Search Users by Name 2 SP Medium Total 5 SP
Tasks
# Task US Status T-12 Query all users from Supabase and render in table US-05 ⬜ To Do T-13 Style users table (name, email, role, status columns) US-05 ⬜ To Do T-14 Add search input field to users page US-06 ⬜ To Do T-15 Implement real-time filter by name on user list US-06 ⬜ To Do
Sprint 3 — Products & Inventory EP-03
Sprint Goal: Give admins full CRUD control over products and maintain accurate real-time inventory.
US Title Story Points Priority US-07 Create Product 5 SP High US-08 Edit and Delete Product 5 SP High US-09 Restock Inventory 5 SP High US-10 Out of Stock Visual Indicator 2 SP Medium Total 17 SP
Tasks
# Task US Status T-16 Create products table in Supabase (name, price, stock) US-07 ⬜ To Do T-17 Build new product form and connect to Supabase US-07 ⬜ To Do T-18 Render products list on admin page US-07 ⬜ To Do T-19 Build edit product modal with pre-filled data US-08 ⬜ To Do T-20 Implement update product in Supabase US-08 ⬜ To Do T-21 Implement delete product with confirmation dialog US-08 ⬜ To Do T-22 Build restock form (add quantity to existing stock) US-09 ⬜ To Do T-23 Update stock value in Supabase on restock US-09 ⬜ To Do T-24 Add "Out of Stock" badge when stock = 0 US-10 ⬜ To Do T-25 Disable add-to-order button when product is out of stock US-10 ⬜ To Do
🟩 SECOND PARTIAL
Sprint 4 — Tables EP-04
Sprint Goal: Allow admins to manage physical cafeteria tables to support order assignment.
US Title Story Points Priority US-11 Tables Management (CRUD) 5 SP Medium Total 5 SP
Tasks
# Task US Status T-26 Create tables table in Supabase (number, capacity, status) US-11 ⬜ To Do T-27 Build create table form US-11 ⬜ To Do T-28 Render tables list on admin page US-11 ⬜ To Do T-29 Implement edit table functionality US-11 ⬜ To Do T-30 Implement delete table with confirmation US-11 ⬜ To Do
Sprint 5 — Orders EP-05
Sprint Goal: Enable employees to fully manage the lifecycle of customer orders with automatic inventory control.
US Title Story Points Priority US-12 Create Order 5 SP High US-13 Add Products to Order 8 SP High US-14 Change Order Status 5 SP High US-15 Cancel Order and Restore Inventory 8 SP High Total 26 SP
Tasks
# Task US Status T-31 Create orders table in Supabase (user, table, status, date) US-12 ⬜ To Do T-32 Build new order form (select user and table) US-12 ⬜ To Do T-33 Save new order with status "pending" US-12 ⬜ To Do T-34 Create order_items table (order_id, product_id, quantity) US-13 ⬜ To Do T-35 Build add-product-to-order UI US-13 ⬜ To Do T-36 Deduct stock automatically when product is added US-13 ⬜ To Do T-37 Block adding out-of-stock products with error message US-13 ⬜ To Do T-38 Build order status selector (pending / in-progress / delivered) US-14 ⬜ To Do T-39 Validate allowed status transitions US-14 ⬜ To Do T-40 Block invalid transitions and show error message US-14 ⬜ To Do T-41 Implement cancel order action US-15 ⬜ To Do T-42 Restore stock of each product on cancellation US-15 ⬜ To Do
Sprint 6 — Reports EP-06
Sprint Goal: Provide administrators with actionable daily sales insights.
US Title Story Points Priority US-16 Daily Sales Report 8 SP Medium Total 8 SP
Tasks
# Task US Status T-43 Query delivered orders filtered by selected date US-16 ⬜ To Do T-44 Calculate total sales and order count US-16 ⬜ To Do T-45 Render report table (product, qty sold, subtotal) US-16 ⬜ To Do T-46 Show "No sales data" message when no results found US-16 ⬜ To Do
🟨 THIRD PARTIAL
Sprint 7 — Enhancements & Polish EP-07
Sprint Goal: Elevate the system with advanced analytics, role-based security, export capabilities, and production-grade reliability.
US Title Story Points Priority US-17 Advanced Sales Reports with Charts 8 SP Medium US-18 Order History and Search 6 SP Medium US-19 User Roles and Permissions 8 SP High US-20 Export Reports (PDF / CSV) 5 SP Medium US-21 Performance Optimization 5 SP Medium US-22 Improved Error Handling 4 SP Medium Total 36 SP
Tasks
# Task US Status T-47 Add date range picker to reports page US-17 ⬜ To Do T-48 Filter report queries by selected date range US-17 ⬜ To Do T-49 Integrate Chart.js and render bar chart (sales by day) US-17 ⬜ To Do T-50 Add pie chart (top products) and line chart (trend) US-17 ⬜ To Do T-51 Build order history page with full list US-18 ⬜ To Do T-52 Add search/filter by order ID, customer, or date US-18 ⬜ To Do T-53 Build order detail modal (products, qty, subtotals) US-18 ⬜ To Do T-54 Add role column to users table (admin / employee) US-19 ⬜ To Do T-55 Save role on user creation US-19 ⬜ To Do T-56 Implement role check on protected sections US-19 ⬜ To Do T-57 Show access denied message for unauthorized roles US-19 ⬜ To Do T-58 Implement CSV export with all report data US-20 ⬜ To Do T-59 Integrate jsPDF and implement PDF export US-20 ⬜ To Do T-60 Add pagination to users, products, and orders lists US-21 ⬜ To Do T-61 Add indexes to frequently queried Supabase columns US-21 ⬜ To Do T-62 Add global network error handler US-22 ⬜ To Do T-63 Add per-field validation messages to all forms US-22 ⬜ To Do T-64 Add generic server error fallback message US-22 ⬜ To Do
📊 Sprint Summary
Sprint Story Points Cumulative SP Sprint 1 13 SP 13 SP Sprint 2 5 SP 18 SP Sprint 3 17 SP 35 SP Sprint 4 5 SP 40 SP Sprint 5 26 SP 66 SP Sprint 6 8 SP 74 SP Sprint 7 36 SP 110 SP Total 110 SP

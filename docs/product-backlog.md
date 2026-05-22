**✅ Aquí tienes el documento mejorado y limpio en formato Markdown**, listo para tu repositorio.

He eliminado todos los emojis, el Sprint Backlog completo y las tareas (como solicitaste). He reorganizado todo en una estructura profesional de **Product Backlog**.

---

```markdown
# Product Backlog — Chicaffe

**Project:** Chicaffe - Cafeteria Management System  
**Repository:** cbtis47-db-project-salchichasparrita-2026  
**Stack:** HTML · CSS · JavaScript · Supabase  
**Team:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras  
**Version:** 1.2 | Date: May 14, 2026

## Product Goal

Desarrollar un sistema de gestión de cafetería eficiente que permita administrar usuarios, productos, inventario, mesas, pedidos y reportes de ventas, mejorando el control operativo y la experiencia tanto para administradores como para empleados.

---

## Epics y User Stories

### Epic 1: Authentication (EP-01)
Gestión de acceso seguro al sistema.

- **US-01** - User Registration by Administrator  
  **As a** Administrator  
  **I want** to register new users in the system  
  **So that** they can access the platform with their credentials.

  **Acceptance Criteria:**
  ```gherkin
  Given the administrator is logged in
  When filling out the registration form with valid data
  Then the user should be successfully created in the system
  And a success message should be displayed
  ```

- **US-02** - User Login  
  **As a** User  
  **I want** to log in with my email and password  
  **So that** I can access the system according to my role.

  **Acceptance Criteria:**
  ```gherkin
  Given the user is on the login page
  When entering valid credentials
  Then the user should be redirected to the corresponding dashboard
  ```

- **US-03** - Logout  
  **As a** User  
  **I want** to log out of the system  
  **So that** my session is securely closed.

- **US-04** - Protected Routes  
  **As a** User  
  **I want** that unauthorized users cannot access protected pages  
  **So that** the information remains secure.

---

### Epic 2: User Management (EP-02)
Gestión y visualización de usuarios del sistema.

- **US-05** - View Users List  
  **As a** Administrator  
  **I want** to see a list of all registered users  
  **So that** I can manage them easily.

- **US-06** - Search Users by Name  
  **As a** Administrator  
  **I want** to search users by name  
  **So that** I can find them quickly.

---

### Epic 3: Products & Inventory (EP-03)
Administración de productos e inventario.

- **US-07** - Create Product  
  **As a** Administrator  
  **I want** to add new products to the catalog  
  **So that** they are available for sale.

- **US-08** - Edit and Delete Product  
  **As a** Administrator  
  **I want** to edit or delete existing products  
  **So that** I can keep the catalog updated.

- **US-09** - Restock Inventory  
  **As a** Administrator  
  **I want** to increase the stock of a product  
  **So that** inventory is accurate.

- **US-10** - Out of Stock Visual Indicator  
  **As a** User  
  **I want** to see a clear visual indicator when a product is out of stock  
  **So that** I don't try to sell unavailable items.

---

### Epic 4: Tables (EP-04)
Gestión de mesas físicas de la cafetería.

- **US-11** - Tables Management (CRUD)  
  **As a** Administrator  
  **I want** to manage the cafeteria tables (create, read, update, delete)  
  **So that** I can organize the physical space.

---

### Epic 5: Orders (EP-05)
Gestión completa del ciclo de vida de los pedidos.

- **US-12** - Create Order  
  **As a** Employee  
  **I want** to create a new order  
  **So that** I can start attending a customer.

- **US-13** - Add Products to Order  
  **As a** Employee  
  **I want** to add products to an existing order  
  **So that** I can register what the customer wants.

- **US-14** - Change Order Status  
  **As a** Employee  
  **I want** to update the status of an order  
  **So that** I can track its progress.

- **US-15** - Cancel Order and Restore Inventory  
  **As a** Employee  
  **I want** to cancel an order and restore the stock  
  **So that** inventory remains accurate.

---

### Epic 6: Reports (EP-06)
Generación de reportes de ventas.

- **US-16** - Daily Sales Report  
  **As a** Administrator  
  **I want** to generate a daily sales report  
  **So that** I can analyze the performance of the cafeteria.

---

### Epic 7: Enhancements & Polish (EP-07)
Mejoras avanzadas y optimizaciones del sistema.

- **US-17** - Advanced Sales Reports with Charts  
  **As a** Administrator  
  **I want** to view sales reports with graphical charts  
  **So that** I can better understand sales trends.

- **US-18** - Order History and Search  
  **As a** Administrator / Employee  
  **I want** to consult the complete history of orders with search filters  
  **So that** I can review past transactions.

- **US-19** - User Roles and Permissions  
  **As a** Administrator  
  **I want** to assign roles (admin / employee) with proper permissions  
  **So that** each user only accesses what they should.

- **US-20** - Export Reports (PDF / CSV)  
  **As a** Administrator  
  **I want** to export reports in PDF and CSV format  
  **So that** I can share or archive them.

- **US-21** - Performance Optimization  
  **As a** Developer  
  **I want** the system to be optimized  
  **So that** it works efficiently with many records.

- **US-22** - Improved Error Handling  
  **As a** User  
  **I want** clear and friendly error messages  
  **So that** I understand what went wrong.

---

**Total User Stories:** 22  
**Total Estimated Story Points:** 110 SP
```

---

¿Quieres que también te genere una versión del **Sprint Backlog** por separado (solo con tareas), o prefieres que ajuste algo más del Product Backlog (por ejemplo, más detallados los Acceptance Criteria)?

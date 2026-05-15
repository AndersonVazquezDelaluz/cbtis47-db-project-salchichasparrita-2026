# Technical Summary — Chicaffe

**Proyecto:** Chicaffe Web  
**Versión del documento:** 1.1  
**Fecha:** 14 de mayo de 2026  
**Elaborado por:** Anderson Vázquez

---

## 1. Functional Requirements

Los requisitos funcionales describen **qué debe hacer el sistema**.

### 1.1 Authentication
- **FR-01.** El sistema debe permitir a los administradores registrar usuarios con nombre, email y contraseña.
- **FR-02.** El sistema debe validar que el email sea único.
- **FR-03.** El sistema debe mostrar mensajes de validación para campos vacíos.
- **FR-04.** El sistema debe autenticar usuarios utilizando Supabase Auth.
- **FR-05.** El sistema debe redirigir al usuario al dashboard después de iniciar sesión.
- **FR-06.** El sistema debe permitir cerrar sesión en cualquier momento.
- **FR-07.** Las rutas protegidas deben requerir autenticación.

### 1.2 User Management
- **FR-08.** El sistema debe permitir a los administradores ver todos los usuarios.
- **FR-09.** El sistema debe permitir buscar usuarios por nombre.

### 1.3 Products & Inventory
- **FR-10.** El sistema debe permitir crear, actualizar y eliminar productos.
- **FR-11.** El sistema debe gestionar movimientos de inventario (SALE / RESTOCK).

### 1.4 Tables
- **FR-14.** El sistema debe permitir gestionar mesas (número y capacidad).

### 1.5 Orders
- **FR-15.** El sistema debe permitir crear órdenes vinculadas a un usuario y una mesa.
- **FR-16.** El sistema debe permitir agregar productos a una orden.
- **FR-17.** El sistema debe gestionar el ciclo de vida de las órdenes (pending → in_progress → delivered → cancelled).
- **FR-18.** El sistema debe disminuir el inventario al agregar productos a una orden.
- **FR-19.** El sistema debe restaurar el inventario cuando se cancela una orden.
- **FR-20.** El sistema debe prevenir transiciones de estado inválidas en las órdenes.

### 1.6 Reports
- **FR-21.** El sistema debe generar reportes diarios de ventas basados en órdenes entregadas.

---

## 2. Epics y Prioridades

| ID      | Epic                    | Prioridad | Sprint Sugerido |
|---------|-------------------------|-----------|-----------------|
| EP-01   | Authentication          | **Alta**  | Sprint 1        |
| EP-02   | User Management         | **Alta**  | Sprint 1        |
| EP-03   | Products & Inventory    | **Alta**  | Sprint 1        |
| EP-05   | Orders                  | **Alta**  | Sprint 2        |
| EP-04   | Tables                  | **Media** | Sprint 2        |
| EP-06   | Reports                 | **Media** | Sprint 3        |

---

## 3. Agile Requirements
- **AG-01.** El proyecto debe organizarse en Sprints.
- **AG-02.** Las User Stories deben seguir el formato: *As a [user], I want to [action], so that [benefit]*.
- **AG-03.** Cada User Story debe incluir criterios de aceptación en Gherkin.
- **AG-04.** Cada User Story debe tener Story Points asignados.
- **AG-05.** El código debe estar versionado con GitHub.

---

## 4. UI/UX Requirements
- **UX-01.** Identidad visual consistente.
- **UX-02.** Diseño totalmente responsive.
- **UX-03.** Navegación con sidebar.
- **UX-04.** Confirmación antes de acciones destructivas.
- **UX-05.** Indicador visual para productos sin stock.
- **UX-06.** Barra de búsqueda en las tablas.

---

## 5. Non-Functional Requirements
- **NFR-01.** Los datos deben cargarse en menos de 3 segundos.
- **NFR-02.** Las operaciones de guardado deben completarse en menos de 2 segundos.
- **NFR-03.** Las contraseñas deben manejarse de forma segura mediante Supabase Auth.
- **NFR-04.** El sistema debe detectar desconexión de internet.
- **NFR-05.** El precio del producto debe conservarse en el momento de la creación de la orden.
- **NFR-06.** El sistema debe estar construido solo con HTML, CSS, JavaScript y Supabase.
- **NFR-07.** El sistema debe funcionar en navegadores basados en Chromium.

---

## 6. Data Model 
## 9. Scope
 
### In
- Auth
- Orders
- Inventory
- Reports
### Out
- Mobile app
- Payments
---
 
## 10. Next Steps
- Improve validation
- Handle concurrency
- Add edge cases
---
 
**Chicaffe web**

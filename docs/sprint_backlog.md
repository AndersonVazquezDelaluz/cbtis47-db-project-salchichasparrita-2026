# Sprint Backlog — Chicaffe

**Project:** Chicaffe - Cafeteria Management System  
**Repository:** `cbtis47-db-project-salchichasparrita-2026`  
**Stack:** Node.js · Express · MySQL · HTML/CSS/JavaScript  
**Team:** Anderson Vázquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras  
**Versión:** 2.0 | **Date:** 28 de mayo de 2026

**Capacidad total del proyecto:** 112 horas (7 sprints × 16 horas)

---

### SPRINT 1 — Authentication (EP-01)

**Sprint Goal**  
Implementar un sistema de autenticación seguro que permita registrar usuarios, iniciar sesión, cerrar sesión y proteger las rutas del sistema, aportando una base sólida de seguridad para todo el proyecto.

**Parámetros Generales Semanales**
- **Duración del sprint:** 2 semanas
- **Capacidad total del equipo:** 16 horas
- **Disponibilidad semanal:** 8 horas por semana
- **Roles involucrados:** Anderson Vázquez (Backend), Axel de la Cruz (Frontend)
- **Herramientas/Tecnologías:** Node.js, Express, MySQL, bcrypt, JWT, Postman
- **Restricciones/Dependencias:** Base de datos MySQL configurada

**Historias de Usuario**

| US    | Historia de Usuario | Prioridad | Estimación (horas) | Criterios de Aceptación |
|-------|---------------------|-----------|--------------------|-------------------------|
| US-01 | Como administrador quiero registrar nuevos usuarios para dar acceso al personal. | High | 5h | Registro exitoso, contraseña hasheada, email único |
| US-02 | Como usuario quiero iniciar sesión con email y contraseña para acceder al sistema. | High | 4h | Login exitoso, JWT generado, redirección al dashboard |
| US-03 | Como usuario quiero cerrar sesión para finalizar mi sesión de forma segura. | High | 3h | Token invalidado y redirección a login |
| US-04 | Como administrador quiero que las rutas estén protegidas para evitar accesos no autorizados. | High | 4h | Middleware funcional en todas las rutas protegidas |

**Tareas**

| Tarea | Nombre de la Tarea | Responsable | Horas | Estado | US |
|-------|--------------------|-------------|-------|--------|----|
| T-01 | Crear tabla `users` en MySQL | Anderson | 2 | ✅ | US-01 |
| T-02 | Endpoint POST `/api/auth/register` + bcrypt | Anderson | 2 | ⬜ | US-01 |
| T-03 | Formulario de registro (HTML + Fetch) | Axel | 1.5 | ⬜ | US-01 |
| T-04 | Endpoint POST `/api/auth/login` + JWT | Anderson | 2 | ⬜ | US-02 |
| T-05 | Formulario login + manejo de errores | Axel | 1.5 | ⬜ | US-02 |
| T-06 | Logout + middleware de autenticación | Anderson | 2 | ⬜ | US-03/US-04 |
| T-07 | Proteger rutas del dashboard | Axel | 2 | ⬜ | US-04 |
| T-08 | Pruebas y corrección de errores | Ambos | 3 | ⬜ | Todas |

**Tareas a Través del Tiempo**  
**Semana 1 (8h):** T-01, T-02, T-03, T-04 → Registro y Login básico  
**Semana 2 (8h):** T-05, T-06, T-07, T-08 → Logout y protección completa

**Definición de Hecho**  
- Código implementado y limpio  
- Pruebas manuales exitosas  
- Funciona en entorno local  
- Documentación de endpoints actualizada  
- Aprobación del Product Owner  
- Sin errores críticos de seguridad

---

### SPRINT 2 — User Management (EP-02)

**Sprint Goal**  
Permitir al administrador gestionar los usuarios del sistema (visualizar, editar y eliminar), mejorando el control administrativo.

**Parámetros Generales Semanales**
- **Duración del sprint:** 2 semanas
- **Capacidad total del equipo:** 16 horas
- **Disponibilidad semanal:** 8 horas por semana
- **Roles involucrados:** Anderson Vázquez (Backend), Axel de la Cruz (Frontend)
- **Herramientas/Tecnologías:** Node.js, Express, MySQL, JWT
- **Restricciones/Dependencias:** Sprint 1 completado (autenticación)

**Historias de Usuario**

| US    | Historia de Usuario | Prioridad | Estimación (horas) | Criterios de Aceptación |
|-------|---------------------|-----------|--------------------|-------------------------|
| US-05 | Como administrador quiero ver la lista de usuarios para gestionar el personal. | High | 5h | Lista paginada o completa con filtros |
| US-06 | Como administrador quiero editar o eliminar usuarios para mantener información actualizada. | High | 6h | Actualización y eliminación segura |

**Tareas**

| Tarea | Nombre de la Tarea | Responsable | Horas | Estado | US |
|-------|--------------------|-------------|-------|--------|----|
| T-09 | Endpoint GET `/api/users` | Anderson | 2 | ⬜ | US-05 |
| T-10 | Endpoint PUT `/api/users/:id` y DELETE | Anderson | 2.5 | ⬜ | US-06 |
| T-11 | Página de lista de usuarios (HTML + JS) | Axel | 3 | ⬜ | US-05 |
| T-12 | Formularios de edición y confirmación de eliminación | Axel | 3 | ⬜ | US-06 |
| T-13 | Pruebas de permisos (solo admin) | Ambos | 2.5 | ⬜ | Todas |
| T-14 | Manejo de errores y feedback | Axel | 3 | ⬜ | Todas |

**Tareas a Través del Tiempo**  
**Semana 1 (8h):** Backend (lista y CRUD)  
**Semana 2 (8h):** Frontend + pruebas

**Definición de Hecho**  
- CRUD funcional  
- Solo accesible por administradores  
- Pruebas realizadas  
- Interfaz responsive

---

### SPRINT 3 — Products & Inventory (EP-03)

**Sprint Goal**  
Implementar el módulo completo de productos e inventario para gestionar la oferta de la cafetería.

**Parámetros Generales Semanales**
- **Duración del sprint:** 2 semanas
- **Capacidad total del equipo:** 16 horas
- **Disponibilidad semanal:** 8 horas por semana
- **Roles involucrados:** Anderson, Axel, Jayden Reyes
- **Herramientas/Tecnologías:** Node.js, Express, MySQL

**Historias de Usuario**

| US    | Historia de Usuario | Prioridad | Estimación (horas) | Criterios de Aceptación |
|-------|---------------------|-----------|--------------------|-------------------------|
| US-07 | Como administrador quiero crear productos para ofrecerlos en la cafetería. | High | 5h | Campos: nombre, precio, stock, categoría |
| US-08 | Como administrador quiero editar o eliminar productos. | High | 4h | Actualización en tiempo real |
| US-09 | Como administrador quiero reponer inventario. | High | 4h | Actualización de stock |
| US-10 | Como usuario quiero ver visualmente cuando un producto está agotado. | Medium | 3h | Indicador visual claro |

*(Tabla de Tareas y distribución similar a los anteriores — se mantiene el formato)*

**Tareas a Través del Tiempo**  
**Semana 1:** CRUD de productos  
**Semana 2:** Control de inventario y visualización

**Definición de Hecho**  
- CRUD completo  
- Stock actualizado correctamente  
- Indicadores visuales funcionales

---

### SPRINT 4 — Tables (EP-04)

**Sprint Goal**  
Gestionar las mesas de la cafetería (CRUD) para organizar mejor el espacio físico.

*(Estructura completa similar)*

**Historias de Usuario**
- US-11: Como administrador quiero gestionar las mesas (crear, asignar número, estado: disponible/ocupada).

**Estimación total:** 16 horas

---

### SPRINT 5 — Orders (EP-05)

**Sprint Goal**  
Implementar el flujo completo de órdenes: crear, agregar productos, cambiar estado y cancelar con devolución de inventario.

**Historias de Usuario**
- US-12: Crear orden
- US-13: Agregar productos a orden
- US-14: Cambiar estado de orden
- US-15: Cancelar orden y restaurar stock

**Estimación total:** 16 horas

---

### SPRINT 6 — Reports (EP-06)

**Sprint Goal**  
Generar reportes básicos de ventas diarias para tener control financiero.

**Historias de Usuario**
- US-16: Generar reporte de ventas del día

**Estimación total:** 16 horas

---

### SPRINT 7 — Enhancements & Polish (EP-07)

**Sprint Goal**  
Mejorar la experiencia de usuario, añadir reportes avanzados y pulir el sistema antes de la entrega final.

**Historias de Usuario**
- US-17: Reportes avanzados con gráficos
- US-18: Mejoras de diseño responsive
- US-19: Mejor manejo de errores
- US-20: Optimización de rendimiento
- US-21: Control de acceso por roles (RBAC)
- US-22: Documentación final y pulido

**Estimación total:** 16 horas

---

**Notas finales del Sprint Backlog:**
- Total de horas: **112 horas** (realista para el equipo).
- Cada sprint respeta la capacidad de **16 horas**.
- Dependencias claras entre sprints (ej. autenticación antes que todo).
- Enfocado en valor incremental.

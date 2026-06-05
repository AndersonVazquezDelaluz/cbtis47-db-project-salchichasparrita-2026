# Especificación de Requisitos de Software
## Chicaffe — Sistema de Gestión de Cafetería

| Campo | Valor |
|---|---|
| **Proyecto** | Chicaffe Web |
| **Versión del documento** | 2.0 |
| **Fecha** | 29 de mayo de 2026 |
| **Repositorio** | `cbtis47-db-project-salchichasparrita-2026` |
| **Elaborado por** | Anderson Vázquez (Analista y Diseñador) |
| **Institución** | CBTIS 47 — 2026 |
| **Estado** | En progreso |

---

## 1. Introducción

El presente documento especifica los requisitos no funcionales del sistema **Chicaffe**, una aplicación web de gestión de cafetería desarrollada como proyecto académico en el CBTIS 47. Los requisitos no funcionales describen las cualidades y restricciones que el sistema debe satisfacer en términos de rendimiento, seguridad, confiabilidad, compatibilidad, mantenibilidad y usabilidad.

---

## 2. Requisitos No Funcionales

### 2.1 Rendimiento

| ID | Descripción |
|---|---|
| NFR-01 | Cualquier página debe estar completamente renderizada e interactiva en menos de 2 segundos bajo carga normal. |
| NFR-02 | Los datos deben cargarse en menos de 3 segundos. |
| NFR-03 | Las operaciones de guardado deben completarse en menos de 2 segundos. |
| NFR-04 | La paginación del lado del servidor debe limitar el payload de la consulta a la página actual; se deben aplicar índices MySQL en las columnas consultadas con mayor frecuencia (`order_date`, `user_id`, `status`). |

---

### 2.2 Seguridad

| ID | Descripción |
|---|---|
| NFR-05 | Las contraseñas deben almacenarse como hashes bcrypt (`char(60)`); nunca se debe almacenar una contraseña en texto plano. |
| NFR-06 | Todas las rutas protegidas deben ser validadas del lado del servidor mediante middleware de Express antes de conceder acceso. |
| NFR-07 | La verificación de roles debe aplicarse en el servidor, no únicamente en el cliente. |

---

### 2.3 Confiabilidad

| ID | Descripción |
|---|---|
| NFR-08 | El sistema debe detectar la desconexión a internet y notificar al usuario sin perder los datos del formulario. |
| NFR-09 | El precio del producto debe capturarse como snapshot (`unit_price`) al momento de la creación del pedido; cambios posteriores al precio no deben afectar los pedidos existentes. |
| NFR-10 | Los errores internos del servidor deben registrarse en el log y no deben interrumpir el proceso del servidor. |

---

### 2.4 Compatibilidad

| ID | Descripción |
|---|---|
| NFR-11 | El sistema debe funcionar correctamente en navegadores basados en Chromium (Google Chrome, Microsoft Edge). |
| NFR-12 | El sistema debe construirse utilizando Node.js v18+, Express.js, MySQL, HTML5, CSS3 y JavaScript vanilla. |
| NFR-13 | El sistema debe poder desplegarse en un entorno local XAMPP en el puerto 3000. |

---

### 2.5 Mantenibilidad

| ID | Descripción |
|---|---|
| NFR-14 | El código debe estar limpio, bien comentado y organizado conforme a la estructura de proyecto definida. |
| NFR-15 | Todo el código fuente debe estar versionado con Git y alojado en GitHub. |
| NFR-16 | El esquema de base de datos, los datos semilla y los scripts de mantenimiento deben mantenerse en archivos `.sql` independientes bajo `/src`. |

---

### 2.6 Usabilidad

| ID | Descripción |
|---|---|
| NFR-17 | La interfaz debe ser completamente responsiva en viewports de escritorio y móvil. |
| NFR-18 | Las acciones destructivas (eliminar, cancelar pedido) deben requerir un diálogo de confirmación previo. |

---

## 3. Resumen de Requisitos

| Categoría | Identificadores | Total |
|---|---|:---:|
| Rendimiento | NFR-01 a NFR-04 | 4 |
| Seguridad | NFR-05 a NFR-07 | 3 |
| Confiabilidad | NFR-08 a NFR-10 | 3 |
| Compatibilidad | NFR-11 a NFR-13 | 3 |
| Mantenibilidad | NFR-14 a NFR-16 | 3 |
| Usabilidad | NFR-17 a NFR-18 | 2 |
| **Total** | **NFR-01 a NFR-18** | **18** |

---

*Documento generado para uso académico — CBTIS 47 · 2026*

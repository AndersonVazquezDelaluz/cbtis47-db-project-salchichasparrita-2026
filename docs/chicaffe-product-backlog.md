# 📋 Product Backlog — Chicaffe
**Proyecto:** Sistema de Gestión de Cafetería (cbtis47-db-project-salchichasparrita-2026)  
**Stack:** HTML · CSS · JavaScript · Supabase  
**Equipo:** Anderson Vazquez · Jayden Reyes · Matthew Venegas · Axel de la Cruz · Anuar Contreras

---

## 🗺️ Épicas del Proyecto

| ID | Épica | Prioridad | Parcial |
|----|-------|-----------|---------|
| EP-01 | Autenticación | Alta | 1er Parcial |
| EP-02 | Gestión de Usuarios | Alta | 1er Parcial |
| EP-03 | Productos e Inventario | Alta | 1er Parcial |
| EP-04 | Mesas | Media | 2do Parcial |
| EP-05 | Órdenes | Alta | 2do Parcial |
| EP-06 | Reportes | Media | 2do Parcial |

---

---

# 🟦 PRIMER PARCIAL

> **Objetivo:** Establecer la base del sistema: autenticación segura, administración de usuarios y gestión completa del catálogo de productos con su inventario.

---

## Sprint 1 — Autenticación (EP-01)
**Duración estimada:** 1 semana  
**Objetivo del sprint:** El sistema debe permitir registro, inicio de sesión, cierre de sesión y protección de rutas mediante Supabase Auth.

---

### US-01 · Registro de usuario por administrador
**Historia:** Como administrador, quiero registrar nuevos usuarios con nombre, correo y contraseña, para que el personal pueda acceder al sistema.

**Story Points:** 5

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Registro de usuario

  Scenario: Registro exitoso
    Given el administrador está en el formulario de registro
    And todos los campos (nombre, correo, contraseña) están completos
    When el administrador envía el formulario
    Then el sistema crea la cuenta en Supabase Auth
    And muestra un mensaje de confirmación

  Scenario: Correo duplicado
    Given ya existe una cuenta con el correo ingresado
    When el administrador intenta registrar al usuario
    Then el sistema muestra el mensaje "Este correo ya está registrado"
    And no crea una cuenta nueva

  Scenario: Campos vacíos
    Given el administrador deja algún campo en blanco
    When intenta enviar el formulario
    Then el sistema resalta los campos faltantes
    And muestra el mensaje de validación correspondiente
```

**Tareas técnicas:**
- Crear `register.html` con formulario (nombre, email, password)
- Función `registerUser()` en JS llamando a `supabase.auth.signUp()`
- Validación de campos vacíos con mensajes en UI
- Verificar unicidad de email (manejo del error de Supabase)

---

### US-02 · Inicio de sesión
**Historia:** Como usuario registrado, quiero iniciar sesión con mi correo y contraseña, para que pueda acceder al dashboard del sistema.

**Story Points:** 3

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Inicio de sesión

  Scenario: Login exitoso
    Given un usuario registrado con credenciales válidas
    When ingresa su correo y contraseña correctamente
    Then el sistema autentica con Supabase Auth
    And redirige al dashboard principal

  Scenario: Credenciales incorrectas
    Given un usuario con correo o contraseña incorrectos
    When intenta iniciar sesión
    Then el sistema muestra "Correo o contraseña incorrectos"
    And no redirige al dashboard
```

**Tareas técnicas:**
- Crear `login.html` con formulario
- Función `loginUser()` con `supabase.auth.signInWithPassword()`
- Redirección a `dashboard.html` si la sesión es válida

---

### US-03 · Cierre de sesión
**Historia:** Como usuario autenticado, quiero poder cerrar sesión en cualquier momento, para que mi cuenta quede protegida al terminar mi turno.

**Story Points:** 2

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Cierre de sesión

  Scenario: Logout exitoso
    Given el usuario tiene una sesión activa
    When hace clic en "Cerrar sesión"
    Then el sistema termina la sesión con Supabase
    And redirige a la página de login
```

**Tareas técnicas:**
- Botón de logout en el sidebar/navbar
- Función `logoutUser()` con `supabase.auth.signOut()`
- Limpiar estado local y redirigir a `login.html`

---

### US-04 · Protección de rutas
**Historia:** Como administrador del sistema, quiero que las páginas privadas solo sean accesibles a usuarios autenticados, para que nadie sin credenciales pueda ver la información del negocio.

**Story Points:** 3

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Rutas protegidas

  Scenario: Acceso sin sesión
    Given el usuario no ha iniciado sesión
    When intenta acceder directamente a una página protegida
    Then el sistema redirige automáticamente al login

  Scenario: Acceso con sesión válida
    Given el usuario tiene sesión activa
    When navega a cualquier página protegida
    Then el sistema muestra el contenido normalmente
```

**Tareas técnicas:**
- Función `checkAuth()` usando `supabase.auth.getSession()`
- Incluir `checkAuth()` en el `<head>` de cada página protegida
- Redirección automática a `login.html` si no hay sesión

---

## Sprint 2 — Gestión de Usuarios (EP-02)
**Duración estimada:** 1 semana  
**Objetivo del sprint:** El administrador puede visualizar y buscar todos los usuarios registrados en el sistema.

---

### US-05 · Listado de usuarios
**Historia:** Como administrador, quiero ver todos los usuarios registrados en una tabla, para que pueda tener visibilidad del personal con acceso al sistema.

**Story Points:** 3

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Listado de usuarios

  Scenario: Ver todos los usuarios
    Given el administrador está en la sección de usuarios
    When la página carga
    Then el sistema muestra una tabla con todos los usuarios registrados
    And cada fila muestra nombre, correo y fecha de registro
```

**Tareas técnicas:**
- Crear `users.html` con tabla HTML
- Query a Supabase tabla `profiles` o equivalente
- Renderizar filas dinámicamente con JS

---

### US-06 · Búsqueda de usuarios por nombre
**Historia:** Como administrador, quiero buscar usuarios por nombre, para que pueda encontrar rápidamente a un empleado específico.

**Story Points:** 2

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Búsqueda de usuarios

  Scenario: Búsqueda con resultados
    Given el administrador está en la lista de usuarios
    When escribe un nombre en la barra de búsqueda
    Then la tabla filtra y muestra solo los usuarios que coinciden

  Scenario: Búsqueda sin resultados
    Given no existe ningún usuario con el nombre buscado
    When el administrador escribe en la barra de búsqueda
    Then la tabla muestra el mensaje "No se encontraron usuarios"
```

**Tareas técnicas:**
- Input de búsqueda con evento `oninput`
- Filtro del array local o query `.ilike()` a Supabase

---

## Sprint 3 — Productos e Inventario (EP-03)
**Duración estimada:** 1–2 semanas  
**Objetivo del sprint:** CRUD completo de productos y registro de movimientos de inventario (SALE / RESTOCK).

---

### US-07 · Crear producto
**Historia:** Como administrador, quiero agregar nuevos productos con nombre, precio y stock inicial, para que estén disponibles al momento de crear órdenes.

**Story Points:** 5

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Creación de producto

  Scenario: Producto creado exitosamente
    Given el administrador está en el formulario de nuevo producto
    And todos los campos están completos
    When envía el formulario
    Then el sistema guarda el producto en Supabase
    And aparece en la lista de productos

  Scenario: Campos faltantes
    Given el administrador no llena todos los campos
    When intenta guardar
    Then el sistema muestra los errores de validación correspondientes
```

**Tareas técnicas:**
- Crear `products.html` con formulario de alta
- Insert a tabla `products` en Supabase con `name`, `price`, `stock`
- Refresh de la lista tras inserción exitosa

---

### US-08 · Editar y eliminar producto
**Historia:** Como administrador, quiero poder editar y eliminar productos existentes, para que el catálogo siempre esté actualizado.

**Story Points:** 5

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Edición y eliminación de producto

  Scenario: Edición exitosa
    Given el administrador selecciona un producto
    When modifica sus datos y confirma
    Then los cambios se guardan en la base de datos

  Scenario: Eliminación con confirmación
    Given el administrador quiere eliminar un producto
    When hace clic en eliminar
    Then el sistema muestra un modal de confirmación
    And solo elimina el producto si el admin confirma
```

**Tareas técnicas:**
- Botones de editar/eliminar por fila
- Modal de confirmación para eliminar (UX-04)
- Update/Delete en Supabase con el `id` del producto

---

### US-09 · Reabastecimiento de inventario (RESTOCK)
**Historia:** Como administrador, quiero registrar entradas de inventario para un producto, para que el stock disponible se mantenga correcto.

**Story Points:** 5

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Reabastecimiento de inventario

  Scenario: Restock exitoso
    Given el administrador selecciona un producto con stock bajo
    When registra una cantidad de reabastecimiento
    Then el sistema incrementa el stock del producto
    And registra un movimiento tipo RESTOCK en el historial

  Scenario: Cantidad inválida
    Given el administrador ingresa una cantidad negativa o cero
    When intenta guardar
    Then el sistema muestra un error de validación
```

**Tareas técnicas:**
- Formulario de restock en modal o sección aparte
- Insert en tabla `inventory_movements` (tipo RESTOCK, cantidad, product_id)
- Update del campo `stock` en tabla `products`

---

### US-10 · Indicador visual de producto sin stock
**Historia:** Como cualquier usuario, quiero ver visualmente qué productos están agotados, para que pueda evitar agregar a una orden productos no disponibles.

**Story Points:** 2

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Indicador de sin stock

  Scenario: Producto agotado visible
    Given un producto tiene stock = 0
    When se muestra en la lista de productos
    Then aparece con una etiqueta visual o fondo diferente que indica "Agotado"
```

**Tareas técnicas:**
- Clase CSS condicional según `stock === 0`
- Badge o etiqueta "Sin stock" en la UI

---

### 📊 Resumen del 1er Parcial

| User Story | Épica | SP | Sprint |
|------------|-------|----|--------|
| US-01 Registro de usuario | EP-01 | 5 | 1 |
| US-02 Inicio de sesión | EP-01 | 3 | 1 |
| US-03 Cierre de sesión | EP-01 | 2 | 1 |
| US-04 Protección de rutas | EP-01 | 3 | 1 |
| US-05 Listado de usuarios | EP-02 | 3 | 2 |
| US-06 Búsqueda de usuarios | EP-02 | 2 | 2 |
| US-07 Crear producto | EP-03 | 5 | 3 |
| US-08 Editar/Eliminar producto | EP-03 | 5 | 3 |
| US-09 Reabastecimiento (RESTOCK) | EP-03 | 5 | 3 |
| US-10 Indicador sin stock | EP-03 | 2 | 3 |
| **TOTAL** | | **35 SP** | |

---

---

# 🟩 SEGUNDO PARCIAL

> **Objetivo:** Implementar la operativa completa del negocio: gestión de mesas, ciclo de vida de órdenes, descuentos automáticos de inventario y generación de reportes de ventas.

---

## Sprint 4 — Mesas (EP-04)
**Duración estimada:** 1 semana  
**Objetivo del sprint:** El sistema permite crear y administrar las mesas disponibles del negocio.

---

### US-11 · Gestión de mesas (CRUD)
**Historia:** Como administrador, quiero crear, editar y eliminar mesas con su número y capacidad, para que el sistema refleje la distribución real del local.

**Story Points:** 5

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Gestión de mesas

  Scenario: Crear mesa
    Given el administrador está en la sección de mesas
    When ingresa el número y capacidad y guarda
    Then la mesa aparece en la lista

  Scenario: Editar mesa
    Given una mesa existente
    When el administrador modifica su número o capacidad y confirma
    Then los cambios se reflejan en la base de datos

  Scenario: Eliminar mesa con confirmación
    Given una mesa existente
    When el administrador hace clic en eliminar
    Then aparece un modal de confirmación
    And solo se elimina si el admin confirma
```

**Tareas técnicas:**
- Crear `tables.html` con listado y formulario
- CRUD sobre tabla `tables` en Supabase (`number`, `capacity`)
- Modal de confirmación para eliminar

---

## Sprint 5 — Órdenes (EP-05)
**Duración estimada:** 2 semanas  
**Objetivo del sprint:** Creación de órdenes vinculadas a mesa y usuario, agregar productos, manejar el ciclo de vida completo y gestionar inventario automáticamente.

---

### US-12 · Crear orden
**Historia:** Como empleado, quiero crear una nueva orden vinculada a un usuario y una mesa, para que quede registrado quién atendió qué mesa.

**Story Points:** 5

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Creación de orden

  Scenario: Orden creada exitosamente
    Given el empleado selecciona un usuario y una mesa disponible
    When confirma la creación
    Then el sistema registra la orden con estado "pending"
    And aparece en la lista de órdenes activas

  Scenario: Mesa o usuario sin seleccionar
    Given el empleado no seleccionó mesa o usuario
    When intenta crear la orden
    Then el sistema muestra un mensaje de validación
```

**Tareas técnicas:**
- Crear `orders.html` con selects de usuario y mesa
- Insert en tabla `orders` con `user_id`, `table_id`, `status: 'pending'`

---

### US-13 · Agregar productos a una orden
**Historia:** Como empleado, quiero agregar productos disponibles a una orden activa, para que se registre lo que el cliente va a consumir y el inventario se descuente automáticamente.

**Story Points:** 8

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Agregar productos a orden

  Scenario: Producto agregado y stock descontado
    Given una orden en estado "pending" o "in_progress"
    And el producto tiene stock disponible
    When el empleado agrega el producto a la orden
    Then se registra en `order_details` con el precio vigente
    And el stock del producto disminuye en la cantidad indicada
    And se registra un movimiento SALE en inventario

  Scenario: Producto sin stock
    Given el producto tiene stock = 0
    When el empleado intenta agregarlo a la orden
    Then el sistema bloquea la acción
    And muestra "Producto sin stock disponible"
```

**Tareas técnicas:**
- Sección de productos en la vista de orden
- Insert en `order_details` (`order_id`, `product_id`, `quantity`, `unit_price`)
- Decrementar `stock` en `products` y registrar movimiento SALE
- Capturar precio actual en el momento de agregar (NFR-05)

---

### US-14 · Cambio de estado de la orden
**Historia:** Como empleado, quiero cambiar el estado de una orden (pending → in_progress → delivered), para que el equipo sepa el progreso de cada mesa.

**Story Points:** 5

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Ciclo de vida de la orden

  Scenario: Transición válida
    Given una orden en estado "pending"
    When el empleado cambia el estado a "in_progress"
    Then el sistema actualiza el estado en la base de datos

  Scenario: Transición inválida
    Given una orden en estado "delivered"
    When el empleado intenta revertir el estado
    Then el sistema rechaza la acción
    And muestra "Esta transición de estado no está permitida"
```

**Tareas técnicas:**
- Botones de cambio de estado según estado actual (lógica de transiciones permitidas)
- Update en tabla `orders` con validación de transición en JS
- Deshabilitar/ocultar botones para transiciones no permitidas

---

### US-15 · Cancelar orden y restaurar inventario
**Historia:** Como empleado, quiero cancelar una orden y que el inventario se restaure automáticamente, para que el stock no se pierda si el cliente cancela su pedido.

**Story Points:** 8

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Cancelación de orden

  Scenario: Cancelación con restauración de stock
    Given una orden con productos en estado "pending" o "in_progress"
    When el empleado cancela la orden (con confirmación)
    Then el estado cambia a "cancelled"
    And el stock de cada producto del detalle se restaura
    And se registran movimientos RESTOCK en inventario

  Scenario: Confirmar antes de cancelar
    Given el empleado hace clic en "Cancelar orden"
    When aparece el modal de confirmación
    And el empleado confirma
    Then se ejecuta la cancelación
```

**Tareas técnicas:**
- Modal de confirmación para cancelar
- Consulta de `order_details` para saber qué restaurar
- Update de `stock` en cada producto relacionado
- Insert de movimientos RESTOCK en `inventory_movements`
- Update de status a `cancelled`

---

## Sprint 6 — Reportes (EP-06)
**Duración estimada:** 1 semana  
**Objetivo del sprint:** Generación del reporte diario de ventas basado en órdenes entregadas.

---

### US-16 · Reporte diario de ventas
**Historia:** Como administrador, quiero generar un reporte de ventas del día, para que pueda saber cuánto ingresó el negocio en base a las órdenes entregadas.

**Story Points:** 8

**Criterios de Aceptación (Gherkin):**
```gherkin
Feature: Reporte de ventas

  Scenario: Generar reporte con órdenes entregadas
    Given existen órdenes con estado "delivered" para la fecha seleccionada
    When el administrador genera el reporte
    Then el sistema muestra el total de ventas del día
    And muestra el detalle por orden (mesa, usuario, total)
    And muestra los productos más vendidos

  Scenario: Sin órdenes del día
    Given no hay órdenes entregadas para la fecha seleccionada
    When el administrador genera el reporte
    Then el sistema muestra "No hay ventas registradas para esta fecha"
```

**Tareas técnicas:**
- Crear `reports.html` con selector de fecha
- Query de `orders` donde `status = 'delivered'` y fecha = seleccionada
- JOIN con `order_details` y `products` para calcular totales
- Mostrar tabla de resumen y total general

---

### 📊 Resumen del 2do Parcial

| User Story | Épica | SP | Sprint |
|------------|-------|----|--------|
| US-11 Gestión de mesas (CRUD) | EP-04 | 5 | 4 |
| US-12 Crear orden | EP-05 | 5 | 5 |
| US-13 Agregar productos a orden | EP-05 | 8 | 5 |
| US-14 Cambio de estado de orden | EP-05 | 5 | 5 |
| US-15 Cancelar orden y restaurar inventario | EP-05 | 8 | 5 |
| US-16 Reporte diario de ventas | EP-06 | 8 | 6 |
| **TOTAL** | | **39 SP** | |

---

---

# 📐 Resumen General del Proyecto

| Parcial | Sprints | User Stories | Story Points |
|---------|---------|--------------|--------------|
| 1er Parcial | 1, 2, 3 | US-01 al US-10 | 35 SP |
| 2do Parcial | 4, 5, 6 | US-11 al US-16 | 39 SP |
| **Total** | **6 Sprints** | **16 User Stories** | **74 SP** |

---

## 🗂️ Mapa de Requerimientos ↔ User Stories

| FR / NFR | User Story |
|----------|-----------|
| FR-01, FR-02, FR-03 | US-01 |
| FR-04, FR-05 | US-02 |
| FR-06 | US-03 |
| FR-07 | US-04 |
| FR-08 | US-05 |
| FR-09 | US-06 |
| FR-10 | US-07, US-08 |
| FR-11 | US-09 |
| UX-05 | US-10 |
| FR-14 | US-11 |
| FR-15 | US-12 |
| FR-16, FR-18, NFR-05 | US-13 |
| FR-17, FR-20 | US-14 |
| FR-19 | US-15 |
| FR-21 | US-16 |

---

## 🏗️ Estructura de la Base de Datos (referencia)

```
users        → id, name, email (manejado por Supabase Auth)
products     → id, name, price, stock
tables       → id, number, capacity
orders       → id, user_id, table_id, status, created_at
order_details→ id, order_id, product_id, quantity, unit_price
inventory_movements → id, product_id, type (SALE/RESTOCK), quantity, created_at
```

---

*Backlog generado con base en el Technical Summary de Chicaffe y el repositorio cbtis47-db-project-salchichasparrita-2026.*

#  Reporte Semanal - Proyecto Base de Datos

##  Proyecto
Creación y funcionamiento de una base de datos para la gestión de un restaurante utilizando MySQL mediante XAMPP.

---

##  Semana 7: Creación de estructuras en MySQL (DDL)

###  Objetivo de la semana
Comprender la sintaxis básica del lenguaje SQL, específicamente las instrucciones de definición de datos (DDL), para crear la estructura inicial de una base de datos en MySQL utilizando XAMPP.

---

###  Actividades realizadas
Durante esta semana se llevó a cabo la instalación y configuración del entorno de trabajo con XAMPP, permitiendo el uso de MySQL de manera local.

Posteriormente, se investigó la sintaxis de creación de bases de datos y tablas, comenzando con la definición del esquema general del proyecto `restaurant_db`.

Se desarrollaron las primeras tablas principales del sistema:

- USER
- PRODUCT
- TABLES  

Se definieron atributos como:

- Tipos de datos (INT, VARCHAR, DECIMAL)
- Restricciones básicas (NOT NULL, PRIMARY KEY, AUTO_INCREMENT)

---

###  Uso de la IA (prompts)

> "Explícame la sintaxis de CREATE TABLE. ¿Qué significa 'NOT NULL' y cuándo debería usarlo?"

A partir de este prompt se logró:

- Entender la estructura de `CREATE TABLE`
- Aplicar correctamente restricciones como `NOT NULL`
- Definir campos obligatorios en las tablas

---

###  Resultados obtenidos

- Creación de la base de datos `restaurant_db`
- Diseño inicial de tablas principales
- Script SQL funcional con estructura básica (`src/01_schema_tables.sql`)

---

###  Problemas o dificultades

- Dudas sobre qué campos debían ser obligatorios
- Confusión inicial con tipos de datos adecuados
- Errores menores de sintaxis al crear tablas

---

###  Conclusión de la semana
Se logró comprender la base del lenguaje SQL y construir la estructura inicial de la base de datos. El uso de la IA facilitó la comprensión de conceptos clave como las restricciones y la sintaxis correcta.

---

##  Semana 8: Integridad relacional y restricciones

###  Objetivo de la semana
Implementar relaciones entre tablas mediante llaves foráneas y restricciones para garantizar la integridad de los datos dentro de la base de datos.

---

###  Actividades realizadas
En esta semana se amplió la base de datos agregando nuevas tablas y relaciones:

- ADDRESS
- ORDER
- ORDER_DETAIL
- INVENTORY_MOVEMENTS  

Se implementaron:

- Llaves foráneas (FOREIGN KEY)
- Restricciones UNIQUE
- Reglas de integridad (ON DELETE, ON UPDATE)
- Validaciones con CHECK

Se establecieron relaciones como:

- Usuario → Dirección
- Usuario → Orden
- Orden → Detalle de orden
- Producto → Inventario

---

###  Uso de la IA (prompts)

> "Tengo un error de 'Foreign Key Constraint Fails'. Explícame qué condiciones deben cumplirse antes de crear una relación entre dos tablas."

Este prompt permitió:

- Entender que las tablas deben existir previamente
- Verificar coincidencia de tipos de datos
- Comprender el orden correcto de creación de tablas
- Solucionar errores de relaciones

---

###  Resultados obtenidos

- Base de datos completamente estructurada con relaciones
- Implementación de integridad referencial
- Script SQL completo (`src/01_schema_constraints.sql`)
- Sistema funcional para gestión de restaurante

---

###  Problemas o dificultades

- Errores al crear llaves foráneas
- Orden incorrecto al ejecutar scripts
- Confusión en relaciones entre tablas

---

###  Conclusión de la semana
Se logró implementar correctamente la integridad relacional en la base de datos. El uso de la IA fue clave para identificar errores y comprender las reglas necesarias para establecer relaciones entre tablas.

- Validaciones de datos

El uso de herramientas como XAMPP y el apoyo de inteligencia artificial facilitaron el aprendizaje y la resolución de problemas durante el desarrollo del proyecto.

## Semana 9: SQL DML – Data Seeding (C.R.U.D - Create)

### Objetivo de la semana

Aplicar la sintaxis de `INSERT INTO` para poblar la base de datos con datos de prueba, utilizando inserciones unitarias y múltiples.

---

### Actividades realizadas

Durante esta semana se trabajó en la inserción de datos iniciales (datos semilla) dentro de la base de datos del sistema de cafetería. Se utilizó la instrucción `INSERT INTO` para poblar las diferentes tablas previamente creadas en semanas anteriores.

Se implementaron inserciones múltiples para optimizar la carga de datos, permitiendo agregar varios registros en una sola instrucción SQL. Esto facilitó la creación de un entorno funcional para pruebas.

---

### Desarrollo

Se insertaron datos en las siguientes tablas:

* `user`: registro de usuarios del sistema
* `address`: direcciones asociadas a cada usuario
* `product`: productos del menú de la cafetería
* `tables`: mesas disponibles en el establecimiento
* `order`: órdenes realizadas por los clientes
* `order_detail`: detalle de productos por orden
* `inventory_movements`: movimientos de inventario

Se respetó el orden de inserción para evitar errores de integridad referencial, comenzando por las tablas principales y finalizando con las dependientes.

---

### Ejemplo aplicado

Se utilizó inserción múltiple para agregar registros de forma eficiente:

```sql
INSERT INTO product (name, description, price)
VALUES 
('Café Americano', 'Café negro tradicional', 35.00),
('Latte', 'Café con leche espumada', 45.00),
('Capuchino', 'Café con leche y espuma', 50.00),
('Pan dulce', 'Pan recién horneado', 25.00),
('Chocolate caliente', 'Bebida caliente de cacao con leche', 40.00);
```

---

### Problemas encontrados

* Errores por omitir el uso de `;` entre instrucciones SQL
* Inconsistencia en nombres de tablas (mayúsculas/minúsculas)
* Uso incorrecto de valores `AUTO_INCREMENT` en inserciones
* Posibles errores de claves foráneas al no respetar el orden de inserción

---

### Soluciones implementadas

* Se corrigió la sintaxis agregando `;` en cada instrucción
* Se estandarizó el uso de nombres en *snake_case*
* Se eliminaron valores manuales en campos autoincrementales
* Se organizó el orden de inserción según dependencias de tablas

---

### Resultados obtenidos

Se logró poblar completamente la base de datos con datos coherentes y relacionados, permitiendo validar el correcto funcionamiento de las tablas y sus relaciones.

La base de datos quedó lista para realizar consultas (`SELECT`) en la siguiente etapa del proyecto.

---

### AI Pair Prompt

**Prompt utilizado:**

> "Necesito generar datos de prueba. Dame un ejemplo de cómo insertar 5 filas en una sola instrucción INSERT."

**Aplicación:**
Se aplicó el concepto de inserción múltiple para poblar las tablas principales del sistema de cafetería, optimizando el proceso de carga de datos.

---
## Semana 10: SQL DML – Basic Queries (C.R.U.D - Read)

### Objetivo de la semana

Aplicar consultas básicas en SQL utilizando las instrucciones `SELECT`, `FROM`, `WHERE` y `ORDER BY`, con el fin de obtener, filtrar y ordenar información almacenada en la base de datos.

---

### Actividades realizadas

Durante esta semana se trabajó en la consulta de datos previamente insertados en la base de datos del sistema de cafetería. Se utilizaron instrucciones `SELECT` para recuperar información de las diferentes tablas, permitiendo visualizar y analizar los datos almacenados.

Se aplicaron filtros mediante la cláusula `WHERE`, así como ordenamientos con `ORDER BY`. También se trabajó con operadores lógicos como `AND` y `OR` para realizar consultas más específicas.

---

### Desarrollo

Se realizaron consultas sobre las siguientes tablas:

* `user`: para visualizar información de los usuarios
* `product`: para consultar el menú de productos
* `order`: para analizar el estado de las órdenes
* `order_detail`: para revisar los productos dentro de cada orden

Se implementaron diferentes tipos de consultas, desde consultas simples hasta consultas con múltiples condiciones, con el objetivo de comprender cómo se manipula la información en una base de datos.

---

### Ejemplo aplicado

Ejemplo de consulta utilizando operadores lógicos:

```sql id="qzslzk"
SELECT *
FROM `order`
WHERE status = 'pending' AND table_id = 1;
```

En este caso se filtran únicamente las órdenes que cumplen ambas condiciones: estar en estado pendiente y pertenecer a una mesa específica.

---

### Problemas encontrados

* Dificultad inicial para entender la diferencia entre los operadores `AND` y `OR`
* Errores en la sintaxis de las consultas, especialmente en la cláusula `WHERE`
* Uso incorrecto de nombres de tablas o columnas

---

### Soluciones implementadas

* Se reforzó el uso de operadores lógicos mediante ejemplos prácticos
* Se revisó la sintaxis correcta de las consultas SQL
* Se estandarizó el uso de nombres de tablas y columnas

---

### Resultados obtenidos

Se logró consultar correctamente la información almacenada en la base de datos, aplicando filtros y ordenamientos. Esto permitió validar que los datos insertados en la semana anterior fueran correctos y útiles para el análisis.

---

### AI Pair Prompt

**Prompt utilizado:**

> "Quiero filtrar los usuarios activos. Explícame cómo funcionan los operadores lógicos AND y OR en la cláusula WHERE."

**Aplicación:**
Se aplicaron operadores `AND` y `OR` en consultas SQL para filtrar datos de manera más precisa, permitiendo obtener resultados específicos según múltiples condiciones.

---

### Conclusión

El uso de consultas básicas en SQL permite acceder y manipular la información de la base de datos de forma eficiente. La correcta aplicación de filtros y operadores lógicos es fundamental para obtener resultados precisos y útiles.

### Conclusión

El uso de `INSERT INTO` con inserciones múltiples permitió poblar eficientemente la base de datos, facilitando la validación del sistema. Esta etapa es fundamental para garantizar que las consultas y operaciones posteriores funcionen correctamente sobre datos reales.

## Semana 11: SQL DML – Updates & Deletes (C.R.U.D - Update/Delete)

### Objetivo de la semana

Aplicar las instrucciones `UPDATE` y `DELETE` para modificar y eliminar datos dentro de la base de datos, comprendiendo la importancia del uso de la cláusula `WHERE` para evitar errores críticos.

---

### Actividades realizadas

Durante esta semana se trabajó en la modificación y eliminación de datos dentro de la base de datos del sistema de cafetería. Se utilizaron las instrucciones `UPDATE` para cambiar valores existentes y `DELETE` para eliminar registros específicos.

Se hizo énfasis en el uso correcto de la cláusula `WHERE` para evitar afectar múltiples registros de forma no intencionada. También se analizaron buenas prácticas para realizar operaciones seguras sobre los datos.

---

### Desarrollo

Se realizaron operaciones sobre diferentes tablas:

* `product`: actualización de precios
* `order`: cambio de estado de órdenes
* `order_detail`: eliminación de registros específicos
* `inventory_movements`: limpieza de datos innecesarios

Se aplicaron condiciones específicas en cada operación para asegurar que solo se modificaran o eliminaran los registros correctos.

---

### Ejemplo aplicado

Ejemplo de actualización de datos:

```sql id="g9y6cd"
UPDATE product
SET price = 38.00
WHERE name = 'Café Americano';
```

Ejemplo de eliminación segura:

```sql id="nn2j9n"
DELETE FROM product
WHERE price < 30;
```

---

### Problemas encontrados

* Riesgo de modificar o eliminar múltiples registros por no utilizar `WHERE`
* Dudas sobre cuándo utilizar `UPDATE` o `DELETE`
* Errores en la definición de condiciones en la cláusula `WHERE`

---

### Soluciones implementadas

* Se reforzó el uso obligatorio de la cláusula `WHERE` en operaciones críticas
* Se utilizó `SELECT` previo para validar los datos antes de eliminarlos
* Se practicaron diferentes escenarios para comprender el impacto de cada instrucción

---

### Resultados obtenidos

Se logró modificar y eliminar datos de manera controlada dentro de la base de datos, manteniendo la integridad de la información. Se comprendió la importancia de aplicar condiciones adecuadas para evitar errores graves.

---

### AI Pair Prompt

**Prompt utilizado:**

> "¿Por qué es peligroso ejecutar un DELETE sin un WHERE? Dame un ejemplo de una buena práctica para prevenir borrar todo por error."

**Aplicación:**
Se identificó que ejecutar un `DELETE` sin `WHERE` elimina todos los registros de una tabla. Como buena práctica, se utilizó una consulta `SELECT` previa con la misma condición para verificar los datos antes de ejecutar la eliminación.

---

### Conclusión

El uso de `UPDATE` y `DELETE` permite mantener la base de datos actualizada, pero requiere precaución. La correcta aplicación de la cláusula `WHERE` es fundamental para evitar la pérdida de información y garantizar la integridad de los datos.

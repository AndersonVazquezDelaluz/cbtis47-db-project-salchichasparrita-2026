# Daily Scrum 


---

## 📅 Semana 9 — Data Seeding (Equipo)

**Lunes:**
Como equipo comenzamos a trabajar en la generación de datos de prueba para la base de datos. Creamos el archivo `02_seed_data.sql` e insertamos los primeros registros en la tabla `user`. También investigamos cómo realizar inserciones múltiples en una sola instrucción.

**Martes:**
Continuamos insertando datos en las tablas `product` y `tables`. Nos enfocamos en que la información fuera coherente con el contexto de una cafetería y verificamos que los tipos de datos coincidieran con la estructura definida.

**Miércoles:**
Trabajamos en la inserción de datos en `order` y `order_detail`. Organizamos el orden de ejecución para evitar errores con las llaves foráneas y validamos que las relaciones entre tablas funcionaran correctamente.

**Jueves:**
Insertamos datos en la tabla `inventory_movements`. Verificamos que los tipos de movimiento (`SALE`, `RESTOCK`) fueran correctos y que las cantidades fueran coherentes.

**Viernes:**
Como equipo realizamos pruebas generales a la base de datos. Ejecutamos consultas básicas para validar que todos los datos se hubieran insertado correctamente y que no existieran problemas de integridad.

---

## 📅 Semana 10 — Consultas (Equipo)

**Lunes:**
Iniciamos la creación del archivo `basic_reports.sql`. Como equipo trabajamos en consultas básicas utilizando `SELECT` para visualizar la información de las tablas principales.

**Martes:**
Aplicamos filtros mediante la cláusula `WHERE`. Probamos diferentes condiciones para obtener datos específicos, como productos por precio y órdenes por estado.

**Miércoles:**
Trabajamos con operadores lógicos `AND` y `OR`. Realizamos pruebas combinando condiciones para entender cómo afectan los resultados.

**Jueves:**
Implementamos `ORDER BY` para ordenar los resultados de las consultas. Probamos ordenar productos por precio y usuarios por nombre.

**Viernes:**
Revisamos todas las consultas realizadas durante la semana. Validamos que funcionaran correctamente y corregimos errores de sintaxis o lógica.

---

## 📅 Semana 11 — Update & Delete (Equipo)

**Lunes:**
Comenzamos el archivo `04_maintenance.sql`. Investigamos el uso de `UPDATE` y realizamos pruebas modificando datos en la tabla `product`.

**Martes:**
Continuamos trabajando con `UPDATE`, aplicando cambios en distintas tablas como `order` y `user`. Verificamos que las modificaciones se realizaran correctamente.

**Miércoles:**
Iniciamos el uso de `DELETE` para eliminar registros específicos. Aplicamos condiciones con `WHERE` para asegurar que solo se eliminaran los datos necesarios.

**Jueves:**
Analizamos el riesgo de ejecutar `DELETE` sin la cláusula `WHERE`. Realizamos pruebas controladas para entender el impacto y reforzar buenas prácticas.

**Viernes:**
Como equipo revisamos todo el archivo de mantenimiento. Validamos que las operaciones fueran seguras y que la base de datos se mantuviera consistente después de los cambios realizados.


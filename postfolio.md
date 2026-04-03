#  Reporte Semanal - Proyecto Base de Datos

##  Proyecto
Creación de una base de datos para la gestión de un restaurante utilizando MySQL mediante XAMPP.

---

##  Semana 1: Creación de estructuras en MySQL (DDL)

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

##  Semana 2: Integridad relacional y restricciones

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

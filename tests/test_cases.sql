# Registro de Pruebas - Módulo Usuarios

**Proyecto:** Café Admin  
**Fecha:** 01 de Mayo 2026  
**Tester:** Anuar David  
**Entorno:** XAMPP + PHP + MySQL (localhost)

---

### Test 1: Inyección SQL en campo NAME
- **Qué se probó:** `' OR '1'='1` y `'; DROP TABLE usuarios;--`
- **Resultado:** No funcionó la inyección. La aplicación rechazó o sanitizó correctamente.
- **Estado:** ✅ PASÓ (buena protección)

### Test 2: Campo NAME con más de 1000 caracteres
- **Qué se probó:** Insertar texto largo (más de 1000 caracteres)
- **Resultado:** La aplicación lo aceptó y guardó.
- **Estado:** ⚠️ FALLÓ (debería tener límite de longitud)

### Test 3: XSS Persistente en campo NAME
- **Qué se probó:** `<script>alert(1)</script>`
- **Resultado:** 
  - Se guardó correctamente en la base de datos.
  - En la interfaz (frontend) aparece en blanco.
- **Estado:** ⚠️ VULNERABILIDAD PARCIAL (Stored XSS posible)
- **Recomendación:** Usar `htmlspecialchars()` al mostrar datos.

### Test 4: Email duplicado
- **Qué se probó:** Crear dos usuarios con el mismo correo.
- **Resultado:** La aplicación detectó el duplicado y no permitió el registro.
- **Estado:** ✅ PASÓ

### Test 5: Campo PASSWORD_HASH con longitud excesiva
- **Qué se probó:** Contraseña de más de 100 caracteres.
- **Resultado:** Permite escribir más de 60 caracteres, pero solo guarda 60 (comportamiento de bcrypt).
- **Estado:** ⚠️ MEJORABLE (debería limitar a 60 caracteres en frontend)

### Test 6: Emojis en contraseña
- **Qué se probó:** Contraseña con emojis (😂🔥)
- **Resultado:** Los aceptó.
- **Estado:** ⚠️ FALLÓ (no recomendado para campo de hash)

---

**Observaciones Generales:**
- El módulo de Usuarios tiene validaciones básicas pero todavía presenta huecos de seguridad (especialmente XSS y longitud de campos).
- Se recomienda mejorar validaciones en backend y escapar salida HTML.

  # Registro de Pruebas - Módulo Direcciones

**Proyecto:** Café Admin  
**Fecha:** 01 de Mayo 2026  
**Tester:** Anuar David  
**Entorno:** XAMPP + PHP + MySQL (localhost)

---

### Test 1: SQL Injection (DROP TABLE)
- **Campo probado:** STREET
- **Valor usado:** `'; DROP TABLE direcciones;--`
- **Resultado:** Se guardó como texto normal. No se eliminó ninguna tabla.
- **Estado:** ✅ PASÓ (buena protección contra SQL Injection)

### Test 2: XSS con onerror alert
- **Campo probado:** STREET
- **Valor usado:** `<img src=x onerror=alert(1)>`
- **Resultado:** Se guardó. Apareció mensaje "localhost:3000 dice 1".
- **Estado:** ⚠️ VULNERABLE (Ejecución de JavaScript detectada)

### Test 3: SQL Injection con OR
- **Campo probado:** STREET
- **Valor usado:** `' OR '1'='1' --`
- **Resultado:** Se guardó como texto normal.
- **Estado:** ✅ PASÓ

### Test 4: Longitud extrema (Sobrecarga)
- **Campo probado:** STREET
- **Valor usado:** Texto de más de 2000 caracteres
- **Resultado:** El sistema limitó la longitud (VARCHAR(100)). Se guardó solo hasta el límite permitido.
- **Estado:** ✅ Correcto

### Test 5: Caracteres especiales + Nulls
- **Campo probado:** STREET y CITY
- **Valor usado:** Vacío, solo espacios, y caracteres especiales
- **Resultado:** Se guardaron sin errores graves. Algunos campos aparecen en blanco en la interfaz.
- **Estado:** ⚠️ MEJORABLE (visualización en frontend)

---

**Observaciones Generales:**
- La base de datos maneja bien las inyecciones SQL.
- Existe posible vulnerabilidad XSS (ejecución de alertas JavaScript).
- Algunos campos se muestran en blanco en la aplicación aunque existen datos en la BD.
- Se recomienda escapar salida HTML y mejorar validaciones en frontend.

  
### MÓDULO MESAS

**Test 1: Números muy grandes**
- TABLE_NUMBER y CAPACITY: `999999999999999999`
- Resultado: La aplicación los aceptó y guardó sin problema.
- Estado: ⚠️ FALLÓ (debería tener un límite razonable, ej. 1-100)

**Test 2: Números negativos y cero**
- TABLE_NUMBER: `-50`
- CAPACITY: `0` y `-10`
- Resultado: La aplicación los rechazó correctamente.
- Estado: ✅ PASÓ

**Test 3: Números decimales**
- TABLE_NUMBER: `10.5`
- CAPACITY: `4.3`
- Resultado: La aplicación los rechazó correctamente.
- Estado: ✅ PASÓ

**Observaciones:**
- Buena validación en números negativos, cero y decimales.
- Mala validación en números extremadamente grandes (puede causar problemas de visualización o rendimiento).

  ### MÓDULO ÓRDENES

**Test 1: Fechas inválidas**
- ORDER_DATE: `26-02-30` (fecha dudosa)
- Resultado: La aplicación lo aceptó sin problema.
- Estado: ⚠️ FALLÓ (debería validar que la fecha sea real)

**Observaciones:** Mala validación de fechas pero furea de eso todo esta bien.


  ### MÓDULO PRODUCTOS

**Test 1: XSS + SQL Injection en NAME**
- NAME: `<script>alert(1)</script>`
- Resultado: Se guardó en la base de datos, pero en la interfaz (lista) aparece sin nombre (en blanco).
- Estado: ⚠️ VULNERABILIDAD (Stored XSS + problema de visualización)

**Test 2: Precio extremo con decimales**
- PRICE: `999999999999.99`
- Resultado: Aceptó el precio grande. Limita correctamente a 2 decimales.
- Estado: ⚠️ FALLÓ (debería tener límite razonable de precio)

**Test 3: Precio negativo / cero**
- PRICE: `-500` y `0`
- Resultado: No afectó / rechazó correctamente.
- Estado: ✅ PASÓ

**Test 4: Nombre muy largo + caracteres especiales**
- NAME: Texto largo + emojis + caracteres especiales
- Resultado: Se guardó, pero saltó el ID (en vez de 4 puso 5). Problema de auto-incremento.
- Estado: ⚠️ ERROR (Salto de ID)

**Test 5: Nombre duplicado (case sensitive)**
- Resultado: No permite duplicados aunque cambies mayúsculas/minúsculas.
- Estado: ✅ PASÓ (buena validación de unicidad)

**Observaciones Generales:**
- Problemas de visualización cuando hay etiquetas HTML en el nombre.
- Salto de IDs en auto-increment (puede indicar errores en inserts fallidos).
- Buena validación en decimales y unicidad de nombre.

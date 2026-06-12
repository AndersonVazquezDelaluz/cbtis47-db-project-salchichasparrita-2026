-- =============================================
-- 03_users.sql
-- Database Administration: Security & Permissions
-- Chicaffe Project - CBTIS 47 (2026)
-- Role: Database Administrator (Matthew Venegas)
-- =============================================

USE restaurant_db;

-- =============================================
-- 1. CREACIÓN DE USUARIOS (Least Privilege Principle)
-- =============================================

-- Usuario para la Aplicación Web (Node.js) - Solo operaciones necesarias
CREATE USER IF NOT EXISTS 'chicaffe_app'@'localhost' 
IDENTIFIED BY 'Chicaffe2026_SecurePass!';

-- Usuario para Reportes / Query Master
CREATE USER IF NOT EXISTS 'chicaffe_reports'@'localhost' 
IDENTIFIED BY 'Reports2026_Secure!';

-- Usuario para Administrador (con más privilegios)
CREATE USER IF NOT EXISTS 'chicaffe_admin'@'localhost' 
IDENTIFIED BY 'Admin2026_StrongPass!!';

-- =============================================
-- 2. ASIGNACIÓN DE PRIVILEGIOS (GRANT)
-- =============================================

-- Usuario de la Aplicación Web (mínimos privilegios necesarios)
GRANT SELECT, INSERT, UPDATE, DELETE 
ON restaurant_db.* 
TO 'chicaffe_app'@'localhost';

-- Usuario para reportes (solo lectura)
GRANT SELECT 
ON restaurant_db.* 
TO 'chicaffe_reports'@'localhost';

-- Usuario Administrador (control total)
GRANT ALL PRIVILEGES 
ON restaurant_db.* 
TO 'chicaffe_admin'@'localhost';

-- =============================================
-- 3. REVOCACIÓN DE PRIVILEGIOS PELIGROSOS
-- =============================================

REVOKE CREATE, DROP, ALTER, INDEX 
ON restaurant_db.* 
FROM 'chicaffe_app'@'localhost';

REVOKE CREATE, DROP, ALTER 
ON restaurant_db.* 
FROM 'chicaffe_reports'@'localhost';

-- =============================================
-- 4. APLICAR CAMBIOS
-- =============================================

FLUSH PRIVILEGES;

-- =============================================
-- 5. VERIFICACIÓN
-- =============================================

SHOW GRANTS FOR 'chicaffe_app'@'localhost';
SHOW GRANTS FOR 'chicaffe_reports'@'localhost';
SHOW GRANTS FOR 'chicaffe_admin'@'localhost';

-- =============================================
-- COMENTARIOS FINALES
-- =============================================
/*
Best Practices aplicadas:
- Principio de Menor Privilegio (Least Privilege)
- Usuarios específicos por rol
- Contraseñas fuertes
- Revocación de privilegios peligrosos (CREATE, DROP, etc.)
*/

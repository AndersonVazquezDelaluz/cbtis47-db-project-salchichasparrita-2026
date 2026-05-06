-- ============================================================
-- 03_users.sql - User Management and Security Strategy
-- Author: Matthew Venegas Rojas - Database Administrator
-- Date: May 2026
-- ============================================================

USE restaurant_db;

-- ------------------------------------------------------------
-- 1. CLEANUP (Make script idempotent)
-- ------------------------------------------------------------
DROP USER IF EXISTS 'restaurant_app_user'@'localhost';
DROP USER IF EXISTS 'restaurant_readonly'@'localhost';

-- ------------------------------------------------------------
-- 2. CREATE APPLICATION USERS
-- ------------------------------------------------------------
CREATE USER IF NOT EXISTS 'restaurant_app_user'@'localhost' 
    IDENTIFIED BY 'CambiaEstaContraseñaPorUnaMuyFuerte2026!';

CREATE USER IF NOT EXISTS 'restaurant_readonly'@'localhost' 
    IDENTIFIED BY 'SoloLectura2026!';

-- ------------------------------------------------------------
-- 3. GRANT PRIVILEGES - Application User (Least Privilege)
-- ------------------------------------------------------------
-- USER table: Protect password_hash (No DELETE allowed)
GRANT SELECT, INSERT, UPDATE ON restaurant_db.`USER` TO 'restaurant_app_user'@'localhost';

-- Operational tables
GRANT SELECT, INSERT, UPDATE, DELETE ON restaurant_db.ADDRESS TO 'restaurant_app_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON restaurant_db.PRODUCT TO 'restaurant_app_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON restaurant_db.TABLES TO 'restaurant_app_user'@'localhost';

-- Orders: Only UPDATE status (soft delete) - No hard DELETE
GRANT SELECT, INSERT, UPDATE ON restaurant_db.`ORDER` TO 'restaurant_app_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON restaurant_db.ORDER_DETAIL TO 'restaurant_app_user'@'localhost';

-- Inventory: Full control (movements can be deleted if needed)
GRANT SELECT, INSERT, UPDATE, DELETE ON restaurant_db.INVENTORY_MOVEMENTS TO 'restaurant_app_user'@'localhost';

-- ------------------------------------------------------------
-- 4. READ-ONLY USER (For reports and analytics)
-- ------------------------------------------------------------
GRANT SELECT ON restaurant_db.* TO 'restaurant_readonly'@'localhost';

-- ------------------------------------------------------------
-- 5. APPLY AND VERIFY
-- ------------------------------------------------------------
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'restaurant_app_user'@'localhost';
SHOW GRANTS FOR 'restaurant_readonly'@'localhost';

-- ============================================================
-- USER MANAGEMENT AND BACKUP STRATEGY
-- ============================================================
/*
USER MANAGEMENT STRATEGY (DBA - Matthew Venegas):

1. Principle of Least Privilege Applied:
   - restaurant_app_user → Controlled write access
   - No DELETE on USER, ORDER and ORDER_DETAIL (use status = 'cancelled')
   - restaurant_readonly → Safe user for Power BI / reports

2. Password Security (Critical):
   - NEVER commit real passwords in Git.
   - Use .env + dotenv in server.js
   - Rotate passwords every 90 days.

3. Backup Strategy (DBA Responsibility):
   - Daily Full Backup:
     mysqldump -u root -p --single-transaction --routines --triggers restaurant_db > backups/backup_$(date +%Y%m%d).sql
   - Weekly compressed backup with 30-day rotation
   - Store backups encrypted in external location (Google Drive / S3)
   - Monthly restore test procedure
   - Point-in-time recovery ready (Binary Logs enabled)
*/


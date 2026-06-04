# Backup and Recovery Strategy

**Project:** Chicaffe — Administration Panel  
**Team:** CBTIS 47 - 2026  
**Role:** Database Administrator (Matthew Venegas)  
**Date:** June 2026  

## 1. Introduction

This document describes the backup and recovery strategy for the `chicaffe_db` database. The goal is to ensure data integrity, minimize data loss (RPO), and reduce downtime (RTO) in case of failure.

## 2. Backup Types

| Type              | Tool                    | Frequency     | Purpose                          | Storage Location      |
|-------------------|-------------------------|---------------|----------------------------------|-----------------------|
| Logical Backup    | mysqldump               | Daily         | Full consistent backup           | Local + External      |
| Schema Only       | mysqldump --no-data     | Weekly        | Structure only                   | GitHub + Local        |
| Data Export       | SELECT ... INTO OUTFILE | On demand     | Specific table exports           | Local                 |

## 3. Backup Commands (Recommended)

### Full Database Backup (Logical + Compressed)
```bash
mysqldump -u chicaffe_admin -p \
  --single-transaction \
  --quick \
  --routines \
  --triggers \
  chicaffe_db | gzip > backups/chicaffe_backup_$(date +%Y%m%d_%H%M%S).sql.gz}
mysqldump -u chicaffe_admin -p \
  --no-data \
  --add-drop-table \
  chicaffe_db > backups/chicaffe_schema_$(date +%Y%m%d).sql
DROP DATABASE IF EXISTS chicaffe_db;
CREATE DATABASE chicaffe_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
gunzip < chicaffe_backup_YYYYMMDD_HHMMSS.sql.gz | mysql -u chicaffe_admin -p chicaffe_db

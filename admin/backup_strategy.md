# Backup and Recovery Strategy

**Project:** Chicaffe — Administration Panel  
**Team:** CBTIS 47 - 2026  
**Role:** Database Administrator (Matthew Venegas)  
**Date:** June 2026  

## 1. Introduction

This document describes the backup and recovery strategy for the `chicaffe_db` database. The goal is to ensure data integrity, minimize data loss (RPO), and reduce downtime (RTO) in case of failure.

## 2. Backup Types

| Type              | Tool              | Frequency       | Purpose                          | Storage Location      |
|-------------------|-------------------|-----------------|----------------------------------|-----------------------|
| Logical Backup    | mysqldump         | Daily           | Full consistent backup           | Local + External      |
| Schema Only       | mysqldump --no-data | Weekly       | Structure only                   | GitHub + Local        |
| Data Export       | SELECT ... INTO OUTFILE | On demand | Specific table exports         | Local                 |

## 3. Backup Commands (Recommended)

### Full Database Backup (Logical)
```bash
mysqldump -u chicaffe_admin -p \
  --single-transaction \
  --quick \
  --lock-tables=false \
  --add-drop-table \
  --add-drop-database \
  --routines \
  --triggers \
  chicaffe_db > backups/chicaffe_backup_$(date +%Y%m%d_%H%M%S).sql

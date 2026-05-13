# ☕ Chicaffe — Administration Panel

![Status](https://img.shields.io/badge/status-development-yellow)
![Node.js](https://img.shields.io/badge/node.js-v18-green)
![MySQL](https://img.shields.io/badge/database-MySQL-blue)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

Aplicación web para la gestión de una cafetería/restaurante.
El sistema permite administrar usuarios, productos, mesas, órdenes e inventario mediante una interfaz web conectada a una base de datos MySQL.

Proyecto académico desarrollado en el **CBTIS 47 — 2026**.

---

# 📚 Table of Contents

* [Descripción](#-descripción)
* [Características](#-características)
* [Tecnologías utilizadas](#-tecnologías-utilizadas)
* [Arquitectura del proyecto](#-arquitectura-del-proyecto)
* [Estructura del proyecto](#-estructura-del-proyecto)
* [Instalación local](#-instalación-local-con-xampp)
* [Uso del sistema](#-uso-del-sistema)
* [API Endpoints](#-api--endpoints-disponibles)
* [Testing](#-testing)
* [Metodología Ágil](#-metodología-ágil)
* [Equipo](#-equipo)
* [Problemas frecuentes](#-problemas-frecuentes)
* [Licencia](#-licencia)

---

# 📖 Descripción

Chicaffe es un sistema de administración para cafeterías desarrollado como proyecto escolar.
El objetivo principal es centralizar la gestión de:

* Usuarios
* Productos
* Mesas
* Órdenes
* Inventario

El sistema permite realizar operaciones CRUD completas utilizando Node.js, Express y MySQL.

---

# ✨ Características

* Gestión de usuarios
* Gestión de productos
* Control de inventario
* Administración de órdenes
* Gestión de mesas
* API REST básica
* Persistencia de datos con MySQL
* Interfaz web administrativa
* Validación de relaciones con Foreign Keys

---

# 🛠️ Tecnologías utilizadas

| Área                 | Tecnología               |
| -------------------- | ------------------------ |
| Backend              | Node.js                  |
| Framework            | Express.js               |
| Base de Datos        | MySQL                    |
| Entorno Local        | XAMPP                    |
| Frontend             | HTML5, CSS3, JavaScript  |
| Conector DB          | mysql2                   |
| Dev Tooling          | Nodemon                  |
| API Testing          | Thunder Client / Postman |
| Control de versiones | Git + GitHub             |

---

# 🏗️ Arquitectura del proyecto

El proyecto sigue una arquitectura cliente-servidor:

* Frontend desarrollado con HTML, CSS y JavaScript vanilla
* Backend desarrollado con Express.js
* Base de datos relacional en MySQL
* Comunicación mediante API REST

---

# 📁 Estructura del proyecto

```bash
cbtis47-db-project-salchichasparrita-2026/
│
├── README.md
├── INSTALL.md
├── ROLES.md
├── package.json
├── server.js
│
├── docs/
│   ├── dictionary.md
│   ├── erd_diagram.md
│   ├── normalization_report.md
│   └── scrum/
│       └── daily/
│
├── public/
│   ├── index.html
│   ├── styles/
│   └── scripts/
│
├── src/
│   ├── 01_schema.sql
│   ├── 02_seed_data.sql
│   ├── 03_users.sql
│   └── 04_maintenance.sql
│
├── queries/
│   ├── basic_reports.sql
│   ├── report_sales.sql
│   └── analysis.sql
│
└── tests/
    ├── bug_report.md
    └── test_cases.sql
```

---

# ⚙️ Instalación local (con XAMPP)

## ✅ Requisitos previos

* Node.js v18 o superior
* XAMPP con MySQL activo
* Git instalado

---

## 🚀 Instalación

```bash
# Clonar repositorio
git clone https://github.com/AndersonVazquezDelaluz/cbtis47-db-project-salchichasparrita-2026.git

# Entrar al proyecto
cd cbtis47-db-project-salchichasparrita-2026

# Instalar dependencias
npm install
```

---

## 🗄️ Configuración de base de datos

1. Abrir phpMyAdmin
2. Crear la base de datos:

```sql
CREATE DATABASE restaurant_db;
```

3. Ejecutar los scripts SQL en este orden:

```text
src/01_schema.sql
src/02_seed_data.sql
src/03_users.sql
```

---

## 🔧 Configuración del servidor

Editar credenciales en `server.js`:

```js
const pool = mysql.createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '',
  database: 'restaurant_db',
});
```

---

## ▶️ Ejecutar proyecto

```bash
npm start
```

Modo desarrollo:

```bash
npm run dev
```

Abrir en navegador:

```text
http://localhost:3000
```

---

# 💻 Uso del sistema

El sistema permite:

* Crear usuarios
* Registrar productos
* Administrar mesas
* Crear órdenes
* Registrar movimientos de inventario
* Consultar reportes básicos

---

# 🌐 API — Endpoints disponibles

Base URL:

```text
http://localhost:3000
```

| Método     | Endpoint         | Descripción |
| ---------- | ---------------- | ----------- |
| GET / POST | `/api/users`     | Usuarios    |
| GET / POST | `/api/products`  | Productos   |
| GET / POST | `/api/orders`    | Órdenes     |
| GET / POST | `/api/tables`    | Mesas       |
| GET / POST | `/api/inventory` | Inventario  |

---

# 🧪 Testing

Los casos de prueba y reportes de errores se encuentran en:

```text
/tests
```

Archivos principales:

* `bug_report.md`
* `test_cases.sql`

---

# 📌 Metodología Ágil

El proyecto fue desarrollado utilizando principios básicos de Scrum:

* Daily Scrum
* Product Backlog
* Historias de Usuario
* Trabajo por Sprints
* Control de versiones con GitHub

---

# 👥 Equipo

| Integrante       | Rol                    |
| ---------------- | ---------------------- |
| Anderson Vázquez | Analyst & Designer     |
| Jayden Reyes     | SQL Developer          |
| Matthew Venegas  | Database Administrator |
| Axel de la Cruz  | Query Master           |
| Anuar Contreras  | SQL Tester             |

---

# ⚠️ Problemas frecuentes

## Error de conexión MySQL

Verificar:

* XAMPP encendido
* Puerto 3306 activo
* Credenciales correctas

---

## Cannot find module 'express'

Ejecutar:

```bash
npm install
```

---

## Puerto 3000 ocupado

Modificar:

```js
const PORT = process.env.PORT || 3001;
```

---

# 📄 Licencia

Proyecto desarrollado con fines educativos para CBTIS 47.

MIT License.

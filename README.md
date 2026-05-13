# ☕ Chicaffe — Administration Panel

![Status](https://img.shields.io/badge/status-development-yellow)
![Node.js](https://img.shields.io/badge/node.js-v18-green)
![MySQL](https://img.shields.io/badge/database-MySQL-blue)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

Web application for restaurant management.
The system allows administrators to manage users, products, tables, orders, and inventory through a web interface connected to a MySQL database.
Academic project developed at **CBTIS 47 — 2026**.

---

# 📚 Table of Contents

* [Description](#-description)
* [Features](#-features)
* [Technologies Used](#-technologies-used)
* [Project Architecture](#-project-architecture)
* [Project Structure](#-project-structure)
* [Local Installation](#-local-installation-with-xampp)
* [System Usage](#-system-usage)
* [API Endpoints](#-api--available-endpoints)
* [Testing](#-testing)
* [Agile Methodology](#-agile-methodology)
* [Team](#-team)
* [Common Issues](#-common-issues)
* [License](#-license)

---

# 📖 Description

Chicaffe is a cafeteria management system developed as a school project.
The main goal is to centralize the management of:

* Users
* Products
* Tables
* Orders
* Inventory

The system supports full CRUD operations using Node.js, Express, and MySQL.

---

# ✨ Features

* User management
* Product management
* Inventory control
* Order administration
* Table management
* Basic REST API
* Data persistence with MySQL
* Administrative web interface
* Relationship validation with Foreign Keys

---

# 🛠️ Technologies Used

| Area                 | Technology               |
| -------------------- | ------------------------ |
| Backend              | Node.js                  |
| Framework            | Express.js               |
| Database             | MySQL                    |
| Local Environment    | XAMPP                    |
| Frontend             | HTML5, CSS3, JavaScript  |
| DB Connector         | mysql2                   |
| Dev Tooling          | Nodemon                  |
| API Testing          | Thunder Client / Postman |
| Version Control      | Git + GitHub             |

---

# 🏗️ Project Architecture

The project follows a client-server architecture:

* Frontend built with HTML, CSS, and vanilla JavaScript
* Backend built with Express.js
* Relational database in MySQL
* Communication via REST API

---

# 📁 Project Structure

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

# ⚙️ Local Installation (with XAMPP)

## ✅ Prerequisites

* Node.js v18 or higher
* XAMPP with MySQL running
* Git installed

---

## 🚀 Installation

```bash
# Clone the repository
git clone https://github.com/AndersonVazquezDelaluz/cbtis47-db-project-salchichasparrita-2026.git

# Enter the project directory
cd cbtis47-db-project-salchichasparrita-2026

# Install dependencies
npm install
```

---

## 🗄️ Database Configuration

1. Open phpMyAdmin
2. Create the database:

```sql
CREATE DATABASE restaurant_db;
```

3. Run the SQL scripts in this order:

```text
src/01_schema.sql
src/02_seed_data.sql
src/03_users.sql
```

---

## 🔧 Server Configuration

Edit the credentials in `server.js`:

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

## ▶️ Run the Project

```bash
npm start
```

Development mode:

```bash
npm run dev
```

Open in browser:

```text
http://localhost:3000
```

---

# 💻 System Usage

The system allows you to:

* Create users
* Register products
* Manage tables
* Create orders
* Record inventory movements
* View basic reports

---

# 🌐 API — Available Endpoints

Base URL:

```text
http://localhost:3000
```

| Method     | Endpoint         | Description |
| ---------- | ---------------- | ----------- |
| GET / POST | `/api/users`     | Users       |
| GET / POST | `/api/products`  | Products    |
| GET / POST | `/api/orders`    | Orders      |
| GET / POST | `/api/tables`    | Tables      |
| GET / POST | `/api/inventory` | Inventory   |

---

# 🧪 Testing

Test cases and bug reports are located in:

```text
/tests
```

Main files:

* `bug_report.md`
* `test_cases.sql`

---

# 📌 Agile Methodology

The project was developed using basic Scrum principles:

* Daily Scrum
* Product Backlog
* User Stories
* Sprint-based workflow
* Version control with GitHub

---

# 👥 Team

| Member           | Role                   |
| ---------------- | ---------------------- |
| Anderson Vázquez | Analyst & Designer     |
| Jayden Reyes     | SQL Developer          |
| Matthew Venegas  | Database Administrator |
| Axel de la Cruz  | Query Master           |
| Anuar Contreras  | SQL Tester             |

---

# ⚠️ Common Issues

## MySQL Connection Error

Check:

* XAMPP is running
* Port 3306 is active
* Credentials are correct

---

## Cannot find module 'express'

Run:

```bash
npm install
```

---

## Port 3000 already in use

Modify:

```js
const PORT = process.env.PORT || 3001;
```

---

# 📄 License

Project developed for educational purposes at CBTIS 47.

MIT License.

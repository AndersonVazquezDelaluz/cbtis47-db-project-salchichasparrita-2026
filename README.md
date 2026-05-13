# ☕ Chicaffe— Panel de Administración

Aplicación web para la gestión de un café/restaurante: productos, mesas, órdenes, usuarios e inventario.
Proyecto escolar desarrollado en el **CBTIS 47**, 2026.

---

## 🛠️ Tecnologías utilizadas

| Capa | Tecnología |
|------|-----------|
| Servidor | Node.js + Express |
| Base de datos | MySQL (via XAMPP en local) |
| Conector DB | mysql2 |
| Frontend | HTML, CSS, JavaScript vanilla |
| Dev tooling | Nodemon |
| Política CORS | cors |

---

## 📁 Estructura del proyecto

```
cbtis47-db-project-salchichasparrita-2026/
│
├── server.js              → Servidor Express + conexión a MySQL
├── package.json           → Dependencias npm
├── INSTALL.md             → Guía detallada de instalación
├── ROLES.md               → Roles del equipo
│
├── public/                → Frontend estático
│   ├── index.html         → Panel de administración
│   ├── styles/
│   │   └── main.css
│   └── scripts/
│       └── app.js         → Lógica del cliente (fetch a la API)
│
├── src/                   → Lógica del backend
├── queries/               → Consultas SQL
├── tests/                 → Pruebas
└── docs/                  → Documentación adicional
```

---

## ⚙️ Instalación local (con XAMPP)

### Requisitos previos

- [Node.js](https://nodejs.org) v18 LTS o superior
- [XAMPP](https://apachefriends.org) con el módulo **MySQL** activo

### Pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/AndersonVazquezDelaluz/cbtis47-db-project-salchichasparrita-2026.git
cd cbtis47-db-project-salchichasparrita-2026

# 2. Instalar dependencias
npm install
```

**3. Crear la base de datos**

Abre phpMyAdmin en `http://localhost/phpmyadmin`, crea una base de datos llamada `restaurant_db` con cotejamiento `utf8mb4_unicode_ci`, y ejecuta el archivo `queries/01_schema.sql`.

**4. Configurar credenciales**

Edita el bloque de conexión en `server.js`:

```js
const pool = mysql.createPool({
  host:     'localhost',
  port:     3306,
  user:     'root',       // usuario de XAMPP (por defecto: root)
  password: '',           // contraseña (por defecto vacía en XAMPP)
  database: 'restaurant_db',
});
```

```bash
# 5. Iniciar el servidor
npm start

# O en modo desarrollo (recarga automática)
npm run dev
```

Abre el panel en: **http://localhost:3000/index.html**

---

## 🌐 API — Endpoints disponibles

Base URL local: `http://localhost:3000`

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET / POST | `/api/users` | Listar / crear usuarios |
| PUT / DELETE | `/api/users/:id` | Editar / eliminar usuario |
| GET / POST | `/api/addresses` | Listar / crear direcciones |
| PUT / DELETE | `/api/addresses/:id` | Editar / eliminar dirección |
| GET / POST | `/api/tables` | Listar / crear mesas |
| PUT / DELETE | `/api/tables/:id` | Editar / eliminar mesa |
| GET / POST | `/api/products` | Listar / crear productos |
| PUT / DELETE | `/api/products/:id` | Editar / eliminar producto |
| GET / POST | `/api/orders` | Listar / crear órdenes |
| PUT / DELETE | `/api/orders/:id` | Editar / eliminar orden |
| GET / POST | `/api/order-details` | Listar / crear detalles de orden |
| PUT / DELETE | `/api/order-details/:id` | Editar / eliminar detalle |
| GET / POST | `/api/inventory` | Listar / registrar movimientos de inventario |
| PUT / DELETE | `/api/inventory/:id` | Editar / eliminar movimiento |

---

## 👥 Equipo

| Nombre | Rol |
|--------|-----|
| Vázquez de la Luz Anderson | Analista & Diseñador |
| de la Cruz Osorio Axel Gabriel | Query Master |
| Reyes Sarmiento Jayden Ivan | SQL Developer |
| Contreras Ríos Anuar David | SQL Tester |
| Venegas Rojas Matthew Elias | Database Administrator |

---

## 🚑 Problemas frecuentes

**Error de conexión a MySQL**
Verifica que XAMPP tenga MySQL encendido y que las credenciales en `server.js` sean correctas.

**`Cannot find module 'express'`**
Ejecuta `npm install` dentro de la carpeta del proyecto.

**Las tablas aparecen vacías**
Abre la consola del navegador (F12) y revisa errores. Confirma que el schema SQL fue ejecutado correctamente en `restaurant_db`.

**Puerto 3000 en uso**
Cambia el puerto al final de `server.js`:
```js
const PORT = process.env.PORT || 3001;
```

---

> Para instrucciones de despliegue en producción (VPS, PM2, Nginx, HTTPS), consulta [`INSTALL.md`](./INSTALL.md).

# Guía de instalación y despliegue — Café Admin

## Contenido

- [Requisitos](#requisitos)
- [Instalación local (XAMPP)](#instalación-local-xampp)
- [Migración a un servidor](#migración-a-un-servidor)
- [Estructura del repositorio](#estructura-del-repositorio)
- [Referencia de endpoints](#referencia-de-endpoints)

---

## Requisitos

### Para correr localmente

| Herramienta | Versión mínima | Descarga |
|---|---|---|
| Node.js | 18 LTS o superior | https://nodejs.org |
| XAMPP (MySQL) | Cualquier versión reciente | https://apachefriends.org |

### Para un servidor en producción

| Herramienta | Versión mínima | Notas |
|---|---|---|
| Node.js | 18 LTS o superior | Instalar con `nvm` recomendado |
| MySQL | 8.0 o superior | O MariaDB 10.6+ |
| PM2 | Cualquiera | Mantiene el servidor corriendo |

---

## Instalación local (XAMPP)

### Paso 1 — Clonar el repositorio

```bash
git clone https://github.com/tu-usuario/tu-repositorio.git
cd tu-repositorio
```

### Paso 2 — Instalar dependencias de Node.js

```bash
npm install
```

### Paso 3 — Configurar la base de datos

**3a.** Abre XAMPP y enciende el módulo **MySQL** (y Apache si quieres usar phpMyAdmin).

**3b.** Crea la base de datos. Tienes dos opciones:

**Opción A — Desde phpMyAdmin (recomendado para principiantes)**

1. Abre `http://localhost/phpmyadmin`
2. Haz clic en **Nueva** (panel izquierdo)
3. Escribe `restaurant_db` como nombre y selecciona `utf8mb4_unicode_ci`
4. Haz clic en **Crear**
5. Selecciona la base de datos recién creada
6. Ve a la pestaña **SQL**
7. Pega el contenido del archivo `sql/01_schema.sql` y ejecuta

**Opción B — Desde la terminal**

```bash
# Accede al cliente MySQL de XAMPP
# En Windows:
"C:\xampp\mysql\bin\mysql.exe" -u root -p

# En macOS/Linux:
/Applications/XAMPP/bin/mysql -u root -p

# Dentro del cliente MySQL:
source sql/01_schema.sql
exit
```

### Paso 4 — Configurar credenciales

Abre el archivo `server.js` y edita el bloque de conexión (líneas ~20–26):

```js
const pool = mysql.createPool({
  host:     'localhost',
  port:     3306,
  user:     'root',      // usuario de MySQL en XAMPP (por defecto es root)
  password: '',          // contraseña (por defecto está vacía en XAMPP)
  database: 'restaurant_db',
});
```

> **Nota:** En XAMPP la contraseña de `root` normalmente está vacía. Si la cambiaste, escríbela aquí.

### Paso 5 — Iniciar el servidor

```bash
npm start
```

Deberías ver en la terminal:

```
✅  Servidor corriendo en http://localhost:3000
📋  Panel de administración: http://localhost:3000/index.html
```

### Paso 6 — Abrir el panel

Abre tu navegador y ve a:

```
http://localhost:3000/index.html
```

---

### Modo desarrollo (recarga automática)

Si estás modificando el código, usa `nodemon` para que el servidor se reinicie solo al guardar cambios:

```bash
npm run dev
```

> Si dice que `nodemon` no está instalado: `npm install -g nodemon`

---

## Migración a un servidor

Esta sección cubre cómo pasar la aplicación a un servidor Linux (Ubuntu/Debian) en la nube, como DigitalOcean, AWS EC2, o cualquier VPS.

---

### Paso 1 — Conectarse al servidor

```bash
ssh usuario@ip-de-tu-servidor
```

---

### Paso 2 — Instalar Node.js en el servidor

Se recomienda instalarlo con `nvm` para facilitar actualizaciones:

```bash
# Instalar nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Recargar el shell
source ~/.bashrc

# Instalar Node.js LTS
nvm install --lts
nvm use --lts

# Verificar instalación
node -v
npm -v
```

---

### Paso 3 — Instalar MySQL en el servidor

```bash
sudo apt update
sudo apt install mysql-server -y

# Configuración de seguridad inicial
sudo mysql_secure_installation
```

Dentro del asistente de seguridad:
- Establece una contraseña fuerte para `root`
- Responde `Y` a eliminar usuarios anónimos
- Responde `Y` a deshabilitar acceso remoto de root
- Responde `Y` a eliminar la base de datos de prueba
- Responde `Y` a recargar los privilegios

---

### Paso 4 — Crear el usuario y la base de datos en MySQL

Es mejor práctica **no usar `root`** en producción. Crea un usuario exclusivo para la aplicación:

```bash
sudo mysql -u root -p
```

Dentro del cliente MySQL:

```sql
-- Crear la base de datos
CREATE DATABASE restaurant_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- Crear un usuario exclusivo para la app
CREATE USER 'cafe_user'@'localhost' IDENTIFIED BY 'EscribeUnaContraseñaFuerte123!';

-- Darle permisos solo sobre restaurant_db
GRANT ALL PRIVILEGES ON restaurant_db.* TO 'cafe_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Ahora importa el schema:

```bash
mysql -u cafe_user -p restaurant_db < sql/01_schema.sql
```

---

### Paso 5 — Subir el código al servidor

**Opción A — Con Git (recomendado)**

```bash
# En el servidor:
git clone https://github.com/tu-usuario/tu-repositorio.git
cd tu-repositorio
npm install --omit=dev
```

**Opción B — Con SCP (copia directa)**

```bash
# Desde tu computadora local:
scp -r ./tu-repositorio usuario@ip-del-servidor:/home/usuario/cafe-admin
```

---

### Paso 6 — Configurar credenciales de producción

Edita `server.js` con los datos del servidor:

```js
const pool = mysql.createPool({
  host:     'localhost',
  port:     3306,
  user:     'cafe_user',                      // el usuario que creaste
  password: 'EscribeUnaContraseñaFuerte123!', // su contraseña
  database: 'restaurant_db',
});
```

> **Buena práctica:** En lugar de escribir la contraseña directo en el código, usa variables de entorno:
>
> ```js
> password: process.env.DB_PASSWORD,
> ```
>
> Y crea un archivo `.env` en el servidor (nunca lo subas a Git):
>
> ```
> DB_PASSWORD=EscribeUnaContraseñaFuerte123!
> ```
>
> Instala `dotenv` con `npm install dotenv` y agrégalo al inicio de `server.js`:
> ```js
> require('dotenv').config();
> ```

---

### Paso 7 — Instalar PM2 y mantener el servidor activo

PM2 es un administrador de procesos que mantiene la app corriendo aunque cierres la terminal o el servidor se reinicie:

```bash
# Instalar PM2 globalmente
npm install -g pm2

# Iniciar la aplicación
pm2 start server.js --name cafe-admin

# Verificar que está corriendo
pm2 status

# Ver los logs en tiempo real
pm2 logs cafe-admin
```

Para que PM2 arranque automáticamente cuando el servidor se reinicie:

```bash
pm2 startup
# PM2 te dará un comando para ejecutar, cópialo y ejecútalo

pm2 save
```

---

### Paso 8 — Configurar un dominio con Nginx (opcional)

Si tienes un dominio y quieres acceder por `https://tudominio.com` en lugar de `http://ip:3000`, instala Nginx como proxy inverso:

```bash
sudo apt install nginx -y
```

Crea un archivo de configuración:

```bash
sudo nano /etc/nginx/sites-available/cafe-admin
```

Pega esta configuración (reemplaza `tudominio.com`):

```nginx
server {
    listen 80;
    server_name tudominio.com www.tudominio.com;

    location / {
        proxy_pass         http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header   Upgrade $http_upgrade;
        proxy_set_header   Connection 'upgrade';
        proxy_set_header   Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

Activa la configuración y reinicia Nginx:

```bash
sudo ln -s /etc/nginx/sites-available/cafe-admin /etc/nginx/sites-enabled/
sudo nginx -t          # verifica que no haya errores
sudo systemctl restart nginx
```

---

### Paso 9 — Habilitar HTTPS con Let's Encrypt (opcional pero recomendado)

```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d tudominio.com -d www.tudominio.com
```

Certbot configura HTTPS automáticamente y renueva el certificado cada 90 días.

---

### Comandos útiles de PM2

```bash
pm2 status              # ver estado de todos los procesos
pm2 restart cafe-admin  # reiniciar la app (después de cambios en server.js)
pm2 stop cafe-admin     # detener la app
pm2 logs cafe-admin     # ver logs en tiempo real
pm2 logs cafe-admin --lines 100  # ver las últimas 100 líneas de log
```

---

## Estructura del repositorio

```
tu-repositorio/
│
├── server.js          → Servidor Node.js + Express (backend)
├── package.json       → Dependencias npm
├── INSTALL.md         → Esta guía
│
├── public/            → Archivos estáticos (frontend)
│   ├── index.html     → Panel de administración
│   ├── styles/
│   │   └── main.css
│   └── scripts/
│       └── app.js     → Lógica del frontend (fetch a la API)
│
└── sql/               → Scripts de base de datos
    ├── 01_schema.sql           → Schema completo (recomendado)
    ├── 01_schema_tables.sql    → Solo tablas (semana 7)
    └── 01_schema_constraints.sql → Solo constraints (semana 8)
```

---

## Referencia de endpoints

Todos los endpoints siguen el patrón REST estándar.
La URL base en local es `http://localhost:3000`.

| Método | Ruta | Acción |
|---|---|---|
| GET | /api/users | Listar usuarios |
| POST | /api/users | Crear usuario |
| PUT | /api/users/:id | Editar usuario |
| DELETE | /api/users/:id | Eliminar usuario |
| GET | /api/addresses | Listar direcciones |
| POST | /api/addresses | Crear dirección |
| PUT | /api/addresses/:id | Editar dirección |
| DELETE | /api/addresses/:id | Eliminar dirección |
| GET | /api/tables | Listar mesas |
| POST | /api/tables | Crear mesa |
| PUT | /api/tables/:id | Editar mesa |
| DELETE | /api/tables/:id | Eliminar mesa |
| GET | /api/products | Listar productos |
| POST | /api/products | Crear producto |
| PUT | /api/products/:id | Editar producto |
| DELETE | /api/products/:id | Eliminar producto |
| GET | /api/orders | Listar órdenes |
| POST | /api/orders | Crear orden |
| PUT | /api/orders/:id | Editar orden |
| DELETE | /api/orders/:id | Eliminar orden |
| GET | /api/order-details | Listar detalles de orden |
| POST | /api/order-details | Crear detalle |
| PUT | /api/order-details/:id | Editar detalle |
| DELETE | /api/order-details/:id | Eliminar detalle |
| GET | /api/inventory | Listar movimientos de inventario |
| POST | /api/inventory | Registrar movimiento |
| PUT | /api/inventory/:id | Editar movimiento |
| DELETE | /api/inventory/:id | Eliminar movimiento |

---

## Solución de problemas frecuentes

**El servidor no arranca / error de conexión a MySQL**
Verifica que XAMPP tenga MySQL encendido y que las credenciales en `server.js` sean correctas.

**Error: `Cannot find module 'express'`**
Ejecuta `npm install` en la carpeta del proyecto.

**La página carga pero las tablas están vacías**
Abre las herramientas de desarrollador del navegador (F12), ve a la pestaña **Console** y revisa si hay errores. Confirma que el schema SQL fue ejecutado correctamente.

**Puerto 3000 ya en uso**
Otro proceso está usando ese puerto. Puedes cambiarlo al final de `server.js`:
```js
const PORT = process.env.PORT || 3001; // cambia 3000 por otro número
```

-- Tabla de Escuelas (para restringir el ámbito)
CREATE TABLE escuelas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Usuarios (padres, hijos, admins)
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,  -- Hasheado en producción
    rol ENUM('padre', 'hijo', 'admin') NOT NULL,
    escuela_id INT,
    padre_id INT,  -- Si es hijo, referencia al padre
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (escuela_id) REFERENCES escuelas(id),
    FOREIGN KEY (padre_id) REFERENCES usuarios(id)
);

-- Tabla de Categorías de gastos (restringidas)
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre ENUM('comida', 'materiales') NOT NULL
);

-- Tabla de Wallets (monederos)
CREATE TABLE wallets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,  -- Debe ser un hijo
    balance DECIMAL(10, 2) DEFAULT 0.00,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabla de Transacciones (asignaciones y gastos)
CREATE TABLE transacciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    wallet_id INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    tipo ENUM('asignacion', 'gasto') NOT NULL,
    categoria_id INT,  -- Solo para gastos
    descripcion VARCHAR(255),
    escuela_id INT,  -- Para verificar que sea dentro de la escuela
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (wallet_id) REFERENCES wallets(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    FOREIGN KEY (escuela_id) REFERENCES escuelas(id)
);
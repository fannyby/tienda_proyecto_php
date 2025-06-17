-- MySQL/MariaDB adapted schema from PostgreSQL export
-- Adaptado para uso en HeidiSQL o cualquier cliente MySQL/MariaDB
-- Fecha: 2025-06-13

CREATE DATABASE IF NOT EXISTS tienda_inventario CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE tienda_inventario;

-- Tabla: categoria
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Tabla: marca
CREATE TABLE marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Tabla: producto
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    id_categoria INT,
    id_marca INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE SET NULL,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca) ON DELETE SET NULL
);

-- Tabla: almacenamiento
CREATE TABLE almacenamiento (
    id_almacenamiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNIQUE,
    capacidad_gb INT,
    tipo VARCHAR(10),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: cpu
CREATE TABLE cpu (
    id_cpu INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNIQUE,
    nucleos INT,
    hilos INT,
    frecuencia_base DECIMAL(4,2),
    frecuencia_turbo DECIMAL(4,2),
    passmark_score INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: gpu
CREATE TABLE gpu (
    id_gpu INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNIQUE,
    vram_gb INT,
    passmark_score INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: memoria
CREATE TABLE memoria (
    id_memoria INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNIQUE,
    capacidad_gb INT,
    tipo VARCHAR(10),
    velocidad_mhz INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: historial_precios_stock
CREATE TABLE historial_precios_stock (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    precio_anterior DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    stock_anterior INT,
    stock_nuevo INT,
    id_categoria INT,
    id_marca INT,
    FOREIGN KEY (producto_id) REFERENCES producto(id_producto) ON DELETE SET NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE SET NULL,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca) ON DELETE SET NULL
);

-- Tabla: log_cambios_stock
CREATE TABLE log_cambios_stock (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    stock_anterior INT,
    stock_nuevo INT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_categoria INT,
    id_marca INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE SET NULL,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca) ON DELETE SET NULL
);

-- Vista: vista_inventario
CREATE VIEW vista_inventario AS
SELECT
    p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    m.nombre AS marca,
    p.precio,
    p.stock
FROM producto p
LEFT JOIN categoria c ON p.id_categoria = c.id_categoria
LEFT JOIN marca m ON p.id_marca = m.id_marca;

-- Vista: vista_productos_detalle
CREATE VIEW vista_productos_detalle AS
SELECT
    p.id_producto,
    p.nombre,
    p.precio,
    p.stock,
    c.nombre AS categoria,
    m.nombre AS marca
FROM producto p
LEFT JOIN categoria c ON p.id_categoria = c.id_categoria
LEFT JOIN marca m ON p.id_marca = m.id_marca;

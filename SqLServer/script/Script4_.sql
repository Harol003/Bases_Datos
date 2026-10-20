******************************************
DROP
******************************************

-- =========================================================
-- EJEMPLO COMPLETO DROP EN SQL SERVER
-- TEMA: TIENDA DE VIDEOJUEGOS
-- =========================================================

-- =========================================================
-- 1. CREAR BASE DE DATOS
-- =========================================================

CREATE DATABASE tienda_videojuegos;
GO

-- =========================================================
-- 2. USAR BASE DE DATOS
-- =========================================================

USE tienda_videojuegos;
GO

-- =========================================================
-- 3. CREAR TABLAS
-- =========================================================

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(100)
);
GO

CREATE TABLE videojuegos (
    id_juego INT PRIMARY KEY,
    nombre_juego VARCHAR(50),
    precio DECIMAL(10,2)
);
GO

CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    cargo VARCHAR(50)
);
GO

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    fecha DATE,
    id_cliente INT,
    id_juego INT,
    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente),
    
    FOREIGN KEY (id_juego)
    REFERENCES videojuegos(id_juego)
);
GO

-- =========================================================
-- 4. INSERTAR DATOS
-- =========================================================

INSERT INTO clientes VALUES (1, 'Harol Torres', 'harol@gmail.com');
INSERT INTO clientes VALUES (2, 'Maria Lopez', 'maria@gmail.com');
GO

INSERT INTO videojuegos VALUES (1, 'FIFA 2026', 250000);
INSERT INTO videojuegos VALUES (2, 'Minecraft', 180000);
GO

INSERT INTO empleados VALUES (1, 'Carlos Perez', 'Administrador');
INSERT INTO empleados VALUES (2, 'Ana Torres', 'Vendedor');
GO

INSERT INTO ventas VALUES (1, '2026-05-15', 1, 1);
INSERT INTO ventas VALUES (2, '2026-05-15', 2, 2);
GO

-- =========================================================
-- 5. CONSULTAR INFORMACION
-- =========================================================

SELECT * FROM clientes;
GO

SELECT * FROM videojuegos;
GO

SELECT * FROM empleados;
GO

SELECT * FROM ventas;
GO

-- =========================================================
-- 6. CONSULTA CON INNER JOIN - RELACION ENTRE TABLAS
-- =========================================================

SELECT
    clientes.nombre,
    videojuegos.nombre_juego,
    ventas.fecha
FROM ventas
INNER JOIN clientes
ON ventas.id_cliente = clientes.id_cliente
INNER JOIN videojuegos
ON ventas.id_juego = videojuegos.id_juego;
GO

-- =========================================================
-- 7. AGREGAR NUEVAS COLUMNAS
-- =========================================================

ALTER TABLE clientes
ADD telefono VARCHAR(20);
GO

ALTER TABLE videojuegos
ADD categoria VARCHAR(50);
GO

-- =========================================================
-- 8. ACTUALIZAR DATOS
-- =========================================================

UPDATE clientes
SET telefono = '3001234567'
WHERE id_cliente = 1;
GO

UPDATE videojuegos
SET categoria = 'Deportes'
WHERE id_juego = 1;
GO

-- =========================================================
-- 9. CONSULTAR CAMBIOS
-- =========================================================

SELECT * FROM clientes;
GO

SELECT * FROM videojuegos;
GO

-- =========================================================
-- 10. ELIMINAR REGISTROS
-- =========================================================

DELETE FROM ventas
WHERE id_venta = 2;
GO

-- CONSULTAR RESULTADOS

SELECT * FROM ventas;
GO

-- =========================================================
-- 11. ELIMINAR COLUMNAS CON DROP COLUMN
-- =========================================================

ALTER TABLE clientes
DROP COLUMN telefono;
GO

ALTER TABLE videojuegos
DROP COLUMN categoria;
GO

-- CONSULTAR ESTRUCTURA FINAL

SELECT * FROM clientes;
GO

SELECT * FROM videojuegos;
GO

-- =========================================================
-- 12. ELIMINAR TABLAS
-- IMPORTANTE:
-- PRIMERO SE ELIMINAN TABLAS HIJAS
-- =========================================================

DROP TABLE ventas;
GO

DROP TABLE empleados;
GO

DROP TABLE videojuegos;
GO

DROP TABLE clientes;
GO

-- =========================================================
-- 13. ELIMINAR BASE DE DATOS
-- =========================================================

USE master;
GO

DROP DATABASE tienda_videojuegos;
GO
********************************************
FUNCIONES AVG Y OPERACIONES BASICAS
********************************************

-- ============================================
-- TALLER DE MOTOS - EJEMPLO COMPLETO SQL SERVER
-- FUNCION AVG() Y OPERACIONES BASICAS SQL
-- ============================================

-- ============================================
-- 1. CREAR BASE DE DATOS
-- ============================================

CREATE DATABASE taller_motos;
GO

-- ============================================
-- 2. USAR LA BASE DE DATOS
-- ============================================

USE taller_motos;
GO

-- ============================================
-- 3. CREAR TABLAS
-- ============================================

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    telefono VARCHAR(20)
);
GO

CREATE TABLE motos (
    id_moto INT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    precio DECIMAL(10,2)
);
GO

CREATE TABLE servicios (
    id_servicio INT PRIMARY KEY,
    descripcion VARCHAR(100),
    costo DECIMAL(10,2),
    id_cliente INT,
    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente)
);
GO

-- ============================================
-- 4. INSERTAR DATOS
-- ============================================

INSERT INTO clientes VALUES (1, 'Harol Torres', '3001112233');
INSERT INTO clientes VALUES (2, 'Maria Lopez', '3015556677');
INSERT INTO clientes VALUES (3, 'Carlos Perez', '3207778899');
GO

INSERT INTO motos VALUES (1, 'Yamaha', 'FZ', 12000000);
INSERT INTO motos VALUES (2, 'Honda', 'CBR', 18000000);
INSERT INTO motos VALUES (3, 'Suzuki', 'Gixxer', 14000000);
GO

INSERT INTO servicios VALUES (1, 'Cambio de aceite', 80000, 1);
INSERT INTO servicios VALUES (2, 'Revision general', 150000, 2);
INSERT INTO servicios VALUES (3, 'Cambio de frenos', 120000, 1);
INSERT INTO servicios VALUES (4, 'Lavado premium', 50000, 3);
GO

-- ============================================
-- 5. CONSULTAR DATOS
-- ============================================

SELECT * FROM clientes;
GO

SELECT * FROM motos;
GO

SELECT * FROM servicios;
GO

-- ============================================
-- 6. USAR FUNCION AVG()
-- ============================================

-- PROMEDIO DEL COSTO DE LOS SERVICIOS

SELECT AVG(costo) AS promedio_servicios
FROM servicios;
GO

-- PROMEDIO DEL PRECIO DE LAS MOTOS

SELECT AVG(precio) AS promedio_motos
FROM motos;
GO

-- ============================================
-- 7. OTRAS FUNCIONES AGREGADAS
-- ============================================

-- VALOR MAXIMO

SELECT MAX(precio) AS moto_mas_costosa
FROM motos;
GO

-- VALOR MINIMO

SELECT MIN(precio) AS moto_mas_economica
FROM motos;
GO

-- CONTAR REGISTROS

SELECT COUNT(*) AS total_clientes
FROM clientes;
GO

-- SUMAR VALORES

SELECT SUM(costo) AS total_servicios
FROM servicios;
GO

-- ============================================
-- 8. ACTUALIZAR DATOS
-- ============================================

UPDATE clientes
SET telefono = '3119998877'
WHERE id_cliente = 1;
GO

-- VERIFICAR CAMBIO

SELECT * FROM clientes;
GO

-- ============================================
-- 9. AGREGAR NUEVA COLUMNA
-- ============================================

ALTER TABLE motos
ADD color VARCHAR(30);
GO

-- ============================================
-- 10. MODIFICAR DATOS NUEVOS
-- ============================================

UPDATE motos
SET color = 'Negro'
WHERE id_moto = 1;
GO

UPDATE motos
SET color = 'Rojo'
WHERE id_moto = 2;
GO

UPDATE motos
SET color = 'Azul'
WHERE id_moto = 3;
GO

-- CONSULTAR TABLA

SELECT * FROM motos;
GO

-- ============================================
-- 11. ELIMINAR REGISTROS
-- ============================================

DELETE FROM servicios
WHERE id_servicio = 4;
GO

-- VERIFICAR ELIMINACION

SELECT * FROM servicios;
GO

-- ============================================
-- 12. ELIMINAR COLUMNA
-- ============================================

ALTER TABLE motos
DROP COLUMN color;
GO

-- CONSULTAR ESTRUCTURA

SELECT * FROM motos;
GO

-- ============================================
-- 13. RELACIONES ENTRE TABLAS
-- ============================================

SELECT 
    clientes.nombre,
    servicios.descripcion,
    servicios.costo
FROM servicios
INNER JOIN clientes
ON servicios.id_cliente = clientes.id_cliente;
GO

-- ============================================
-- 14. ELIMINAR TABLAS
-- ============================================

DROP TABLE servicios;
GO

DROP TABLE motos;
GO

DROP TABLE clientes;
GO

-- ============================================
-- 15. ELIMINAR BASE DE DATOS
-- ============================================

USE master;
GO

DROP DATABASE taller_motos;
GO
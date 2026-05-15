************************************
SELECT
************************************

-- =========================================================
-- PRACTICA COMPLETA DE SELECT EN SQL SERVER
-- CONTEXTO: TALLER DE MOTOS
-- =========================================================

-- =========================================================
-- 1. CREAR BASE DE DATOS
-- =========================================================

CREATE DATABASE taller_selects;
GO

USE taller_selects;
GO

-- =========================================================
-- 2. CREAR TABLAS
-- =========================================================

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(50)
);
GO

CREATE TABLE motos (
    id_moto INT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    precio DECIMAL(10,2),
    id_cliente INT,
    
    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente)
);
GO

CREATE TABLE servicios (
    id_servicio INT PRIMARY KEY,
    descripcion VARCHAR(100),
    costo DECIMAL(10,2),
    fecha DATE,
    id_moto INT,
    
    FOREIGN KEY (id_moto)
    REFERENCES motos(id_moto)
);
GO

-- =========================================================
-- 3. INSERTAR DATOS
-- =========================================================

INSERT INTO clientes VALUES (1, 'Harol Torres', 'Bogota');
INSERT INTO clientes VALUES (2, 'Maria Lopez', 'Soacha');
INSERT INTO clientes VALUES (3, 'Carlos Perez', 'Bogota');
INSERT INTO clientes VALUES (4, 'Ana Torres', 'Medellin');
GO

INSERT INTO motos VALUES (1, 'Yamaha', 'FZ', 12000000, 1);
INSERT INTO motos VALUES (2, 'Honda', 'CBR', 18000000, 2);
INSERT INTO motos VALUES (3, 'Suzuki', 'Gixxer', 14000000, 1);
INSERT INTO motos VALUES (4, 'AKT', 'NKD', 9000000, 3);
GO

INSERT INTO servicios VALUES (1, 'Cambio de aceite', 80000, '2026-05-01', 1);
INSERT INTO servicios VALUES (2, 'Revision general', 150000, '2026-05-03', 2);
INSERT INTO servicios VALUES (3, 'Cambio de frenos', 120000, '2026-05-04', 1);
INSERT INTO servicios VALUES (4, 'Lavado premium', 50000, '2026-05-05', 3);
INSERT INTO servicios VALUES (5, 'Alineacion', 70000, '2026-05-06', 4);
GO

-- =========================================================
-- 4. SELECT BASICO
-- =========================================================

SELECT * FROM clientes;
GO

SELECT * FROM motos;
GO

SELECT * FROM servicios;
GO

-- =========================================================
-- 5. SELECT COLUMNAS ESPECIFICAS
-- =========================================================

SELECT nombre, ciudad
FROM clientes;
GO

SELECT marca, modelo, precio
FROM motos;
GO

-- =========================================================
-- 6. SELECT CON WHERE
-- =========================================================

SELECT *
FROM clientes
WHERE ciudad = 'Bogota';
GO

SELECT *
FROM motos
WHERE precio > 10000000;
GO

-- =========================================================
-- 7. SELECT CON OPERADORES
-- =========================================================

SELECT *
FROM servicios
WHERE costo >= 80000;
GO

SELECT *
FROM servicios
WHERE costo <= 100000;
GO

SELECT *
FROM motos
WHERE precio <> 9000000;
GO

-- =========================================================
-- 8. SELECT CON AND
-- =========================================================

SELECT *
FROM motos
WHERE marca = 'Yamaha'
AND precio > 10000000;
GO

-- =========================================================
-- 9. SELECT CON OR
-- =========================================================

SELECT *
FROM clientes
WHERE ciudad = 'Bogota'
OR ciudad = 'Medellin';
GO

-- =========================================================
-- 10. SELECT CON LIKE
-- =========================================================

SELECT *
FROM clientes
WHERE nombre LIKE 'H%';
GO

SELECT *
FROM motos
WHERE modelo LIKE '%R';
GO

-- =========================================================
-- 11. SELECT CON ORDER BY
-- =========================================================

SELECT *
FROM motos
ORDER BY precio ASC;
GO

SELECT *
FROM motos
ORDER BY precio DESC;
GO

-- =========================================================
-- 12. SELECT CON FUNCIONES AGREGADAS
-- =========================================================

SELECT AVG(precio) AS promedio_motos
FROM motos;
GO

SELECT MAX(precio) AS moto_mas_costosa
FROM motos;
GO

SELECT MIN(precio) AS moto_mas_economica
FROM motos;
GO

SELECT SUM(costo) AS total_servicios
FROM servicios;
GO

SELECT COUNT(*) AS total_clientes
FROM clientes;
GO

-- =========================================================
-- 13. SELECT CON INNER JOIN
-- =========================================================

SELECT
    clientes.nombre,
    motos.marca,
    motos.modelo
FROM motos
INNER JOIN clientes
ON motos.id_cliente = clientes.id_cliente;
GO

-- =========================================================
-- 14. INNER JOIN CON 3 TABLAS
-- =========================================================

SELECT
    clientes.nombre AS cliente,
    motos.marca,
    motos.modelo,
    servicios.descripcion,
    servicios.costo
FROM servicios
INNER JOIN motos
ON servicios.id_moto = motos.id_moto
INNER JOIN clientes
ON motos.id_cliente = clientes.id_cliente;
GO

-- =========================================================
-- 15. SELECT CON ALIAS
-- =========================================================

SELECT
    nombre AS cliente,
    ciudad AS ciudad_cliente
FROM clientes;
GO

-- =========================================================
-- 16. SELECT CON BETWEEN
-- =========================================================

SELECT *
FROM motos
WHERE precio BETWEEN 10000000 AND 15000000;
GO

-- =========================================================
-- 17. SELECT CON IN
-- =========================================================

SELECT *
FROM clientes
WHERE ciudad IN ('Bogota', 'Soacha');
GO

-- =========================================================
-- 18. SELECT CON DISTINCT
-- =========================================================

SELECT DISTINCT ciudad
FROM clientes;
GO

-- =========================================================
-- 19. SELECT CON TOP
-- =========================================================

SELECT TOP 2 *
FROM motos;
GO

-- =========================================================
-- 20. SELECT CON GROUP BY
-- =========================================================

SELECT
    ciudad,
    COUNT(*) AS total_clientes
FROM clientes
GROUP BY ciudad;
GO

-- =========================================================
-- 21. SELECT CON HAVING
-- =========================================================

SELECT
    ciudad,
    COUNT(*) AS cantidad
FROM clientes
GROUP BY ciudad
HAVING COUNT(*) > 1;
GO

-- =========================================================
-- 22. ELIMINAR BASE DE DATOS
-- =========================================================

USE master;
GO

DROP DATABASE taller_selects;
GO
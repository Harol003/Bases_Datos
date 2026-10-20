*******************************************
INNER JOIN + SELECT
*******************************************

-- =========================================================
-- PRACTICA COMPLETA INNER JOIN EN SQL SERVER
-- CONTEXTO: TALLER DE MOTOS
-- =========================================================

-- =========================================================
-- 1. CREAR BASE DE DATOS
-- =========================================================

CREATE DATABASE taller_inner_join;
GO

-- =========================================================
-- 2. USAR BASE DE DATOS
-- =========================================================

USE taller_inner_join;
GO

-- =========================================================
-- 3. CREAR TABLAS
-- =========================================================

-- TABLA CLIENTES
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    telefono VARCHAR(20),
    ciudad VARCHAR(50)
);
GO

-- TABLA MOTOS
CREATE TABLE motos (
    id_moto INT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    placa VARCHAR(10),
    id_cliente INT,

    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente)
);
GO

-- TABLA SERVICIOS
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
-- 4. INSERTAR DATOS
-- =========================================================

INSERT INTO clientes VALUES
(1, 'Harol Torres', '3001112233', 'Bogota'),
(2, 'Maria Lopez', '3014445566', 'Soacha'),
(3, 'Carlos Perez', '3207778899', 'Medellin');
GO

INSERT INTO motos VALUES
(1, 'Yamaha', 'FZ', 'ABC123', 1),
(2, 'Honda', 'CBR', 'XYZ789', 2),
(3, 'Suzuki', 'Gixxer', 'JKL456', 1);
GO

INSERT INTO servicios VALUES
(1, 'Cambio de aceite', 80000, '2026-05-10', 1),
(2, 'Revision general', 150000, '2026-05-11', 2),
(3, 'Cambio de frenos', 120000, '2026-05-12', 3);
GO

-- =========================================================
-- 5. CONSULTAR TABLAS INDIVIDUALES
-- =========================================================

SELECT * FROM clientes;
GO

SELECT * FROM motos;
GO

SELECT * FROM servicios;
GO

-- =========================================================
-- 6. INNER JOIN BASICO
-- RELACION CLIENTES Y MOTOS
-- =========================================================

SELECT
    clientes.nombre,
    motos.marca,
    motos.modelo,
    motos.placa
FROM motos
INNER JOIN clientes
ON motos.id_cliente = clientes.id_cliente;
GO

-- =========================================================
-- EXPLICACION
-- =========================================================

/*
INNER JOIN une tablas relacionadas.

En este ejemplo:

- clientes.id_cliente
se relaciona con
- motos.id_cliente

Esto permite mostrar informacion combinada
de ambas tablas.
*/

-- =========================================================
-- 7. INNER JOIN CON 3 TABLAS
-- =========================================================

SELECT
    clientes.nombre AS cliente,
    clientes.ciudad,
    motos.marca,
    motos.modelo,
    motos.placa,
    servicios.descripcion,
    servicios.costo,
    servicios.fecha
FROM servicios

INNER JOIN motos
ON servicios.id_moto = motos.id_moto

INNER JOIN clientes
ON motos.id_cliente = clientes.id_cliente;
GO

-- =========================================================
-- 8. INNER JOIN CON WHERE
-- =========================================================

SELECT
    clientes.nombre,
    motos.marca,
    servicios.descripcion,
    servicios.costo
FROM servicios

INNER JOIN motos
ON servicios.id_moto = motos.id_moto

INNER JOIN clientes
ON motos.id_cliente = clientes.id_cliente

WHERE servicios.costo > 100000;
GO

-- =========================================================
-- 9. INNER JOIN CON ORDER BY
-- =========================================================

SELECT
    clientes.nombre,
    motos.marca,
    servicios.descripcion,
    servicios.costo
FROM servicios

INNER JOIN motos
ON servicios.id_moto = motos.id_moto

INNER JOIN clientes
ON motos.id_cliente = clientes.id_cliente

ORDER BY servicios.costo DESC;
GO

-- =========================================================
-- 10. INNER JOIN CON ALIAS
-- =========================================================

SELECT
    c.nombre AS cliente,
    m.marca,
    m.modelo,
    s.descripcion,
    s.costo
FROM servicios s

INNER JOIN motos m
ON s.id_moto = m.id_moto

INNER JOIN clientes c
ON m.id_cliente = c.id_cliente;
GO

-- =========================================================
-- 11. INNER JOIN CON FUNCIONES
-- =========================================================

SELECT
    c.nombre,
    COUNT(s.id_servicio) AS total_servicios,
    SUM(s.costo) AS total_pagado,
    AVG(s.costo) AS promedio_servicios
FROM servicios s

INNER JOIN motos m
ON s.id_moto = m.id_moto

INNER JOIN clientes c
ON m.id_cliente = c.id_cliente

GROUP BY c.nombre;
GO

-- =========================================================
-- 12. INNER JOIN CON LIKE
-- =========================================================

SELECT
    c.nombre,
    m.marca,
    s.descripcion
FROM servicios s

INNER JOIN motos m
ON s.id_moto = m.id_moto

INNER JOIN clientes c
ON m.id_cliente = c.id_cliente

WHERE c.nombre LIKE 'H%';
GO

-- =========================================================
-- 13. INNER JOIN CON BETWEEN
-- =========================================================

SELECT
    c.nombre,
    s.descripcion,
    s.costo
FROM servicios s

INNER JOIN motos m
ON s.id_moto = m.id_moto

INNER JOIN clientes c
ON m.id_cliente = c.id_cliente

WHERE s.costo BETWEEN 80000 AND 130000;
GO

-- =========================================================
-- 14. INNER JOIN CON GROUP BY
-- =========================================================

SELECT
    c.ciudad,
    COUNT(s.id_servicio) AS cantidad_servicios
FROM servicios s

INNER JOIN motos m
ON s.id_moto = m.id_moto

INNER JOIN clientes c
ON m.id_cliente = c.id_cliente

GROUP BY c.ciudad;
GO

-- =========================================================
-- 15. ELIMINAR TABLAS
-- =========================================================

DROP TABLE servicios;
GO

DROP TABLE motos;
GO

DROP TABLE clientes;
GO

-- =========================================================
-- 16. ELIMINAR BASE DE DATOS
-- =========================================================

USE master;
GO

DROP DATABASE taller_inner_join;
GO
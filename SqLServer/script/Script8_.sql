*****************************************
SP
*****************************************

-- =========================================================
-- STORE PROCEDURE COMPLETO SQL SERVER
-- CONTEXTO: TALLER DE MOTOS
-- =========================================================

-- =========================================================
-- 1. CREAR BASE DE DATOS
-- =========================================================

CREATE DATABASE taller_motos_sp;
GO

-- =========================================================
-- 2. USAR BASE DE DATOS
-- =========================================================

USE taller_motos_sp;
GO

-- =========================================================
-- 3. CREAR TABLAS
-- =========================================================

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    telefono VARCHAR(20),
    ciudad VARCHAR(50)
);
GO

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
(3, 'Cambio de frenos', 120000, '2026-05-12', 3),
(4, 'Lavado premium', 50000, '2026-05-13', 1);
GO

-- =========================================================
-- 5. CONSULTAS BASICAS
-- =========================================================

SELECT * FROM clientes;
GO

SELECT * FROM motos;
GO

SELECT * FROM servicios;
GO

-- =========================================================
-- 6. CREAR STORE PROCEDURE
-- =========================================================

/*
STORE PROCEDURE:

Es un conjunto de instrucciones SQL
almacenadas dentro de la base de datos.

VENTAJAS:
- Reutilizacion de codigo
- Mayor seguridad
- Mejor rendimiento
- Facil mantenimiento
*/

-- =========================================================
-- 6.1 STORE PROCEDURE PARA MOSTRAR CLIENTES
-- =========================================================

CREATE PROCEDURE sp_obtener_clientes
AS
BEGIN

    SELECT * FROM clientes;

END;
GO

-- EJECUTAR PROCEDIMIENTO

EXEC sp_obtener_clientes;
GO

-- =========================================================
-- 6.2 STORE PROCEDURE CON PARAMETRO
-- =========================================================

CREATE PROCEDURE sp_obtener_motos_por_cliente
    @id_cliente INT
AS
BEGIN

    SELECT
        m.id_moto,
        m.marca,
        m.modelo,
        m.placa,
        c.nombre
    FROM motos m

    INNER JOIN clientes c
    ON m.id_cliente = c.id_cliente

    WHERE m.id_cliente = @id_cliente;

END;
GO

-- EJECUTAR PROCEDIMIENTO

EXEC sp_obtener_motos_por_cliente @id_cliente = 1;
GO

-- =========================================================
-- 6.3 STORE PROCEDURE PARA MOSTRAR SERVICIOS
-- =========================================================

CREATE PROCEDURE sp_obtener_servicios
AS
BEGIN

    SELECT
        s.id_servicio,
        s.descripcion,
        s.costo,
        s.fecha,
        m.marca,
        m.modelo
    FROM servicios s

    INNER JOIN motos m
    ON s.id_moto = m.id_moto;

END;
GO

-- EJECUTAR PROCEDIMIENTO

EXEC sp_obtener_servicios;
GO

-- =========================================================
-- 6.4 STORE PROCEDURE INSERTAR DATOS
-- =========================================================

CREATE PROCEDURE sp_insertar_cliente
    @nombre VARCHAR(50),
    @telefono VARCHAR(20),
    @ciudad VARCHAR(50)
AS
BEGIN

    INSERT INTO clientes
    VALUES (
        (SELECT MAX(id_cliente) + 1 FROM clientes),
        @nombre,
        @telefono,
        @ciudad
    );

END;
GO

-- EJECUTAR PROCEDIMIENTO

EXEC sp_insertar_cliente
    @nombre = 'Ana Torres',
    @telefono = '3118887766',
    @ciudad = 'Cali';
GO

-- VERIFICAR

SELECT * FROM clientes;
GO

-- =========================================================
-- 6.5 STORE PROCEDURE ACTUALIZAR DATOS
-- =========================================================

CREATE PROCEDURE sp_actualizar_telefono
    @id_cliente INT,
    @telefono VARCHAR(20)
AS
BEGIN

    UPDATE clientes
    SET telefono = @telefono
    WHERE id_cliente = @id_cliente;

END;
GO

-- EJECUTAR PROCEDIMIENTO

EXEC sp_actualizar_telefono
    @id_cliente = 1,
    @telefono = '3009998877';
GO

-- VERIFICAR

SELECT * FROM clientes;
GO

-- =========================================================
-- 6.6 STORE PROCEDURE ELIMINAR DATOS
-- =========================================================

CREATE PROCEDURE sp_eliminar_servicio
    @id_servicio INT
AS
BEGIN

    DELETE FROM servicios
    WHERE id_servicio = @id_servicio;

END;
GO

-- EJECUTAR PROCEDIMIENTO

EXEC sp_eliminar_servicio
    @id_servicio = 4;
GO

-- VERIFICAR

SELECT * FROM servicios;
GO

-- =========================================================
-- 6.7 STORE PROCEDURE CON FUNCIONES
-- =========================================================

CREATE PROCEDURE sp_resumen_servicios
AS
BEGIN

    SELECT
        COUNT(*) AS total_servicios,
        SUM(costo) AS total_pagado,
        AVG(costo) AS promedio_servicios,
        MAX(costo) AS servicio_mas_costoso,
        MIN(costo) AS servicio_mas_barato
    FROM servicios;

END;
GO

-- EJECUTAR PROCEDIMIENTO

EXEC sp_resumen_servicios;
GO

-- =========================================================
-- 6.8 STORE PROCEDURE CON INNER JOIN
-- =========================================================

CREATE PROCEDURE sp_historial_cliente
    @id_cliente INT
AS
BEGIN

    SELECT
        c.nombre,
        m.marca,
        m.modelo,
        s.descripcion,
        s.costo,
        s.fecha
    FROM servicios s

    INNER JOIN motos m
    ON s.id_moto = m.id_moto

    INNER JOIN clientes c
    ON m.id_cliente = c.id_cliente

    WHERE c.id_cliente = @id_cliente;

END;
GO

-- EJECUTAR PROCEDIMIENTO

EXEC sp_historial_cliente @id_cliente = 1;
GO

-- =========================================================
-- 7. MOSTRAR TODOS LOS PROCEDIMIENTOS
-- =========================================================

SELECT name
FROM sys.procedures;
GO

-- =========================================================
-- 8. ELIMINAR STORE PROCEDURES
-- =========================================================

DROP PROCEDURE sp_obtener_clientes;
GO

DROP PROCEDURE sp_obtener_motos_por_cliente;
GO

DROP PROCEDURE sp_obtener_servicios;
GO

DROP PROCEDURE sp_insertar_cliente;
GO

DROP PROCEDURE sp_actualizar_telefono;
GO

DROP PROCEDURE sp_eliminar_servicio;
GO

DROP PROCEDURE sp_resumen_servicios;
GO

DROP PROCEDURE sp_historial_cliente;
GO

-- =========================================================
-- 9. ELIMINAR TABLAS
-- =========================================================

DROP TABLE servicios;
GO

DROP TABLE motos;
GO

DROP TABLE clientes;
GO

-- =========================================================
-- 10. ELIMINAR BASE DE DATOS
-- =========================================================

USE master;
GO

DROP DATABASE taller_motos_sp;
GO
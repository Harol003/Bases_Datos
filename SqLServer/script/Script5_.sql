***************************************
CRUD
***************************************

-- =========================================================
-- CRUD COMPLETO SQL SERVER
-- CONTEXTO: TALLER DE MOTOS
-- =========================================================

-- =========================================================
-- 1. CREAR BASE DE DATOS
-- =========================================================

CREATE DATABASE taller_motos_crud;
GO

-- =========================================================
-- 2. USAR BASE DE DATOS
-- =========================================================

USE taller_motos_crud;
GO

-- =========================================================
-- 3. CREAR TABLAS
-- =========================================================

-- TABLA CLIENTES
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    telefono VARCHAR(20)
);
GO

-- TABLA MOTOS
CREATE TABLE motos (
    id_moto INT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    placa VARCHAR(10),
    id_cliente INT,
    
    -- LLAVE FORANEA
    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente)
);
GO

-- TABLA SERVICIOS
CREATE TABLE servicios (
    id_servicio INT PRIMARY KEY,
    descripcion VARCHAR(100),
    costo DECIMAL(10,2),
    id_moto INT,
    
    -- LLAVE FORANEA
    FOREIGN KEY (id_moto)
    REFERENCES motos(id_moto)
);
GO

-- =========================================================
-- EXPLICACION DE LLAVES
-- =========================================================

/*
LLAVE PRIMARIA (PRIMARY KEY)

- Identifica de manera unica cada registro.
- No se puede repetir.
- No permite valores NULL.

Ejemplo:
id_cliente
id_moto
id_servicio

--------------------------------------------

LLAVE FORANEA (FOREIGN KEY)

- Conecta una tabla con otra.
- Permite relacionar informacion.
- Garantiza integridad de datos.

Ejemplo:
id_cliente en motos
relaciona la tabla motos con clientes.

id_moto en servicios
relaciona la tabla servicios con motos.
*/

-- =========================================================
-- CRUD = CREATE
-- INSERTAR DATOS
-- =========================================================

INSERT INTO clientes VALUES (1, 'Harol Torres', '3001112233');
INSERT INTO clientes VALUES (2, 'Maria Lopez', '3014445566');
GO

INSERT INTO motos VALUES (1, 'Yamaha', 'FZ', 'ABC123', 1);
INSERT INTO motos VALUES (2, 'Honda', 'CBR', 'XYZ789', 2);
GO

INSERT INTO servicios VALUES (1, 'Cambio de aceite', 80000, 1);
INSERT INTO servicios VALUES (2, 'Revision general', 150000, 2);
GO

-- =========================================================
-- CRUD = READ
-- CONSULTAR INFORMACION
-- =========================================================

SELECT * FROM clientes;
GO

SELECT * FROM motos;
GO

SELECT * FROM servicios;
GO

-- =========================================================
-- CONSULTA RELACIONANDO TABLAS
-- =========================================================

SELECT
    clientes.nombre AS cliente,
    motos.marca,
    motos.modelo,
    motos.placa,
    servicios.descripcion,
    servicios.costo
FROM servicios
INNER JOIN motos
ON servicios.id_moto = motos.id_moto
INNER JOIN clientes
ON motos.id_cliente = clientes.id_cliente;
GO

-- =========================================================
-- CRUD = UPDATE
-- MODIFICAR INFORMACION
-- =========================================================

UPDATE clientes
SET telefono = '3119998877'
WHERE id_cliente = 1;
GO

UPDATE motos
SET placa = 'MOT2026'
WHERE id_moto = 1;
GO

UPDATE servicios
SET costo = 90000
WHERE id_servicio = 1;
GO

-- =========================================================
-- CONSULTAR CAMBIOS
-- =========================================================

SELECT * FROM clientes;
GO

SELECT * FROM motos;
GO

SELECT * FROM servicios;
GO

-- =========================================================
-- CRUD = DELETE
-- ELIMINAR REGISTROS
-- =========================================================

DELETE FROM servicios
WHERE id_servicio = 2;
GO

-- CONSULTAR RESULTADO

SELECT * FROM servicios;
GO

-- =========================================================
-- AGREGAR NUEVA COLUMNA
-- =========================================================

ALTER TABLE motos
ADD color VARCHAR(30);
GO

-- ACTUALIZAR NUEVA COLUMNA

UPDATE motos
SET color = 'Negro'
WHERE id_moto = 1;
GO

-- CONSULTAR RESULTADO

SELECT * FROM motos;
GO

-- =========================================================
-- ELIMINAR COLUMNA
-- =========================================================

ALTER TABLE motos
DROP COLUMN color;
GO

-- CONSULTAR RESULTADO

SELECT * FROM motos;
GO

-- =========================================================
-- ELIMINAR TABLAS
-- =========================================================

DROP TABLE servicios;
GO

DROP TABLE motos;
GO

DROP TABLE clientes;
GO

-- =========================================================
-- ELIMINAR BASE DE DATOS
-- =========================================================

USE master;
GO

DROP DATABASE taller_motos_crud;
GO
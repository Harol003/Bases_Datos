***********************************************
AVG PROMEDIO
***********************************************

-- Crear base de datos
CREATE DATABASE colegio;
GO

-- Usar la base de datos
USE colegio;
GO

-- Crear tabla
CREATE TABLE notas (
    id INT,
    nota DECIMAL(4,2)
);
GO

-- Insertar datos
INSERT INTO notas VALUES (1, 4.5);
INSERT INTO notas VALUES (2, 3.5);
INSERT INTO notas VALUES (3, 5.0);
GO

-- Calcular promedio con AVG()
SELECT AVG(nota) AS promedio
FROM notas;
GO

***********************************************
CARDINALIDAD
***********************************************

-- Crear base de datos
CREATE DATABASE relaciones;
GO

USE relaciones;
GO

-- Tabla clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Tabla pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    producto VARCHAR(50),
    id_cliente INT,
    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente)
);
GO

-- Insertar datos
INSERT INTO clientes VALUES (1, 'Harol');
INSERT INTO clientes VALUES (2, 'Maria');

INSERT INTO pedidos VALUES (101, 'Teclado', 1);
INSERT INTO pedidos VALUES (102, 'Mouse', 1);
INSERT INTO pedidos VALUES (103, 'Monitor', 2);
GO

-- Consultar relacion
SELECT clientes.nombre, pedidos.producto
FROM clientes
INNER JOIN pedidos
ON clientes.id_cliente = pedidos.id_cliente;
GO

***********************************************
DATA DEFINITION LANGUAGE
***********************************************

-- Crear base de datos
CREATE DATABASE empresa;
GO

USE empresa;
GO

-- CREATE pertenece a DDL
CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    salario INT
);
GO

-- INSERT pertenece a DML
INSERT INTO empleados VALUES (1, 'Harol', 2500);
GO

-- UPDATE pertenece a DML
UPDATE empleados
SET salario = 3000
WHERE id = 1;
GO

-- ALTER pertenece a DDL
ALTER TABLE empleados
ADD correo VARCHAR(100);
GO

-- DROP pertenece a DDL
DROP TABLE empleados;
GO

***********************************************
DATA MANIPULATION LANGUAGE
***********************************************

-- Crear base de datos
CREATE DATABASE tienda;
GO

USE tienda;
GO

-- CREATE pertenece a DDL
CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio INT
);
GO

-- INSERT pertenece a DML
INSERT INTO productos VALUES (1, 'Mouse', 50000);

-- SELECT pertenece a DML
SELECT * FROM productos;

-- UPDATE pertenece a DML
UPDATE productos
SET precio = 60000
WHERE id = 1;

-- DELETE pertenece a DML
DELETE FROM productos
WHERE id = 1;
GO

***********************************************
SQL - STRUCTURED QUERY LANGUAGE
***********************************************

-- SQL significa:
-- Structured Query Language
-- Lenguaje Estructurado de Consulta

-- Crear base de datos
CREATE DATABASE colegio_sql;
GO

USE colegio_sql;
GO

-- Crear tabla
CREATE TABLE estudiantes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);
GO

-- Insertar datos
INSERT INTO estudiantes VALUES (1, 'Harol');
INSERT INTO estudiantes VALUES (2, 'Maria');
GO

-- Consultar datos usando SQL
SELECT * FROM estudiantes;
GO

***********************************************
SGBD - SISTEMA DE GESTION DE BASES DE DATOS
***********************************************

-- Ejemplo de uso de un SGBD

-- Crear base de datos
CREATE DATABASE instituto;
GO

-- Usar la base de datos
USE instituto;
GO

-- Crear tabla
CREATE TABLE profesores (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    especialidad VARCHAR(50)
);
GO

-- Insertar datos
INSERT INTO profesores VALUES (1, 'Harol', 'Bases de Datos');
INSERT INTO profesores VALUES (2, 'Maria', 'Electronica');
GO

-- Consultar informacion
SELECT * FROM profesores;
GO

***********************************************
DDL - DATA DEFINITION LANGUAGE
***********************************************

-- Crear base de datos
CREATE DATABASE biblioteca;
GO

USE biblioteca;
GO

-- CREATE pertenece a DDL
CREATE TABLE libros (
    id INT PRIMARY KEY,
    titulo VARCHAR(50)
);
GO

-- ALTER pertenece a DDL
ALTER TABLE libros
ADD autor VARCHAR(50);
GO

-- DROP pertenece a DDL
DROP TABLE libros;
GO

***********************************************
BASE DE DATOS
***********************************************

-- Crear base de datos
CREATE DATABASE empresa_datos;
GO

USE empresa_datos;
GO

-- Crear tabla
CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    cargo VARCHAR(50)
);
GO

-- Insertar informacion
INSERT INTO empleados VALUES (1, 'Harol', 'Profesor');
INSERT INTO empleados VALUES (2, 'Maria', 'Coordinadora');
GO

-- Consultar informacion almacenada
SELECT * FROM empleados;
GO


***********************************************
PROCEDIMIENTO ALMACENADO - STORE PROCEDURE
***********************************************

-- Crear base de datos
CREATE DATABASE colegio_sp;
GO

USE colegio_sp;
GO

-- Crear tabla
CREATE TABLE estudiantes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);
GO

-- Insertar datos
INSERT INTO estudiantes VALUES (1, 'Harol');
INSERT INTO estudiantes VALUES (2, 'Maria');
GO

-- Crear procedimiento almacenado
CREATE PROCEDURE mostrar_estudiantes
AS
BEGIN
    SELECT * FROM estudiantes;
END;
GO

-- Ejecutar procedimiento almacenado
EXEC mostrar_estudiantes;
GO




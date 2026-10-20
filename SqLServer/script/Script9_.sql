# BASE DE DATOS SQL - POLIBARBERIA

## Autor: [Harol.Torres@pi.edu.co](mailto:Harol.Torres@pi.edu.co)

---

# CREACION DE LA BASE DE DATOS

```sql
/* =========================================================
   BASE DE DATOS: POLIBARBERIA
   AUTOR: Harol.Torres@pi.edu.co
   DESCRIPCION:
   Sistema para administrar una barberia.
   Incluye:
   - Clientes
   - Barberos
   - Servicios
   - Productos
   - Citas

   Todo el codigo esta comentariado paso a paso.
========================================================= */


/* =========================================================
   PASO 1: CREAR LA BASE DE DATOS
========================================================= */

CREATE DATABASE POLIBARBERIA;


/* =========================================================
   PASO 2: USAR LA BASE DE DATOS
========================================================= */

USE POLIBARBERIA;
```

---

# CREACION DE TABLAS

```sql
/* =========================================================
   TABLA 1: CLIENTES
   Esta tabla almacena la informacion de los clientes.
========================================================= */

CREATE TABLE clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100),
    ciudad VARCHAR(50)
);


/* =========================================================
   TABLA 2: BARBEROS
   Guarda la informacion de los trabajadores.
========================================================= */

CREATE TABLE barberos(
    id_barbero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    especialidad VARCHAR(100),
    telefono VARCHAR(20),
    experiencia INT
);


/* =========================================================
   TABLA 3: SERVICIOS
   Guarda los servicios ofrecidos por la barberia.
========================================================= */

CREATE TABLE servicios(
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    nombre_servicio VARCHAR(100),
    precio DECIMAL(10,2),
    duracion_minutos INT
);


/* =========================================================
   TABLA 4: PRODUCTOS
   Guarda productos utilizados en la barberia.
========================================================= */

CREATE TABLE productos(
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100),
    marca VARCHAR(100),
    precio DECIMAL(10,2),
    stock INT
);


/* =========================================================
   TABLA 5: CITAS
   Esta tabla conecta clientes, barberos y servicios.
   Aqui usamos LLAVES FORANEAS.
========================================================= */

CREATE TABLE citas(
    id_cita INT PRIMARY KEY AUTO_INCREMENT,

    id_cliente INT,
    id_barbero INT,
    id_servicio INT,

    fecha DATE,
    hora TIME,
    estado VARCHAR(50),

    /* LLAVES FORANEAS */
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY(id_barbero) REFERENCES barberos(id_barbero),
    FOREIGN KEY(id_servicio) REFERENCES servicios(id_servicio)
);
```

---

# INSERTAR DATOS

## INSERT CLIENTES

```sql
/* =========================================================
   INSERTAR 10 CLIENTES
========================================================= */

INSERT INTO clientes(nombre, apellido, telefono, correo, ciudad) VALUES
('Carlos','Perez','3001111111','carlos1@gmail.com','Soacha'),
('Andres','Torres','3001111112','andres@gmail.com','Bogota'),
('Luis','Gomez','3001111113','luis@gmail.com','Soacha'),
('Juan','Rodriguez','3001111114','juan@gmail.com','Bogota'),
('Pedro','Lopez','3001111115','pedro@gmail.com','Cali'),
('Miguel','Garcia','3001111116','miguel@gmail.com','Medellin'),
('David','Ramirez','3001111117','david@gmail.com','Soacha'),
('Jorge','Castro','3001111118','jorge@gmail.com','Bogota'),
('Santiago','Diaz','3001111119','santiago@gmail.com','Tunja'),
('Felipe','Moreno','3001111120','felipe@gmail.com','Ibague');
```

---

## INSERT BARBEROS

```sql
/* =========================================================
   INSERTAR 10 BARBEROS
========================================================= */

INSERT INTO barberos(nombre, especialidad, telefono, experiencia) VALUES
('Camilo','Fade','3101111111',5),
('Sebastian','Barba','3101111112',7),
('Mateo','Tintes','3101111113',4),
('Daniel','Cortes modernos','3101111114',8),
('Kevin','Fade','3101111115',6),
('Oscar','Barba','3101111116',9),
('Nicolas','Tijera','3101111117',3),
('Cristian','Diseños','3101111118',5),
('Julian','Clasico','3101111119',10),
('Brayan','Fade','3101111120',2);
```

---

## INSERT SERVICIOS

```sql
/* =========================================================
   INSERTAR 10 SERVICIOS
========================================================= */

INSERT INTO servicios(nombre_servicio, precio, duracion_minutos) VALUES
('Corte clasico',15000,30),
('Fade',25000,45),
('Barba',12000,20),
('Cejas',8000,10),
('Tinte',50000,90),
('Corte premium',40000,60),
('Lavado capilar',10000,15),
('Mascarilla facial',20000,25),
('Diseño capilar',18000,20),
('Combo completo',70000,120);
```

---

## INSERT PRODUCTOS

```sql
/* =========================================================
   INSERTAR 10 PRODUCTOS
========================================================= */

INSERT INTO productos(nombre_producto, marca, precio, stock) VALUES
('Gel fijador','Lobo',12000,50),
('Cera mate','BarberPro',18000,40),
('Shampoo','HeadStyle',22000,35),
('Aceite barba','BarberPro',25000,20),
('Talco barberia','Fresh',10000,60),
('Navaja','SteelCut',15000,25),
('Peinilla','Classic',5000,70),
('Spray capilar','Fixer',17000,30),
('Espuma afeitar','Gillette',16000,45),
('Tinte negro','ColorMax',28000,15);
```

---

## INSERT CITAS

```sql
/* =========================================================
   INSERTAR 10 CITAS
========================================================= */

INSERT INTO citas(id_cliente,id_barbero,id_servicio,fecha,hora,estado) VALUES
(1,1,1,'2026-05-01','08:00:00','Finalizada'),
(2,2,2,'2026-05-01','09:00:00','Finalizada'),
(3,3,3,'2026-05-02','10:00:00','Pendiente'),
(4,4,4,'2026-05-02','11:00:00','Finalizada'),
(5,5,5,'2026-05-03','12:00:00','Cancelada'),
(6,6,6,'2026-05-03','13:00:00','Pendiente'),
(7,7,7,'2026-05-04','14:00:00','Finalizada'),
(8,8,8,'2026-05-04','15:00:00','Pendiente'),
(9,9,9,'2026-05-05','16:00:00','Finalizada'),
(10,10,10,'2026-05-05','17:00:00','Pendiente');
```

---

# CONSULTAS SELECT

```sql
/* =========================================================
   CONSULTAR TODOS LOS CLIENTES
========================================================= */

SELECT * FROM clientes;


/* =========================================================
   CONSULTAR TODOS LOS BARBEROS
========================================================= */

SELECT * FROM barberos;


/* =========================================================
   CONSULTAR TODOS LOS SERVICIOS
========================================================= */

SELECT * FROM servicios;


/* =========================================================
   CONSULTAR TODOS LOS PRODUCTOS
========================================================= */

SELECT * FROM productos;


/* =========================================================
   CONSULTAR TODAS LAS CITAS
========================================================= */

SELECT * FROM citas;
```

---

# CONSULTAS UPDATE

```sql
/* =========================================================
   ACTUALIZAR TELEFONO DE UN CLIENTE
========================================================= */

UPDATE clientes
SET telefono = '3209999999'
WHERE id_cliente = 1;


/* =========================================================
   ACTUALIZAR PRECIO DE UN SERVICIO
========================================================= */

UPDATE servicios
SET precio = 30000
WHERE id_servicio = 2;


/* =========================================================
   ACTUALIZAR STOCK DE PRODUCTOS
========================================================= */

UPDATE productos
SET stock = 100
WHERE id_producto = 1;


/* =========================================================
   ACTUALIZAR ESTADO DE UNA CITA
========================================================= */

UPDATE citas
SET estado = 'Finalizada'
WHERE id_cita = 3;
```

---

# CONSULTAS DELETE

```sql
/* =========================================================
   ELIMINAR UN CLIENTE
========================================================= */

DELETE FROM clientes
WHERE id_cliente = 10;


/* =========================================================
   ELIMINAR UN PRODUCTO
========================================================= */

DELETE FROM productos
WHERE id_producto = 10;


/* =========================================================
   ELIMINAR UNA CITA
========================================================= */

DELETE FROM citas
WHERE id_cita = 5;
```

---

# CONSULTAS AVANZADAS

## INNER JOIN

```sql
/* =========================================================
   INNER JOIN
   MUESTRA CLIENTES CON SUS CITAS
========================================================= */

SELECT
clientes.nombre,
clientes.apellido,
servicios.nombre_servicio,
barberos.nombre AS barbero,
citas.fecha,
citas.estado

FROM citas

INNER JOIN clientes
ON citas.id_cliente = clientes.id_cliente

INNER JOIN barberos
ON citas.id_barbero = barberos.id_barbero

INNER JOIN servicios
ON citas.id_servicio = servicios.id_servicio;
```

---

## LEFT JOIN

```sql
/* =========================================================
   LEFT JOIN
   MUESTRA TODOS LOS CLIENTES
   AUNQUE NO TENGAN CITAS
========================================================= */

SELECT
clientes.nombre,
clientes.apellido,
citas.fecha,
citas.estado

FROM clientes

LEFT JOIN citas
ON clientes.id_cliente = citas.id_cliente;
```

---

## RIGHT JOIN

```sql
/* =========================================================
   RIGHT JOIN
   MUESTRA TODAS LAS CITAS
   AUNQUE EL CLIENTE NO EXISTA
========================================================= */

SELECT
clientes.nombre,
clientes.apellido,
citas.fecha,
citas.estado

FROM clientes

RIGHT JOIN citas
ON clientes.id_cliente = citas.id_cliente;
```

---

## LEFT OUTER JOIN

```sql
/* =========================================================
   LEFT OUTER JOIN
   ES IGUAL A LEFT JOIN
========================================================= */

SELECT
clientes.nombre,
clientes.apellido,
citas.estado

FROM clientes

LEFT OUTER JOIN citas
ON clientes.id_cliente = citas.id_cliente;
```

---

## RIGHT OUTER JOIN

```sql
/* =========================================================
   RIGHT OUTER JOIN
   ES IGUAL A RIGHT JOIN
========================================================= */

SELECT
clientes.nombre,
clientes.apellido,
citas.estado

FROM clientes

RIGHT OUTER JOIN citas
ON clientes.id_cliente = citas.id_cliente;
```

---

# CONSULTAS ADICIONALES

```sql
/* =========================================================
   MOSTRAR CLIENTES DE SOACHA
========================================================= */

SELECT * FROM clientes
WHERE ciudad = 'Soacha';


/* =========================================================
   MOSTRAR SERVICIOS MAYORES A 20000
========================================================= */

SELECT * FROM servicios
WHERE precio > 20000;


/* =========================================================
   MOSTRAR PRODUCTOS CON STOCK BAJO
========================================================= */

SELECT * FROM productos
WHERE stock < 30;


/* =========================================================
   CONTAR CLIENTES
========================================================= */

SELECT COUNT(*) AS total_clientes
FROM clientes;


/* =========================================================
   PROMEDIO DE PRECIOS DE SERVICIOS
========================================================= */

SELECT AVG(precio) AS promedio_servicios
FROM servicios;
```

---

# EXPLICACION FINAL

```sql
/* =========================================================
   RESUMEN DEL PROYECTO

   1. Se creo la base de datos POLIBARBERIA.
   2. Se crearon 5 tablas relacionadas.
   3. Se usaron llaves foraneas.
   4. Se insertaron 50 registros.
   5. Se realizaron consultas:
      - SELECT
      - UPDATE
      - DELETE
      - INNER JOIN
      - LEFT JOIN
      - RIGHT JOIN
      - LEFT OUTER JOIN
      - RIGHT OUTER JOIN

   Este proyecto permite administrar una barberia
   de manera organizada utilizando SQL.
========================================================= */
```

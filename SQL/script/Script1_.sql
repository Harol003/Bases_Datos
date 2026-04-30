/* ============================================================
   BASE DE DATOS: polibici
   DESCRIPCIÓN: Sistema de tienda de bicicletas
   OBJETIVO: Enseñar estructura real de bases de datos relacionales

   IMPORTANTE:
   Este script incluye explicaciones detalladas de:
   - PRIMARY KEY
   - FOREIGN KEY
   - CONSTRAINT
   - REFERENCES
   - ALTER DATABASE
   ============================================================ */


-- ============================================================
-- 1. VALIDAR SI LA BASE DE DATOS EXISTE
-- ============================================================

-- DB_ID('polibici') devuelve el ID de la base de datos si existe
-- Si no existe, devuelve NULL
IF DB_ID('polibici') IS NOT NULL
BEGIN
    /* 
       ALTER DATABASE:
       Permite modificar propiedades de la base de datos.

       SINGLE_USER:
       Pone la base de datos en modo de un solo usuario.
       Esto es necesario para poder eliminarla si hay conexiones activas.

       WITH ROLLBACK IMMEDIATE:
       Fuerza el cierre inmediato de todas las conexiones abiertas
       y revierte cualquier transacción en curso.
    */
    ALTER DATABASE polibici SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Elimina completamente la base de datos
    DROP DATABASE polibici;
END
GO

-- ============================================================
-- 2. CREAR BASE DE DATOS
-- ============================================================

-- CREATE DATABASE crea una nueva base de datos
CREATE DATABASE polibici;
GO

-- USE selecciona la base de datos activa
USE polibici;
GO


-- ============================================================
-- 3. TABLA: ROLES
-- ============================================================

CREATE TABLE roles (

    /* 
       PRIMARY KEY:
       Identifica de forma única cada registro de la tabla.
       No puede repetirse ni ser NULL.

       IDENTITY(1,1):
       Genera valores automáticos:
       - Empieza en 1
       - Incrementa de 1 en 1
    */
    id_rol INT IDENTITY(1,1) PRIMARY KEY,

    -- NOT NULL obliga a que el campo tenga valor
    -- UNIQUE evita valores repetidos
    nombre VARCHAR(50) NOT NULL UNIQUE,

    descripcion VARCHAR(200),

    -- DEFAULT asigna valor automáticamente si no se envía dato
    fecha_creacion DATETIME DEFAULT GETDATE()
);
GO


-- ============================================================
-- 4. TABLA: USUARIOS
-- ============================================================

CREATE TABLE usuarios (

    id_usuario INT IDENTITY(1,1) PRIMARY KEY,

    -- Esta columna será una llave foránea
    id_rol INT NOT NULL,

    nombre VARCHAR(100) NOT NULL,

    correo VARCHAR(100) NOT NULL UNIQUE,

    contrasena VARCHAR(255) NOT NULL,

    estado BIT DEFAULT 1,

    fecha_creacion DATETIME DEFAULT GETDATE(),

    /* 
       CONSTRAINT:
       Permite definir reglas en la base de datos.

       fk_usuario_rol:
       Nombre de la restricción (buena práctica nombrarlas)

       FOREIGN KEY:
       Indica que este campo depende de otra tabla.

       (id_rol):
       Campo en esta tabla

       REFERENCES roles(id_rol):
       Hace referencia a la tabla 'roles' y su columna 'id_rol'

       SIGNIFICADO:
       No se puede insertar un usuario con un rol que no exista.
    */
    CONSTRAINT fk_usuario_rol
    FOREIGN KEY (id_rol)
    REFERENCES roles(id_rol)
);
GO


-- ============================================================
-- 5. TABLA: CLIENTES
-- ============================================================

CREATE TABLE clientes (

    id_cliente INT IDENTITY(1,1) PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    -- UNIQUE evita duplicidad de documentos
    documento VARCHAR(20) UNIQUE,

    telefono VARCHAR(20),

    direccion VARCHAR(150),

    email VARCHAR(100),

    fecha_registro DATETIME DEFAULT GETDATE()
);
GO


-- ============================================================
-- 6. TABLA: CATEGORIAS
-- ============================================================

CREATE TABLE categorias (

    id_categoria INT IDENTITY(1,1) PRIMARY KEY,

    nombre VARCHAR(50) NOT NULL UNIQUE,

    descripcion VARCHAR(150)
);
GO


-- ============================================================
-- 7. TABLA: PRODUCTOS
-- ============================================================

CREATE TABLE productos (

    id_producto INT IDENTITY(1,1) PRIMARY KEY,

    -- Relación con categorias
    id_categoria INT NOT NULL,

    nombre VARCHAR(100) NOT NULL,

    descripcion VARCHAR(200),

    precio DECIMAL(10,2) NOT NULL,

    stock INT DEFAULT 0,

    /* 
       FOREIGN KEY:
       Relaciona productos con categorias.

       Un producto SIEMPRE debe pertenecer a una categoría válida.
    */
    CONSTRAINT fk_producto_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES categorias(id_categoria)
);
GO


-- ============================================================
-- 8. TABLA: PROVEEDORES
-- ============================================================

CREATE TABLE proveedores (

    id_proveedor INT IDENTITY(1,1) PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    telefono VARCHAR(20),

    email VARCHAR(100),

    direccion VARCHAR(150)
);
GO


-- ============================================================
-- 9. TABLA: COMPRAS
-- ============================================================

CREATE TABLE compras (

    id_compra INT IDENTITY(1,1) PRIMARY KEY,

    id_proveedor INT NOT NULL,

    fecha DATETIME DEFAULT GETDATE(),

    /*
       RELACIÓN:
       Una compra pertenece a un proveedor.

       Esto garantiza integridad referencial:
       No puede existir una compra sin proveedor válido.
    */
    CONSTRAINT fk_compra_proveedor
    FOREIGN KEY (id_proveedor)
    REFERENCES proveedores(id_proveedor)
);
GO


-- ============================================================
-- 10. DETALLE DE COMPRAS
-- ============================================================

CREATE TABLE detalle_compras (

    id_detalle INT IDENTITY(1,1) PRIMARY KEY,

    id_compra INT NOT NULL,

    id_producto INT NOT NULL,

    cantidad INT NOT NULL,

    precio DECIMAL(10,2) NOT NULL,

    /*
       Relación con compras (cabecera)
       Una compra puede tener varios productos
    */
    CONSTRAINT fk_detalle_compra
    FOREIGN KEY (id_compra)
    REFERENCES compras(id_compra),

    /*
       Relación con productos
       Indica qué producto se compró
    */
    CONSTRAINT fk_detalle_producto
    FOREIGN KEY (id_producto)
    REFERENCES productos(id_producto)
);
GO


-- ============================================================
-- 11. TABLA: VENTAS
-- ============================================================

CREATE TABLE ventas (

    id_venta INT IDENTITY(1,1) PRIMARY KEY,

    id_cliente INT,

    id_usuario INT,

    fecha DATETIME DEFAULT GETDATE(),

    /*
       Relación con clientes:
       Una venta puede estar asociada a un cliente
    */
    CONSTRAINT fk_venta_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente),

    /*
       Relación con usuarios:
       Indica qué empleado realizó la venta
    */
    CONSTRAINT fk_venta_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios(id_usuario)
);
GO


-- ============================================================
-- 12. DETALLE DE VENTAS
-- ============================================================

CREATE TABLE detalle_ventas (

    id_detalle INT IDENTITY(1,1) PRIMARY KEY,

    id_venta INT NOT NULL,

    id_producto INT NOT NULL,

    cantidad INT NOT NULL,

    precio DECIMAL(10,2) NOT NULL,

    /*
       Relación con ventas
       Una venta tiene múltiples productos
    */
    CONSTRAINT fk_detalle_venta
    FOREIGN KEY (id_venta)
    REFERENCES ventas(id_venta),

    /*
       Relación con productos
       Indica qué producto se vendió
    */
    CONSTRAINT fk_detalle_venta_producto
    FOREIGN KEY (id_producto)
    REFERENCES productos(id_producto)
);
GO
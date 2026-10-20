
-- CREACION DE LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS ColegioElectronica;
USE ColegioElectronica;

-- CREACION DE TABLAS
CREATE TABLE Estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    grado VARCHAR(20),
    edad INT
);

CREATE TABLE Profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);

CREATE TABLE Materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    intensidad_horaria INT
);

CREATE TABLE Clases (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    id_materia INT,
    id_profesor INT,
    salon VARCHAR(20),
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia),
    FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor)
);

CREATE TABLE Matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_clase INT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

CREATE TABLE Notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT,
    nota DECIMAL(3,1),
    observacion TEXT,
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula)
);

CREATE TABLE Padres (
    id_padre INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Estudiante_Padre (
    id_estudiante INT,
    id_padre INT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_padre) REFERENCES Padres(id_padre)
);

CREATE TABLE EquiposElectronicos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100),
    descripcion TEXT,
    cantidad_disponible INT
);

CREATE TABLE PrestamosEquipos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_equipo INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_equipo) REFERENCES EquiposElectronicos(id_equipo)
);

-- INSERTANDO DATOS DE EJEMPLO
INSERT INTO Estudiantes (nombre, grado, edad) VALUES 
('Carlos Martínez', '6A', 11), ('Laura Rodríguez', '6A', 11), ('Sofía Gómez', '6B', 12),
('Juan Pérez', '7A', 12), ('Ana Morales', '7A', 13), ('Mario Torres', '8B', 13),
('Lucía Sánchez', '8B', 13), ('Andrés Ramírez', '9A', 14), ('Valentina Ruiz', '9B', 14),
('Daniel Castro', '10A', 15);

INSERT INTO Profesores (nombre, especialidad) VALUES 
('Andrés López', 'Electrónica'), ('Marta Cárdenas', 'Matemáticas'), ('Luis Herrera', 'Tecnología'),
('Paola Jiménez', 'Informática'), ('Carlos Rico', 'Física'), ('Sandra Mora', 'Química'),
('Héctor Guzmán', 'Electricidad'), ('María Patiño', 'Robótica'), ('Germán Vega', 'Sistemas'),
('Liliana Álvarez', 'Ciencias');

INSERT INTO Materias (nombre, intensidad_horaria) VALUES 
('Electrónica Básica', 3), ('Matemáticas', 4), ('Física', 3), ('Tecnología', 2),
('Robótica', 3), ('Informática', 2), ('Electricidad', 3), ('Ciencias Naturales', 4),
('Programación', 3), ('Diseño de Circuitos', 2);

-- Suponiendo combinaciones aleatorias de clases
INSERT INTO Clases (id_materia, id_profesor, salon) VALUES 
(1, 1, 'A1'), (2, 2, 'B1'), (3, 5, 'C2'), (4, 3, 'A2'), (5, 8, 'B2'),
(6, 4, 'C1'), (7, 7, 'D1'), (8, 10, 'A3'), (9, 9, 'B3'), (10, 1, 'D2');

-- Matriculas aleatorias
INSERT INTO Matriculas (id_estudiante, id_clase) VALUES 
(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10);

-- Notas asignadas
INSERT INTO Notas (id_matricula, nota, observacion) VALUES 
(1, 4.5, 'Muy buen desempeño'), (2, 3.8, 'Debe mejorar en participación'),
(3, 4.0, 'Cumple con lo requerido'), (4, 2.9, 'Debe reforzar temas'), 
(5, 5.0, 'Excelente trabajo'), (6, 3.5, 'Buen trabajo'), (7, 4.8, 'Participativo y responsable'), 
(8, 3.0, 'Promedio aceptable'), (9, 4.1, 'Buen rendimiento'), (10, 3.2, 'Puede mejorar');

-- Padres y relaciones
INSERT INTO Padres (nombre, telefono) VALUES 
('Rosa Martínez', '3112223344'), ('Jorge Rodríguez', '3105556677'),
('Natalia Gómez', '3121234567'), ('Luis Pérez', '3208765432'), 
('Sandra Morales', '3009988776'), ('Pedro Torres', '3136677889'),
('Carmen Sánchez', '3145566778'), ('Marcos Ramírez', '3199988776'), 
('Claudia Ruiz', '3011122334'), ('Jaime Castro', '3154455667');

INSERT INTO Estudiante_Padre (id_estudiante, id_padre) VALUES 
(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10);

-- Equipos electrónicos y préstamos
INSERT INTO EquiposElectronicos (nombre_equipo, descripcion, cantidad_disponible) VALUES 
('Multímetro', 'Para medir voltaje, corriente y resistencia', 5),
('Arduino Uno', 'Placa de desarrollo de microcontroladores', 10),
('Protoboard', 'Tablero para prototipos electrónicos', 15),
('Sensor de temperatura', 'Sensor tipo LM35', 8),
('Cables de conexión', 'Paquete de cables macho-macho', 20),
('Fuente de poder', 'Fuente variable 0-30V', 3),
('Osciloscopio', 'Instrumento para observar señales', 2),
('Kit de resistencias', 'Resistencias variadas', 25),
('Motor DC', 'Motor eléctrico de corriente continua', 7),
('LEDs', 'Diodos emisores de luz de colores variados', 30);

INSERT INTO PrestamosEquipos (id_estudiante, id_equipo, fecha_prestamo, fecha_devolucion) VALUES 
(1,1,'2025-05-20','2025-05-22'), (2,2,'2025-05-19','2025-05-21'),
(3,3,'2025-05-18','2025-05-20'), (4,4,'2025-05-17','2025-05-19'), 
(5,5,'2025-05-16','2025-05-18'), (6,6,'2025-05-15','2025-05-17'), 
(7,7,'2025-05-14','2025-05-16'), (8,8,'2025-05-13','2025-05-15'), 
(9,9,'2025-05-12','2025-05-14'), (10,10,'2025-05-11','2025-05-13');

-- CONSULTAS CON JOINs
-- 1. Consultar nombre del estudiante, clase, materia y profesor asociado
SELECT e.nombre AS estudiante, m.nombre AS materia, p.nombre AS profesor
FROM Matriculas mat
JOIN Estudiantes e ON mat.id_estudiante = e.id_estudiante
JOIN Clases c ON mat.id_clase = c.id_clase
JOIN Materias m ON c.id_materia = m.id_materia
JOIN Profesores p ON c.id_profesor = p.id_profesor;

-- 2. Consultar notas de estudiantes con nombre del estudiante, materia y nota
SELECT e.nombre, m.nombre AS materia, n.nota, n.observacion
FROM Notas n
JOIN Matriculas mat ON n.id_matricula = mat.id_matricula
JOIN Estudiantes e ON mat.id_estudiante = e.id_estudiante
JOIN Clases c ON mat.id_clase = c.id_clase
JOIN Materias m ON c.id_materia = m.id_materia;

-- 3. Ver préstamos de equipos con nombre del estudiante y nombre del equipo
SELECT e.nombre AS estudiante, eq.nombre_equipo, p.fecha_prestamo, p.fecha_devolucion
FROM PrestamosEquipos p
JOIN Estudiantes e ON p.id_estudiante = e.id_estudiante
JOIN EquiposElectronicos eq ON p.id_equipo = eq.id_equipo;

--- Join

-- Tipos comunes de JOIN:
-- Tipo de JOIN    Explicación
-- INNER JOIN  Devuelve solo las filas que tienen coincidencias en ambas tablas.
-- LEFT JOIN o LEFT OUTER JOIN Devuelve todas las filas de la tabla izquierda y las coincidencias de la derecha. Si no hay coincidencia, muestra NULL.
-- RIGHT JOIN o RIGHT OUTER JOIN   Lo opuesto al LEFT JOIN.
-- FULL JOIN o FULL OUTER JOIN Devuelve todas las filas cuando hay coincidencia en una de las tablas (no soportado por MySQL directamente sin UNION).
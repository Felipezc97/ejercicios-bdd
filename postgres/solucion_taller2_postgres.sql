-- =================================================
-- TALLER 2 (Fundamentos de bases de datos)
-- Realizado por: Felipe Zumarraga
-- Motor: PostgreSQL
-- =================================================

-- Preparacion de la base de datos para el taller
CREATE DATABASE ejercicios_bdd;

-- Usar la base de datos de ejercicios
\c ejercicios_bdd

-- PARTE 1: creacion tabla estudiantes
CREATE TABLE estudiantes (
	id_estudiante INT,
	nombres VARCHAR(50),
	apellidos VARCHAR(50),
	edad INT,
	curso VARCHAR(50),
	fecha_registro VARCHAR(10)
);

-- PARTE 2: definicion de clave primaria
ALTER TABLE estudiantes ADD PRIMARY KEY (id_estudiante);

-- PARTE 3: insercion inicial de datos

-- Inserts individuales (menor rendimiento)
INSERT INTO estudiantes VALUES (1, 'Juan', 'Perez', 20, 'Programacion', '2026-05-12');
INSERT INTO estudiantes VALUES (2, 'Raul', 'Ortiz', 18, 'Redes', '2026-05-12');
INSERT INTO estudiantes VALUES (3, 'Lucia', 'Morales', 26, 'Base de Datos', '2026-05-12');
INSERT INTO estudiantes VALUES (4, 'Miguel', 'Fernandez', 23, 'Sistemas', '2026-05-12');
INSERT INTO estudiantes VALUES (5, 'Olga', 'Ruiz', 29, 'Base de Datos', '2026-05-12');

-- Insert multiple (mayor rendimiento)
INSERT INTO estudiantes VALUES
	(6, 'Sofia', 'Perez', 22, 'Programacion', '2024-06-19'),
	(7, 'Jorge', 'Perez', 28, 'Sistemas', '2022-04-24'),
	(8, 'Maria', 'Perez', 25, 'Redes', '2019-01-07'),
	(9, 'Pedro', 'Perez', 19, 'Redes', '2015-11-11'),
	(10, 'Laura', 'Perez', 31, 'Base de Datos', '2025-09-18');

-- PARTE 4: consultas basicas

-- Mostrar todos los registros
SELECT * FROM estudiantes;

-- Mostrar solo nombres y apellidos
SELECT nombres, apellidos FROM estudiantes;

-- Mostrar estudiantes mayores de 18 años
SELECT * FROM estudiantes WHERE edad >= 18;

-- Mostrar estudiantes con edad entre 18 y 25 años
SELECT * FROM estudiantes WHERE edad >= 18 AND edad <= 25;

-- Mostrar estudiantes del curso de Base de Datos
SELECT * FROM estudiantes WHERE curso = 'Base de Datos';

-- Mostrar estudiantes registrados después del 2026-03-01
SELECT * FROM estudiantes WHERE fecha_registro > '2026-03-01'

-- Mostrar estudiantes registrados entre 2026-01-01 y 2026-04-30
SELECT * FROM estudiantes WHERE fecha_registro >= '2026-01-01' AND fecha_registro <= '2026-04-30';

-- PARTE 5: actualizacion de registros

UPDATE estudiantes SET fecha_registro = '2026-01-10' WHERE id_estudiante = 2;
UPDATE estudiantes SET fecha_registro = '2023-04-19' WHERE id_estudiante = 3;
UPDATE estudiantes SET fecha_registro = '2025-12-02' WHERE id_estudiante = 4;
UPDATE estudiantes SET fecha_registro = '2018-03-03' WHERE id_estudiante = 5;
UPDATE estudiantes SET apellidos = 'Diaz' WHERE id_estudiante = 7;
UPDATE estudiantes SET apellidos = 'Cadena' WHERE id_estudiante = 8;
UPDATE estudiantes SET apellidos = 'Rodriguez' WHERE id_estudiante = 9;
UPDATE estudiantes SET apellidos = 'Baez' WHERE id_estudiante = 10;
UPDATE estudiantes SET nombres = 'Pedro', apellidos = 'Picapiedra', curso = 'Plataformas Low-Code' where id_estudiante = 1;

-- PARTE 6: eliminacion de registros
DELETE FROM estudiantes WHERE id_estudiante = 10;
DELETE FROM estudiantes WHERE curso = 'Plataformas Low-Code';
DELETE FROM estudiantes WHERE fecha_registro >= '2026-02-14;'

-- PARTE 7: modificacion de la tabla
ALTER TABLE estudiantes ADD COLUMN correo VARCHAR(100);

-- PARTE 8: modificacion de las sentencias INSERT, UPDATE y DELETE

-- Modificacion de la sentencia INSERT
INSERT INTO estudiantes VALUES
	(11, 'Nestor', 'Bravo', 22, 'Sistemas', '2024-06-19', 'nestor@gmail.com'),
	(12, 'Roberto', 'Paredes', 28, 'Inteligencia artificial', '2022-04-24', 'roberto@hotmail.com'),
	(13, 'Victoria', 'Hernandez', 25, 'Base de Datos', '2019-01-07', 'victoria@yahoo.com'),
	(14, 'Paula', 'Vasquez', 19, 'Sistemas', '2015-11-11', 'paula@hotmail.com'),
	(15, 'Hector', 'Suarez', 31, 'DevOps', '2025-09-18', 'hector@gmail.com');

-- Modificacion de la sentencia UPDATE
UPDATE estudiantes SET correo = 'correoPrueba@hotmail.com' WHERE id_estudiante IN (6, 9);

-- Modificacion de la sentencia DELETE
DELETE FROM estudiantes WHERE correo = 'correoPrueba@hotmail.com';

-- Modificacion de la sentencia SELECT
SELECT * FROM estudiantes WHERE correo = 'correoPrueba@hotmail.com';

-- PARTE 9: Consultas con fechas

-- Mostrar estudiantes registrados despues del 2026-02-01
SELECT * FROM estudiantes WHERE  fecha_registro > '2026-02-01';

-- Mostrar estudiantes registrados hasta el 2026-05-01
SELECT * FROM estudiantes WHERE fecha_registro < '2026-05-01';

-- Mostrar estudiantes registrados entre dos fechas
SELECT * FROM estudiantes WHERE fecha_registro > '2023-05-01' AND fecha_registro < '2026-05-12';

-- Mostrar estudiantes registrados exactamente el 13
SELECT * FROM estudiantes WHERE fecha_registro = '2026-03-15';

-- Mostrar estudiates de programacion
SELECT * FROM estudiantes WHERE curso = 'Programacion' AND fecha_registro > '2026-01-01';

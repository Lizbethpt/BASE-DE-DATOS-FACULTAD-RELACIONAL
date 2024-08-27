CREATE DATABASE Facultad
USE Facultad

CREATE TABLE Facultad (
    id_facultad INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direcci�n VARCHAR(255)
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
);

CREATE TABLE Profesor (
    id_profesor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
);

CREATE TABLE Estudiante (
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
);

CREATE TABLE Asignatura (
    id_asignatura INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_curso INT,
    id_profesor INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor)
);

CREATE TABLE Inscripci�n (
    id_inscripci�n INT PRIMARY KEY,
    id_estudiante INT,
    id_asignatura INT,
    fecha_inscripci�n DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
);

CREATE TABLE Calificaci�n (
    id_calificaci�n INT PRIMARY KEY,
    id_inscripci�n INT,
    nota INT,
    fecha DATE,
    FOREIGN KEY (id_inscripci�n) REFERENCES Inscripci�n(id_inscripci�n)
);

CREATE TABLE Horario (
    id_horario INT PRIMARY KEY,
    id_asignatura INT,
    d�a VARCHAR(50),
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
);

CREATE TABLE Aula (
    id_aula INT PRIMARY KEY,
    nombre VARCHAR(100),
    capacidad INT,
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
);

CREATE TABLE Administrativo (
    id_administrativo INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
);

--INSERT 

INSERT INTO Estudiante (id_estudiante, nombre, apellido, correo, id_facultad) 
VALUES (1, 'Juan', 'P�rez', 'juan.perez@universidad.edu', 101);

INSERT INTO Profesor (id_profesor, nombre, apellido, correo, id_facultad)
VALUES (1, 'Ana', 'L�pez', 'ana.lopez@universidad.edu', 101);

INSERT INTO Facultad (id_facultad, nombre, direcci�n)
VALUES (101, 'Facultad de Ingenier�a', 'Calle 123, Ciudad A');

INSERT INTO Curso (id_curso, nombre, id_facultad)
VALUES (201, 'Ingenier�a Inform�tica', 101);

INSERT INTO Asignatura (id_asignatura, nombre, id_curso, id_profesor)
VALUES (301, 'Bases de Datos', 201, 1);

INSERT INTO Inscripci�n (id_inscripci�n, id_estudiante, id_asignatura, fecha_inscripci�n)
VALUES (401, 1, 301, '2024-08-26');

INSERT INTO Calificaci�n (id_calificaci�n, id_inscripci�n, nota, fecha)
VALUES (501, 401, 90, '2024-12-15');

INSERT INTO Horario (id_horario, id_asignatura, d�a, hora_inicio, hora_fin)
VALUES (601, 301, 'Lunes', '08:00', '10:00');

INSERT INTO Aula (id_aula, nombre, capacidad, id_facultad)
VALUES (701, 'Aula 101', 50, 101);

INSERT INTO Administrativo (id_administrativo, nombre, apellido, correo, id_facultad)
VALUES (801, 'Carlos', 'Garc�a', 'carlos.garcia@universidad.edu', 101);

-- UPDATE

UPDATE Estudiante 
SET correo = 'juan.perez2@universidad.edu' 
WHERE id_estudiante = 1;

UPDATE Profesor 
SET nombre = 'Ana Mar�a' 
WHERE id_profesor = 1;

UPDATE Facultad 
SET direcci�n = 'Calle 456, Ciudad B' 
WHERE id_facultad = 101;

UPDATE Curso 
SET nombre = 'Ingenier�a en Computaci�n' 
WHERE id_curso = 201;

UPDATE Inscripci�n 
SET fecha_inscripci�n = '2024-09-01' 
WHERE id_inscripci�n = 401;

UPDATE Calificaci�n 
SET nota = 95 
WHERE id_calificaci�n = 501;

UPDATE Horario 
SET hora_inicio = '09:00', hora_fin = '11:00' 
WHERE id_horario = 601;

UPDATE Aula 
SET capacidad = 60 
WHERE id_aula = 701;

UPDATE Administrativo 
SET correo = 'carlos.garcia2@universidad.edu' 
WHERE id_administrativo = 801;

-- DELETE

DELETE FROM Estudiante 
WHERE id_estudiante = 1;

DELETE FROM Profesor 
WHERE id_profesor = 1;

DELETE FROM Facultad 
WHERE id_facultad = 101;

DELETE FROM Curso 
WHERE id_curso = 201;

DELETE FROM Inscripci�n 
WHERE id_inscripci�n = 401;

DELETE FROM Calificaci�n 
WHERE id_calificaci�n = 501;

DELETE FROM Horario 
WHERE id_horario = 601;

DELETE FROM Aula 
WHERE id_aula = 701;

DELETE FROM Administrativo 
WHERE id_administrativo = 801;



DROP DATABASE IF EXISTS case2;

CREATE DATABASE case2;

\c case2

CREATE TABLE curso(
    id PRIMARY KEY SERIAL
);

CREATE TABLE alumno(
    rut VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    curso_id INT,
    FOREIGN KEY(curso_id) REFERENCES curso(id)
);

CREATE TABLE profesor(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    departamento VARCHAR(30) NOT NULL
);


CREATE TABLE pruebas(
    puntaje FLOAT PRIMARY KEY NOT NULL,
    alumno_rut VARCHAR(10) REFERENCES alumno(rut),
    profesor_id INT REFERENCES profesor(id)
);


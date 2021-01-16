DROP DATABASE IF EXISTS case1;

CREATE DATABASE case1;

\c case1


CREATE TABLE departamento(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);


CREATE TABLE trabajador(
    rut VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    departamento_id INT,
    FOREIGN KEY(departamento_id) REFERENCES departamento(id)
);

CREATE TABLE liquidaciones(
    id SERIAL PRIMARY KEY,
    drive VARCHAR(255),
    fecha DATE,
    trabajador_rut VARCHAR(10),
    FOREIGN KEY(trabajador_rut) REFERENCES trabajador(rut)
);





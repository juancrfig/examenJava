DROP DATABASE IF EXISTS examenJava;
CREATE DATABASE examenJava;
USE examenJava;

CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    representante VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(100),
    direccion VARCHAR(100),
    sector ENUM('tecnologia', 'salud', 'educacion', 'comercio', 'manufactura')
);

CREATE TABLE Servicio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    precioPorHora DECIMAL(10, 2),
    categoria ENUM('ti', 'limpieza', 'seguridad', 'administracion')
);

CREATE TABLE Contrato(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_servicio INT,
    fechaInicio DATE,
    fechaFin DATE,
    costoTotal DECIMAL(10, 2),
    estado ENUM('activo', 'enEspera', 'finalizado'),
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id),
    FOREIGN KEY(id_servicio) REFERENCES Servicio(id)
);

CREATE TABLE Empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    especialidad ENUM('ti', 'administracion', 'limpieza', 'seguridad')
);

CREATE TABLE Proyecto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    nombre VARCHAR(100),
    fechaInicio DATE,
    fechaFin DATE,
    estado ENUM('enCurso', 'completado', 'cancelado'),
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Asignacion (
    id_empleado INT,
    id_proyecto INT,
    horasTrabajadas INT,
    fechaAsignacion DATE,
    FOREIGN KEY(id_empleado) REFERENCES Empleado(id),
    FOREIGN KEY(id_proyecto) REFERENCES Proyecto(id)
);

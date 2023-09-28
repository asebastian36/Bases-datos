CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE Autor (
    IdAutor INT NOT NULL AUTO_INCREMENT,
    Nombre varchar(50) NOT NULL,
    Nacionalidad varchar(30) NOT NULL,
    PRIMARY KEY (IdAutor)
);

CREATE TABLE Estudiante (
    IdLector INT NOT NULL AUTO_INCREMENT,
    Nombre varchar(50) NOT NULL,
    Direccion varchar(50) NOT NULL,
    Carrera varchar(25) NOT NULL,
    Edad INT NOT NULL,
    PRIMARY KEY (IdLector)
);

CREATE TABLE Libro (
    IdLibro INT NOT NULL AUTO_INCREMENT,
    Titulo varchar(30) NOT NULL,
    Editorial varchar(30) NOT NULL,
    Area varchar(30) NOT NULL,
    PRIMARY KEY (IdLibro)
);

CREATE TABLE LibAut (
    IdAutor INT NOT NULL,
    IdLibro INT NOT NULL,
    FOREIGN KEY (IdAutor) REFERENCES Autor (IdAutor) ON DELETE NO ACTION,
    FOREIGN KEY (IdLibro) REFERENCES  Libro (IdLibro) ON DELETE NO ACTION
);

CREATE TABLE Prestamo (
    FechaPrestamo date,
    FechaDevolucion date,
    Devuelto BOOLEAN NOT NULL,
    IdLibro INT NOT NULL,
    IdLector INT NOT NULL,
    FOREIGN KEY (IdLector) REFERENCES Estudiante (IdLector) ON DELETE NO ACTION,
    FOREIGN KEY (IdLibro) REFERENCES Libro (IdLibro) ON DELETE NO ACTION
); 

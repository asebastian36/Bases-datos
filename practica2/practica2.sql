-- Crear la bd
CREATE DATABASE BD_tienda;

-- mostrar las bd almacenadas
SHOW DATABASES;

-- elegir usar la bd de BD_tienda
USE BD_tienda;

-- crear la tabla fabricantes
CREATE TABLE fabricantes(
    clave_fabricante INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    PRIMARY KEY (clave_fabricante)
);

-- crear la tabla articulos
CREATE TABLE articulos (
    clave_articulo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    precio INT NOT NULL,
    clave_fabricante INT NOT NULL,
    PRIMARY KEY (clave_articulo),
    FOREIGN KEY (clave_fabricante) REFERENCES fabricantes (clave_fabricante)
);

-- mostrar las tablas de la BD_tienda
SHOW TABLES;

-- mostrar los atributos de la tabla articulos
DESCRIBE articulos;

-- introducir datos a la tabla fabricantes
INSERT INTO fabricantes (nombre) VALUES('Kingston');
INSERT INTO fabricantes (nombre) VALUES('Adata');
INSERT INTO fabricantes (nombre) VALUES('Logitech');
INSERT INTO fabricantes (nombre) VALUES('Lexar');
INSERT INTO fabricantes (nombre) VALUES('Seagate');

-- introducir datos de la tabla articulos
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('Teclado', 100, 3);
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('Disco duro 300 Gb', 500, 5);
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('Mouse', 80, 3);
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('Memoria USB', 140, 4);
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('Memoria RAM', 290, 1);
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('Disco duro extraible 250 Gb', 650, 5);
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('Memoria USB', 279, 1);
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('DVD Rom', 450, 2);
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('CD Rom', 200, 2);
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES('Tarjeta de red', 180, 3);

-- lista de consultas

-- obtener todos los productos de la tienda
SELECT * FROM articulos;

-- obtener los nombres de los productos de la tienda
SELECT nombre FROM articulos;

--  obtener los nombres y precio de los productos de la tienda
SELECT nombre, precio FROM articulos;

-- obtener los nombres de los articulos sin repeticiones
SELECT DISTINCT nombre FROM articulos;

-- obtener todos los datos del articulo cuta clave de producto es '5'
SELECT * FROM articulos WHERE clave_articulo = 5;

--  obtener todos los datos del articulo cuyo nombre del producto es 'Teclado'
SELECT * FROM articulos WHERE nombre = 'Teclado';

--  obtener todos los datos de la memoria ram y memorias USB
SELECT * FROM articulos WHERE nombre = 'Memoria RAM' OR nombre = 'Memoria USB';

-- obtener todos los datos de los articulos que empiezan por 'M'
SELECT * FROM articulos WHERE nombre LIKE 'M%';

-- obtener el nombre de los productos donde el precio sea $100
SELECT nombre FROM articulos WHERE precio = 100;

-- obtener el nombre de los productos donde el precio sea mayor a $200
SELECT nombre FROM articulos WHERE precio > 200;

-- obtener todos los datos de los articulos cuyo precio este entre $100 y $350
SELECT * FROM articulos WHERE precio >= 100 AND precio <= 350;
SELECT * FROM articulos WHERE precio BETWEEN 100 AND 350;

-- obtener el precio medio de todos los productos
SELECT AVG(precio) FROM articulos;

-- obtener el nombre y precio de los articulos ordenados por nombre
SELECT nombre, precio FROM articulos ORDER BY nombre;

-- obtener todos los datos de los productos ordenados descendientemente por precio
SELECT * FROM articulos ORDER BY precio DESC;

-- obtener el nombre y el precio de los articulos cuyo precio sea mayor a $250 y ordenarlos descendientemente por precio y luego ascendentemente por nombre
SELECT nombre,precio FROM articulos WHERE precio >= 250 ORDER BY precio DESC, nombre;

-- obtener un listado completo de los productos, incluyendo por cada articulo de los datos de articulo y del fabricante
SELECT * FROM articulos, fabricantes WHERE articulos.clave_fabricante = fabricantes.clave_fabricante;

-- obtener la clave de producto, nombre del producto y nombre del fabricante de todos los productos en venta
SELECT articulos.clave_articulo, articulos.nombre, fabricantes.nombre FROM articulos, fabricantes WHERE articulos.clave_fabricante = fabricantes.clave_fabricante;

-- obtener el nombre y precio de los articulos donde el fabricante sea logitech ordenarlos alfabeticamente por nombre del producto
SELECT articulos.nombre, articulos.precio FROM articulos, fabricantes WHERE fabricantes.nombre = 'Logitech' AND articulos.clave_fabricante = fabricantes.clave_fabricante ORDER BY articulos.nombre;

-- obtener el nombre, precio y nombre de fabricante de los productos que son marca Lexar o Kingston ordenados descendientemente por precio
SELECT articulos.nombre, articulos.precio, fabricantes.nombre FROM articulos, fabricantes WHERE fabricantes.nombre = 'Lexar' OR fabricantes.nombre = 'Kingston' AND articulos.clave_fabricante = fabricantes.clave_fabricante ORDER BY articulos.precio DESC;

-- agregar un nuevo producto
INSERT INTO articulos (nombre, precio, clave_fabricante) VALUES ('Altavoces', 120, 2);

-- cambiar el nombre del producto 8 a 'impresora laser'
UPDATE articulos SET nombre = 'Impresora Laser' WHERE clave_articulo = 8;

-- aplicar un descuento del 10% a todos los productos
UPDATE articulos SET precio = precio * 0.10;

-- aplicar un descuento de $10 a todos los productos cuyo precio sea mayor o igual a $300
UPDATE articulos SET precio = precio - 10 WHERE precio >= 300;

-- borra el producto numero 6
DELETE FROM articulos WHERE clave_articulo = 6;
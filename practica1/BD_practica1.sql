-- Crear una base de datos
CREATE DATABASE BDproductos;

-- seleccionar la BD a usar
USE BDproductos;

-- creamos la tabla productos
CREATE TABLE productos (
    codigo varchar(3),
    nombre varchar(30),
    precio decimal(6, 2),
    fechaalta date,
    PRIMARY KEY (codigo)
);

-- agregar valores a la tabla recien creada en en la bd antes hecha
INSERT INTO productos VALUES ('a01', 'Afilador', 2.50, '2007-11-02');
INSERT INTO productos VALUES ('s01', 'Silla mod. ZAZ', 20, '2007-11-03');
INSERT INTO productos VALUES ('s02', 'Silla mod. XAX', 25, '2007-11-03');

-- mostrar todos los registros de la tabla
SELECT * FROM productos;

-- mostrar los productos que se llaman Afilador
SELECT * FROM productos WHERE nombre='Afilador';

-- para saber que registros empiezan por S
SELECT * FROM productos WHERE nombre LIKE 'S%';

-- para saber que producto tiene un precio mayor a 22
SELECT nombre, precio FROM productos WHERE precio > 22;

-- para saber el precio medio de las sillas
SELECT avg(precio) FROM productos WHERE LEFT(nombre, 5) = 'Silla';

-- agregar un nuevo dato llmado categoria a la tabla productos
ALTER TABLE productos ADD categoria varchar(10);

-- para verificar que se agrego el nuevo dato a la tabla
SELECT * FROM productos;

-- se pone el valor de utensilio a todos los registros en el campo categoria
UPDATE productos SET categoria = 'utensilio';

-- modifica el valor de los productos que comienzen con la palabra 'silla' para que su categoria seria 'silla'
UPDATE productos SET categoria = 'silla' WHERE LEFT(nombre, 5) = 'Silla';

-- para ver la lista de categorias sin duplicados
SELECT DISTINCT categoria FROM productos;

-- para revisar la cantidad de productos en cada categoria
SELECT categoria, count(*) FROM productos GROUP BY categoria;
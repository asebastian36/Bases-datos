CREATE DATABASE BD_productos;

USE BD_productos;

-- Tabla clientes
CREATE TABLE clientes (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(55) NOT NULL,
  apellido VARCHAR(55) NOT NULL,
  email VARCHAR(55) NOT NULL,
  telefono VARCHAR(10) NOT NULL,
  PRIMARY KEY (id_cliente)
);

-- Tabla categorias
CREATE TABLE categorias (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(55) NOT NULL,
  PRIMARY KEY (id_categoria)
);

-- Tabla productos
CREATE TABLE productos (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  nombre VARCHAR(55) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL,
  PRIMARY KEY (id_producto),
  FOREIGN KEY  (id_categoria) REFERENCES categorias (id_categoria)
);

-- Tabla pedidos
CREATE TABLE pedidos (
  id_pedido INT NOT NULL AUTO_INCREMENT,
  fecha DATETIME NOT NULL,
  cliente_id INT NOT NULL,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (cliente_id) REFERENCES clientes (id_cliente)
);

-- Tabla detalle pedidos
CREATE TABLE detalle_pedidos (
  id_detalle_pedido INT NOT NULL AUTO_INCREMENT,
  pedido_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_detalle_pedido),
  FOREIGN KEY (pedido_id) REFERENCES pedidos (id_pedido),
  FOREIGN KEY (producto_id) REFERENCES productos (id_producto)
);

-- Ejemplos de llenado
INSERT INTO categorias (nombre)
VALUES('Tecnologia');

-- Insertar un cliente
INSERT INTO clientes (nombre, apellido, email, telefono)
VALUES ('Angel Sebastian', 'Franco Lopez', 'angel.franco@gmail.com', '1234567890');

-- Insertar un producto
INSERT INTO productos (id_categoria, nombre, precio, stock)
VALUES (1, 'Televisor LG de 55 pulgadas', 10000, 10);

INSERT INTO productos (id_categoria, nombre, precio, stock)
VALUES (1, 'Monitor LG de 27 pulgadas', 6000, 15);

INSERT INTO productos (id_categoria, nombre, precio, stock)
VALUES (1, 'Teclado mecanico GAMAKAY GK78', 1300, 9);

INSERT INTO productos (id_categoria, nombre, precio, stock)
VALUES (1, 'Mouse inalambrico Logitech G600', 1100, 7);


-- Insertar un pedido
INSERT INTO pedidos (fecha, cliente_id)
VALUES (NOW(), 1);

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario)
VALUES (1, 1, 1, 10000);

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario)
VALUES (1, 2, 1, 6000);

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario)
VALUES (1, 3, 2, 1300);

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario)
VALUES (1, 4, 3, 1100);

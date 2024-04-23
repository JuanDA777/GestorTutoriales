DROP DATABASE IF EXISTS GestorTutorial;
CREATE DATABASE GestorTutorial CHARACTER SET utf8mb4;
USE GestorTutorial;

CREATE TABLE categoria (
  idCategoria INT AUTO_INCREMENT PRIMARY KEY,
  categoria VARCHAR(30) NOT NULL
);

INSERT INTO categoria (categoria) VALUES
('Lógica de programación'),
('Flutter'),
('Node.js'),
('Lenguajes de programación'),
('Html'),
('Bases de datos'),
('Matemáticas'),
('Geometría'),
('Física'),
('Instalaciones'),
('Juegos'),
('Vida cotidiana');	

CREATE TABLE tutorial (
  idTutorial INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  prioridad INT(10) NOT NULL,
  URL TEXT,
  idCategoria INT,
  FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria)ON DELETE CASCADE
);
ALTER TABLE tutorial
ADD COLUMN estado ENUM('por revisar', 'revisado') NOT NULL DEFAULT 'por revisar';

DELIMITER //

CREATE PROCEDURE InsertarCategoria (
    IN p_categoria VARCHAR(30) -- Nombre de la nueva categoría a insertar
)
BEGIN
    -- Insertar la nueva categoría
    INSERT INTO categoria (categoria) VALUES (p_categoria);
END //

CREATE PROCEDURE InsertarTutorial (
    IN p_titulo VARCHAR(100),
    IN p_prioridad INT,
    IN p_url TEXT,
    IN p_idCategoria INT
)
BEGIN
    -- Insertar el tutorial
    INSERT INTO tutorial (titulo, prioridad, URL, idCategoria) 
    VALUES (p_titulo, p_prioridad, p_url, p_idCategoria);
END //

CREATE PROCEDURE EditarTutorial (
    IN p_idTutorial INT,
    IN p_titulo VARCHAR(100),
    IN p_prioridad INT,
    IN p_url TEXT,
    IN p_idCategoria INT
)
BEGIN
    -- Actualizar el tutorial con los nuevos datos
    UPDATE tutorial 
    SET titulo = p_titulo,
        prioridad = p_prioridad,
        URL = p_url,
        idCategoria = p_idCategoria
    WHERE idTutorial = p_idTutorial;
END //

CREATE PROCEDURE EliminarCategoria (
    IN p_idCategoria INT -- ID de la categoría a eliminar
)
BEGIN
    -- Eliminar la categoría
    DELETE FROM categoria WHERE idCategoria = p_idCategoria;
END //

DELIMITER ;

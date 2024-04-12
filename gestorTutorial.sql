DROP DATABASE IF EXISTS GestorTutorial;
CREATE DATABASE GestorTutorial CHARACTER SET utf8mb4;
USE GestorTutorial;

CREATE TABLE categoria (
  idCategoria INT AUTO_INCREMENT PRIMARY KEY,
  categoria VARCHAR(30) NOT NULL
);

INSERT INTO categoria (categoria) VALUES
('logica de programacion'),
('flutter'),
('node.js');

CREATE TABLE tutorial (
  idTutorial INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  prioridad INT(10) NOT NULL,
  URL TEXT,
  idCategoria INT,
  FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria)
);

DELIMITER //

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

DELIMITER ;



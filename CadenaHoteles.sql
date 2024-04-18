
-- Creación de la base de datos
DROP DATABASE IF EXISTS cadena_hotelera;
CREATE DATABASE IF NOT EXISTS cadena_hotelera;
DROP USER IF EXISTS melani;
CREATE USER 'melani'@'%' IDENTIFIED BY 'clave_bd';
GRANT ALL PRIVILEGES ON cadena_hotelera.* to 'melani'@'%';
FLUSH PRIVILEGES;
-- Uso de la base de datos
USE cadena_hotelera;

CREATE TABLE hoteles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    descripcion VARCHAR(2048),
    ruta_imagen VARCHAR(2048)
);

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    hotel_id INT,
    FOREIGN KEY (hotel_id) REFERENCES hoteles(id)
);

CREATE TABLE reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_nombre VARCHAR(100) NOT NULL,
    num_huespedes INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    hotel_id INT,
    numero_cedula VARCHAR(20),
    FOREIGN KEY (hotel_id) REFERENCES hoteles(id),
    FOREIGN KEY (numero_cedula) REFERENCES usuarios(username)
);


CREATE TABLE roles (
  id_rol int NOT NULL AUTO_INCREMENT,
  nombre varchar(20) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO roles VALUES 
(1,'ADMINISTRADOR'),(2,'CLIENTE');

CREATE TABLE usuario (
	id_usuario INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(20) PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    enabled BOOLEAN NOT NULL,
    id_rol int DEFAULT NULL,
    PRIMARY KEY (`id_usuario`),
    FOREIGN KEY (id_rol) REFERENCES roles
);

INSERT INTO usuario (id, username, password, enabled, id_rol) VALUES
('1','123456789', '$2a$10$E2u3nNBTMCgIhT0Pr2jjzuFbmkfiP.HyvUzDCMdIkRr2ZOlDpuCIK', true, '1'), -- Contraseña: 123
('2','987654321', '$2a$10$FQmJGte7Eh/t28Q3oxg/.u4yBL6T8z9Bh4TzPj5up.NYwphj0fTVW', true, '2'), -- Contraseña: 456
('3','654321987', '$2a$10$WKWz4q6F03yFdRZp2PNk3uh.Ox0FDDkF6G.PkYzi/6pAV5ML8a6Fm', true, '2'); -- Contraseña: 789

-- Datos de ejemplo para la tabla de hoteles
INSERT INTO hoteles (nombre, ubicacion, descripcion, ruta_imagen) VALUES
('Hotel Conchal', 'Playa Conchal, Guanacaste', 'Un hermoso hotel ubicado en la playa Conchal.','https://www.nacion.com/resizer/CnhQxfJI3W94jIHNq9w9XcX4T6c=/1440x0/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/gruponacion/723RUNLPHNAIDB6DHH52XSUPSI.jpg'),
('Hotel Avellanas', 'Playa Avellanas, Guanacaste', 'Un acogedor hotel ubicado en la playa Avellanas.', 'https://www.kayak.co.cr/rimg/himg/a0/35/22/expediav2-351242-8bf91e-190195.jpg?width=968&height=607&crop=true'),
('Hotel Gregorio', 'Playa Gregorio, Guanacaste', 'Un exclusivo hotel ubicado en la playa Gregorio.', 'https://www.kayak.co.cr/rimg/himg/a0/35/22/expediav2-351242-8bf91e-190195.jpg?width=968&height=607&crop=true');

-- Datos de ejemplo para la tabla de empleados
INSERT INTO empleados (nombre, cargo, hotel_id) VALUES
('Juan Pérez', 'Gerente General', 1), -- Juan Pérez trabaja en Hotel Conchal
('María González', 'Recepcionista', 1), -- María González trabaja en Hotel Conchal
('Pedro Sánchez', 'Chef', 2), -- Pedro Sánchez trabaja en Hotel Avellanas
('Ana Ramírez', 'Limpieza', 3); -- Ana Ramírez trabaja en Hotel Gregorio

-- Datos de ejemplo para la tabla de reservas
INSERT INTO reserva (cliente_nombre, num_huespedes, fecha_ingreso, fecha_salida, hotel_id, numero_cedula) VALUES
('Carlos García', 2, '2024-04-15', '2024-04-20', 1, '123456789'), -- Reserva en Hotel Conchal
('Laura Martínez', 1, '2024-05-10', '2024-05-15', 2, '987654321'), -- Reserva en Hotel Avellanas
('Roberto Jiménez', 4, '2024-06-20', '2024-06-25', 3, '654321987'); -- Reserva en Hotel Gregorio

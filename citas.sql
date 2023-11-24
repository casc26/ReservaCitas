--  Crea la tabla Persona
CREATE TABLE Persona (
    id INT primary key auto_increment,
    -- auto_increment genera un numero de id diferente al anterior +1.
    nombre VARCHAR(20) not null,
    apellido_paterno VARCHAR(20) not null,
    apellido_materno VARCHAR(20) not null,
    telefono VARCHAR(9),
    dni VARCHAR(8) UNIQUE not null
    -- el termino UNIQUE establece que los caracteres ingresados sean unicos en la columna DNI
);

--Muestra la tabla con las respectivas columnas creadas
SELECT * FROM Persona;

-- Crea la tabla Paciente
CREATE TABLE paciente (
    id INT primary key not null,
    fecha_nacimiento DATE not null,
    genero VARCHAR(3) not null,
    CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES persona(id)
    -- se crea la relacion entre la tabla persona y esta tabla, la cual establecen que los id sean sel mismo valor
);

--Muestra la tabla con las respectivas columnas creadas
SELECT * FROM paciente;

-- Crear la tabla Recepcionista con relación a Persona
CREATE TABLE recepcionista (
    codigo int(5) PRIMARY KEY not null,
    turno varchar(10) not null,
    CONSTRAINT fk_codigo FOREIGN KEY (codigo) REFERENCES persona(id)
);

--Muestra la tabla con las respectivas columnas creadas
SELECT * FROM recepcionista;

-- Crear la tabla Doctor con relación a Persona
CREATE TABLE Doctor (
    id INT PRIMARY KEY,
    especialidad VARCHAR(255),
    CONSTRAINT FOREIGN KEY (id) REFERENCES Persona(id)
);

--Muestra la tabla con las respectivas columnas creadas
SELECT * FROM Doctor;

-- Crear la tabla Reserva
CREATE TABLE Reserva (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL,
    paciente_id INT,
    doctor_id INT,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

--Muestra la tabla con las respectivas columnas creadas
SELECT * FROM Reserva;

-- Agregar registros a la tabla Persona
INSERT INTO Persona (nombre, apellido_paterno, apellido_materno, telefono, dni) VALUES
('Juan', 'Pérez', 'Gómez', '123456789', '12345678'),
('María', 'González', 'López', '987654321', '87654321'),
('Pedro', 'Ramírez', 'Sánchez', '456789012', '56789012');

-- Agregar registros a la tabla Paciente
INSERT INTO Paciente (id, fecha_nacimiento, genero) VALUES
(1, '1990-05-15', 'M'),
(2, '1985-12-20', 'F'),
(3, '2000-08-10', 'M');

-- Agregar registros a la tabla Recepcionista
INSERT INTO Recepcionista (codigo, turno) VALUES
(10001, 'Mañana'),
(10002, 'Tarde'),
(10003, 'Noche');

-- Agregar registros a la tabla Doctor
INSERT INTO Doctor (id, especialidad) VALUES
(1, 'Cardiología'),
(2, 'Dermatología'),
(3, 'Pediatría');

-- Agregar registros a la tabla Reserva
INSERT INTO Reserva (fecha_hora, paciente_id, doctor_id) VALUES
('2023-01-10 08:00:00', 1, 1),
('2023-02-15 14:30:00', 2, 2),
('2023-03-20 10:45:00', 3, 3);

--Selecciona los pacientes de genero masculino
SELECT * FROM paciente
WHERE genero='M';

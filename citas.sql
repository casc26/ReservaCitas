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

-- Crea la tabla Paciente
CREATE TABLE paciente (
    id INT primary key not null,
    fecha_nacimiento DATE not null,
    genero VARCHAR(3) not null,
    CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES persona(id)
    -- se crea la relacion entre la tabla persona y esta tabla, la cual establecen que los id sean sel mismo valor
);

-- Crear la tabla Recepcionista con relación a Persona
CREATE TABLE recepcionista (
    codigo int(5) PRIMARY KEY not null,
    turno varchar(10) not null,
    CONSTRAINT fk_codigo FOREIGN KEY (codigo) REFERENCES persona(id)
);

-- Crear la tabla Doctor con relación a Persona
CREATE TABLE Doctor (
    id INT PRIMARY KEY,
    especialidad VARCHAR(255),
    CONSTRAINT FOREIGN KEY (id) REFERENCES Persona(id)
);

-- Crear la tabla Reserva
CREATE TABLE Reserva (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL,
    paciente_id INT,
    doctor_id INT,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

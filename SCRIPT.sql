#Crear DB
CREATE SCHEMA refugioanimal;

#Creacion de TABLA PROVINCIAS
CREATE TABLE provincias 
(	
	id_provincia INT NOT NULL AUTO_INCREMENT,
	provincia VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_provincia)
);
#Creacion de TABLA PAISES
CREATE TABLE paises
(	
	id_pais INT NOT NULL AUTO_INCREMENT,
	pais VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_pais)
);
#Creacion de TABLA LOCALIDADES
CREATE TABLE localidad
(	
	id_localidad INT NOT NULL AUTO_INCREMENT,
	localidad VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_localidad)
);
#Creacion de TABLA MEDICAMENTOS
CREATE TABLE medicamentos
 (	
	id_medicamento INT NOT NULL AUTO_INCREMENT,
	tipo_medicamento VARCHAR(40) NOT NULL,
	cantidad INT NOT NULL,
	fecha_compra DATE NOT NULL,
	fecha_vencimiento DATE NOT NULL,
	precio_unitario FLOAT NOT NULL,
	monto_impositivo FLOAT NOT NULL,
	monto_total FLOAT NOT NULL,
	PRIMARY KEY (id_medicamento)
);
#Creacion de TABLA ANIMALES_ESTADOS
CREATE TABLE animales_estados
 (
	id_estado int NOT NULL AUTO_INCREMENT,
	descripcion_estado VARCHAR(30) NOT NULL,
	PRIMARY KEY(id_estado)
);
#Creacion de tabla LISTA_CARGOS
CREATE TABLE lista_cargos
 (	
	id_cargo INT NOT NULL AUTO_INCREMENT,
	cargo_cumplir VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_cargo)
);
#Creacion de TABLA COMPRAS
CREATE TABLE compras 
(	
	id_producto INT NOT NULL AUTO_INCREMENT,
	tipo_compra VARCHAR(30) NOT NULL,
	cantidad FLOAT NOT NULL,
	fecha_compra DATE NOT NULL,
	precio_unitario FLOAT NOT NULL,
	monto_impositivo FLOAT NOT NULL,
	monto_total FLOAT NOT NULL,
	PRIMARY KEY (id_producto)
);
#Creacion de TABLA ANIMALES
CREATE TABLE animales
 (
	id_animal INT NOT NULL AUTO_INCREMENT,
	nombre_animal VARCHAR(30) DEFAULT NULL,
	raza_animal VARCHAR(30) DEFAULT NULL,
	descripcion VARCHAR(30) DEFAULT NULL,
	fecha_ingreso DATE NOT NULL,
	edad_estimada_animal INT NULL,
	id_estado INT,
	sexo VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_animal),
	KEY fk_animales_animales_estado (id_estado),
	CONSTRAINT fk_animales_animales_estados FOREIGN KEY (id_estado)REFERENCES animales_estados (id_estado)
    ON DELETE RESTRICT 
    ON UPDATE CASCADE
);
#Creacion de TABLA TRATAMIENTOS
CREATE TABLE tratamientos
 (
	id_tratamiento INT NOT NULL AUTO_INCREMENT,
	id_animal INT,
	id_medicamento INT,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	PRIMARY KEY (id_tratamiento),
	KEY id_animal (id_animal),
	KEY id_medicamento (id_medicamento),
	CONSTRAINT tratamientos_ibfk_1 FOREIGN KEY (id_animal) REFERENCES animales (id_animal) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE,
	CONSTRAINT tratamientos_ibfk_2 FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id_medicamento) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
);
#Creacion de TABLA ADOPTANTES
CREATE TABLE adoptantes
 (
	id_adoptante INT NOT NULL AUTO_INCREMENT,
	nombre_adoptante VARCHAR(30) NOT NULL,
	apellido_adoptante VARCHAR(30) NOT NULL,
	dni_adoptante VARCHAR(30) NOT NULL,
	domicilio_adoptante VARCHAR(50) NOT NULL,
	telefono_adoptante INT NOT NULL,
	id_animal INT,
	fecha_adopcion DATE NOT NULL,
	PRIMARY KEY (id_adoptante),
	KEY fk_adoptantes_animales (id_animal),
	CONSTRAINT fk_adoptantes_animales FOREIGN KEY (id_animal) REFERENCES animales (id_animal) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
);
#Creacion TABLA COSTOS
CREATE TABLE costos
 (
	id_costo INT NOT NULL AUTO_INCREMENT,
	id_medicamento INT,
	id_producto INT,
	total FLOAT NOT NULL,
	PRIMARY KEY (id_costo),
	KEY id_medicamento (id_medicamento),
	KEY fk_costos_compras (id_producto),
	CONSTRAINT costos_ibfk_1 FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id_medicamento)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE,
	CONSTRAINT fk_costos_compras FOREIGN KEY (id_producto) REFERENCES compras (id_producto) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
);
#Creacion de TABLA DONANTE
CREATE TABLE donantes
 (
	id_donante INT NOT NULL AUTO_INCREMENT,
	id_pais INT NOT NULL,
	id_provincia INT NOT NULL,
	nombre VARCHAR(30) DEFAULT NULL,
	apellido VARCHAR(30) DEFAULT NULL,
	PRIMARY KEY (id_donante),
	KEY fk_donantes_paises (id_pais),
	KEY fk_donantes_provincias (id_provincia),
	CONSTRAINT fk_donantes_paises FOREIGN KEY (id_pais) REFERENCES paises (id_pais) 
	ON DELETE RESTRICT
	ON UPDATE CASCADE,
	CONSTRAINT fk_donantes_provinciass FOREIGN KEY (id_provincia) REFERENCES provincias (id_provincia) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
);
#Creacion de TABLA DONACIONES
CREATE TABLE donaciones
 (
	id_donacion INT NOT NULL AUTO_INCREMENT,
	id_donante INT NOT NULL,
	monto FLOAT NOT NULL,
	fecha_donacion DATE NOT NULL,
	PRIMARY KEY (id_donacion),
	KEY fk_donaciones_donantes (id_donante),
	CONSTRAINT fk_donaciones_donantes FOREIGN KEY (id_donante)REFERENCES donantes (id_donante) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
);
#Creacion de TABLA EMPLEADOS
CREATE TABLE empleados
 (
	id_empleado INT NOT NULL AUTO_INCREMENT,
	id_cargo INT NOT NULL,
	descripción_cargo VARCHAR(60) DEFAULT NULL,
	fecha_ingreso DATE NOT NULL,
	nombre_empleado VARCHAR(20) NOT NULL,
	apellido_emplado VARCHAR(20) NOT NULL,
	direccion VARCHAR(30) NOT NULL,
	id_localidad INT,
	id_pais INT,
	id_provincia INT,
	PRIMARY KEY (id_empleado),
	KEY fk_emplados_lista_cargos (id_cargo),
	KEY fk_emplados_localidad(id_localidad),
	KEY fk_empleados_paises (id_pais),
	KEY fk_empleados_pronvincias (id_provincia),
	CONSTRAINT fk_emplados_lista_cargos FOREIGN KEY (id_cargo) REFERENCES lista_cargos (id_cargo) 
	ON DELETE RESTRICT
	ON UPDATE CASCADE,
	CONSTRAINT fk_emplados_localidad FOREIGN KEY (id_localidad) REFERENCES localidad (id_localidad) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE,
	CONSTRAINT fk_empleados_paises FOREIGN KEY (id_pais) REFERENCES paises (id_pais) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE,
	CONSTRAINT fk_empleados_pronvincias FOREIGN KEY (id_provincia) REFERENCES provincias (id_provincia) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
);
#Creacion de TABLA RESPONSABLES
CREATE TABLE responsable 
(
	id_responsable INT NOT NULL AUTO_INCREMENT,
	id_empleado INT DEFAULT NULL,
	id_animal INT DEFAULT NULL,
	descripcion_responsabilidad VARCHAR(30) NOT NULL,
	rutina VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_responsable),
	KEY fk_responsable_emplado (id_empleado),
	KEY fk_responsable_animal (id_animal),
	CONSTRAINT responsable_ibfk_1 FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE,
	CONSTRAINT responsable_ibfk_2 FOREIGN KEY (id_animal) REFERENCES animales (id_animal) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
);





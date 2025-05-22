-- DDL para crear las llaves

drop database if exists veterinaria_mi_mejor_amigo;

create database if not exists veterinaria_mi_mejor_amigo;

use veterinaria_mi_mejor_amigo;


-- para crear las tablas es necesario empezar por las tablas que no tienen FK debido a que generara 
-- errores al momento de creacion por que no puede relacionar las llaves foraneas
create table dueñosdemascotas (
id int auto_increment primary key,
nombre varchar(40) not null,
telefono varchar(15) not null,
direccion varchar(40) not null
);


create table mascotas (
id int auto_increment primary key,
nombredelamascota varchar(40) not null,
especie varchar(40) not null,
raza varchar(40) not null,
fechadenacimiento date not null,
sexo enum("macho","hembra") not null,
estadovacunacion enum("si","no") not null,
id_dueñosdemascotas INT NOT NULL, FOREIGN KEY (id_dueñosdemascotas) REFERENCES dueñosdemascotas(id)
);


create table servicios (
id int auto_increment primary key,
nombredelservicio varchar(40) not null,
precios int not null check(precios > 0),
descripcion varchar(255) not null
);

create table registrodevisitas (
id int auto_increment primary key,
fechadeadmision datetime not null,
id_mascota int not null, foreign key (id_mascota) references mascotas(id),
id_servicios int not null , foreign key (id_servicios) references servicios(id)
);

create table tratamientos (
id int auto_increment primary key,
nombredeltratamiento varchar(40) not null,
observaciones text not null,
id_registrodevisitas int not null , foreign key (id_registrodevisitas) references registrodevisitas(id)
);

-- DML para agregar datos 

-- dueñosdemascotas (nombre,telefono,direccion)
insert into dueñosdemascotas(nombre,telefono,direccion)
values ('David','31212312312','carrera 123 av 12');

-- mascotas (nombredelamascota,especie,raza,fechadenacimiento,sexo,estadovacunacion,id_dueñosdemascotas)
insert into mascotas (nombredelamascota,especie,raza,fechadenacimiento,sexo,estadovacunacion,id_dueñosdemascotas)
values('firu','perro','labrador','2018-06-15','macho','si',1);

-- servicios (nombredelservicio,precios,descripcion )
insert into servicios(nombredelservicio,precios,descripcion)
values ('baño',20,'Baño con jabon antibacterial y shampoo con acondicionador');

-- registrodevisitas (fechadeadmision,id_mascota,id_servicios)
insert into registrodevisitas(fechadeadmision,id_mascota,id_servicios)
values('2025-05-22 14:30:00',1,1);

-- tratamientos (nombredeltratamiento,observaciones,id_registrodevisitas )
insert into tratamientos (nombredeltratamiento,observaciones,id_registrodevisitas )
values ('vendaje','envolvimiento del area afectada con vendas','1');



-- DQL para hacer consultas
select * from mascotas;

select * from dueñosdemascotas;

select * from servicios;

select * from registrodevisitas;

select * from tratamientos;

-- -----------------------------------------------------------------------------------------------------
-- todo lo anteriormente escrito es de manera basica y puntual profundizare mas en la siguiente seccion.
-- -----------------------------------------------------------------------------------------------------
-- DML
-- vamos a insertar 40 dueños de mascotas

INSERT INTO dueñosdemascotas (nombre, telefono, direccion) VALUES
('Andrea González', '3112345670', 'Calle 10 #45-21'),
('Carlos Ramírez', '3123456781', 'Carrera 12 #32-11'),
('Luisa Martínez', '3134567892', 'Avenida 1 #20-30'),
('Pedro López', '3145678903', 'Calle 22 #10-55'),
('Sofía Torres', '3156789014', 'Carrera 8 #18-99'),
('Mateo Rodríguez', '3167890125', 'Transversal 5 #40-12'),
('Camila Hernández', '3178901236', 'Diagonal 3 #21-09'),
('Juan Pérez', '3189012347', 'Calle 33 #50-40'),
('Isabela Castillo', '3190123458', 'Carrera 20 #15-45'),
('Santiago Vega', '3201234569', 'Calle 12 #65-20'),
('Valentina Ríos', '3212345670', 'Carrera 7 #23-32'),
('Tomás Navarro', '3223456781', 'Calle 19 #31-10'),
('Mariana Jiménez', '3234567892', 'Avenida 6 #40-07'),
('Nicolás Ruiz', '3245678903', 'Carrera 15 #12-09'),
('Gabriela Cruz', '3256789014', 'Calle 21 #29-34'),
('Samuel Gómez', '3267890125', 'Carrera 18 #11-22'),
('Renata Díaz', '3278901236', 'Avenida 8 #33-17'),
('David Salazar', '3289012347', 'Transversal 9 #45-67'),
('Daniela Medina', '3290123458', 'Calle 14 #27-18'),
('Felipe Muñoz', '3301234569', 'Carrera 13 #19-03'),
('Ana Morales', '3312345670', 'Avenida 2 #48-23'),
('Emiliano Peña', '3323456781', 'Calle 18 #24-56'),
('Paula Vargas', '3334567892', 'Carrera 5 #60-70'),
('Martín Herrera', '3345678903', 'Calle 29 #34-89'),
('Laura Mendoza', '3356789014', 'Avenida 10 #15-88'),
('Julián Ortega', '3367890125', 'Carrera 21 #17-55'),
('Sara Paredes', '3378901236', 'Calle 17 #38-61'),
('Diego Castro', '3389012347', 'Carrera 3 #44-20'),
('Alejandra León', '3390123458', 'Transversal 7 #55-33'),
('Benjamín Cárdenas', '3401234569', 'Calle 26 #13-12'),
('Elena Duarte', '3412345670', 'Carrera 14 #11-50'),
('Tomás Silva', '3423456781', 'Calle 13 #20-00'),
('Luciana Beltrán', '3434567892', 'Avenida 4 #18-25'),
('Joaquín Acosta', '3445678903', 'Carrera 11 #23-98'),
('Catalina Vargas', '3456789014', 'Calle 15 #17-78'),
('Maximiliano Lara', '3467890125', 'Carrera 6 #42-09'),
('Natalia Reyes', '3478901236', 'Transversal 10 #36-44'),
('Iván Figueroa', '3489012347', 'Calle 20 #11-60'),
('Fernanda Gil', '3490123458', 'Carrera 9 #29-72'),
('Cristóbal Barrios', '3501234569', 'Avenida 9 #27-11');


-- para cada dueño de mascota vamos a meter varias mascotas (63) que estaran relacionadas con los mismos
-- cada dueño puede tener 1 o varias mascotas 

INSERT INTO mascotas (nombredelamascota, especie, raza, fechadenacimiento, sexo, estadovacunacion, id_dueñosdemascotas) VALUES
('Firulais', 'perro', 'Labrador', '2018-06-15', 'macho', 'si', 1),
('Mishi', 'gato', 'Persa', '2020-04-10', 'hembra', 'si', 1),
('Rocky', 'perro', 'Bulldog', '2019-11-23', 'macho', 'no', 2),
('Luna', 'gato', 'Siames', '2021-06-01', 'hembra', 'si', 2),
('Max', 'perro', 'Beagle', '2017-03-08', 'macho', 'si', 3),
('Nala', 'gato', 'Maine Coon', '2020-07-15', 'hembra', 'no', 4),
('Coco', 'loro', 'Amazonas', '2015-09-05', 'macho', 'no', 4),
('Chispa', 'hamster', 'Sirio', '2023-01-12', 'hembra', 'no', 5),
('Copito', 'pollo', 'Gallina criolla', '2022-08-22', 'hembra', 'si', 6),
('Zeus', 'perro', 'Pastor Alemán', '2019-10-20', 'macho', 'si', 6),
('Pelusa', 'gato', 'Angora', '2020-12-25', 'hembra', 'no', 7),
('Daisy', 'loro', 'Eclectus', '2018-03-18', 'hembra', 'no', 7),
('Bolt', 'perro', 'Golden Retriever', '2016-07-09', 'macho', 'si', 8),
('Fiona', 'gato', 'British Shorthair', '2021-09-30', 'hembra', 'si', 9),
('Manchitas', 'pollo', 'Gallo criollo', '2023-05-01', 'macho', 'no', 10),
('Milo', 'perro', 'Chihuahua', '2022-01-14', 'macho', 'si', 10),
('Toby', 'perro', 'Pug', '2020-02-17', 'macho', 'si', 11),
('Pepa', 'pollo', 'Gallina criolla', '2021-11-09', 'hembra', 'no', 12),
('Simba', 'gato', 'Bengala', '2019-06-06', 'macho', 'si', 12),
('Loki', 'gato', 'Siberiano', '2018-08-20', 'macho', 'si', 13),
('Kiwi', 'loro', 'Guacamayo', '2017-10-25', 'macho', 'si', 14),
('Rex', 'perro', 'Rottweiler', '2020-04-12', 'macho', 'si', 15),
('Lala', 'hamster', 'Enano Ruso', '2023-02-11', 'hembra', 'no', 15),
('Kira', 'perro', 'Boxer', '2018-09-03', 'hembra', 'si', 16),
('Bella', 'gato', 'Himalaya', '2021-03-28', 'hembra', 'si', 17),
('Sky', 'loro', 'Cacatúa', '2016-06-15', 'macho', 'no', 17),
('Maya', 'perro', 'Caniche', '2019-12-01', 'hembra', 'si', 18),
('Pipo', 'pollo', 'Gallo criollo', '2020-10-19', 'macho', 'si', 19),
('Blanquita', 'pollo', 'Gallina criolla', '2021-08-13', 'hembra', 'no', 20),
('Nico', 'perro', 'Dálmata', '2017-02-23', 'macho', 'si', 20),
('Arya', 'gato', 'Siames', '2019-05-05', 'hembra', 'no', 21),
('Chiqui', 'hamster', 'Sirio', '2023-01-04', 'hembra', 'si', 21),
('Tom', 'gato', 'Europeo', '2018-04-22', 'macho', 'si', 22),
('Jerry', 'hamster', 'Enano Ruso', '2022-07-19', 'macho', 'no', 22),
('Gala', 'perro', 'Shar Pei', '2020-03-11', 'hembra', 'si', 23),
('Bobby', 'perro', 'Terrier', '2021-05-25', 'macho', 'no', 24),
('Runa', 'gato', 'Sphynx', '2021-10-10', 'hembra', 'si', 24),
('Leo', 'gato', 'Persa', '2018-01-15', 'macho', 'no', 25),
('Paquita', 'pollo', 'Gallina criolla', '2023-06-03', 'hembra', 'si', 26),
('Dino', 'loro', 'Yaco', '2017-07-21', 'macho', 'si', 27),
('Cleo', 'perro', 'Pomerania', '2022-12-09', 'hembra', 'si', 28),
('Tita', 'hamster', 'Sirio', '2022-09-27', 'hembra', 'no', 28),
('Bambú', 'loro', 'Guacamayo', '2016-04-17', 'macho', 'no', 29),
('Canelo', 'perro', 'Pitbull', '2018-08-01', 'macho', 'si', 30),
('Chiki', 'pollo', 'Gallo criollo', '2023-02-14', 'macho', 'si', 30),
('Goku', 'perro', 'Husky', '2020-01-05', 'macho', 'si', 31),
('Akira', 'gato', 'Maine Coon', '2019-11-20', 'hembra', 'si', 31),
('Bola', 'hamster', 'Enano Ruso', '2022-05-11', 'macho', 'no', 32),
('Rosita', 'pollo', 'Gallina criolla', '2021-04-07', 'hembra', 'si', 33),
('Tango', 'loro', 'Cacatúa', '2015-09-30', 'macho', 'no', 34),
('Luna', 'gato', 'Angora', '2020-06-08', 'hembra', 'si', 34),
('Sombra', 'perro', 'Doberman', '2019-03-19', 'macho', 'si', 35),
('Chispa', 'hamster', 'Sirio', '2023-01-01', 'hembra', 'si', 35),
('Snow', 'gato', 'Himalaya', '2021-01-30', 'hembra', 'si', 36),
('Rocko', 'perro', 'Border Collie', '2018-02-16', 'macho', 'no', 37),
('Pancha', 'pollo', 'Gallina criolla', '2022-08-29', 'hembra', 'si', 37),
('Blue', 'loro', 'Eclectus', '2016-12-12', 'macho', 'si', 38),
('Sami', 'gato', 'Siberiano', '2019-07-07', 'hembra', 'no', 38),
('Taco', 'perro', 'Chihuahua', '2022-11-11', 'macho', 'si', 39),
('Nube', 'gato', 'Persa', '2020-04-18', 'hembra', 'si', 39),
('Rita', 'hamster', 'Enano Ruso', '2023-03-22', 'hembra', 'no', 40),
('Thor', 'perro', 'Boxer', '2017-09-09', 'macho', 'si', 40);



 -- ahora vamos a meter los servicios 20 en total
 
 INSERT INTO servicios (nombredelservicio, precios, descripcion) VALUES
('Baño', 20000, 'Baño con jabón antibacterial y shampoo con acondicionador'),
('Corte de uñas', 10000, 'Corte higiénico de uñas para evitar infecciones'),
('Consulta médica general', 30000, 'Revisión médica completa para detectar enfermedades'),
('Vacunación antirrábica', 25000, 'Aplicación de vacuna antirrábica según normativa nacional'),
('Desparasitación interna', 22000, 'Tratamiento oral contra parásitos internos'),
('Desparasitación externa', 18000, 'Aplicación tópica contra pulgas y garrapatas'),
('Control de peso', 15000, 'Evaluación y recomendaciones nutricionales personalizadas'),
('Limpieza de oídos', 12000, 'Limpieza profunda de los oídos con productos veterinarios'),
('Limpieza dental', 35000, 'Profilaxis dental con ultrasonido'),
('Consulta de emergencia', 50000, 'Atención médica inmediata en caso de emergencia'),
('Corte de pelo', 20000, 'Corte estético según raza y preferencia del dueño'),
('Revisión postoperatoria', 28000, 'Seguimiento médico después de una cirugía'),
('Tratamiento dermatológico', 40000, 'Aplicación de tratamiento para afecciones en la piel'),
('Consulta geriátrica', 30000, 'Chequeo médico para mascotas mayores'),
('Análisis de sangre', 45000, 'Extracción y análisis para diagnóstico general'),
('Examen de heces', 15000, 'Detección de parásitos mediante análisis fecal'),
('Vacunación quintuple', 32000, 'Aplicación de vacuna múltiple para perros'),
('Vacunación triple felina', 30000, 'Aplicación de vacuna múltiple para gatos'),
('Baño medicado', 26000, 'Baño con productos especiales para tratar problemas de piel'),
('Microchip de identificación', 60000, 'Colocación de microchip con número único de registro');



-- ahora vamos a meter el registro de visitas , si son 100 animales serian 100 registros



INSERT INTO registrodevisitas (fechadeadmision, id_mascota, id_servicios) VALUES
('2023-11-10 14:45:00', 3, 12),
('2025-01-05 11:20:00', 4, 1),
('2022-07-08 08:50:00', 5, 9),
('2020-02-28 16:10:00', 6, 5),
('2024-10-11 17:30:00', 7, 4),
('2023-05-19 13:25:00', 8, 11),
('2021-12-30 15:10:00', 9, 2),
('2022-04-15 12:00:00', 10, 8),
('2023-08-06 10:45:00', 11, 6),
('2025-03-21 14:40:00', 12, 14),
('2020-09-12 11:00:00', 13, 10),
('2021-01-18 09:30:00', 14, 3),
('2024-06-25 16:20:00', 15, 17),
('2023-10-02 15:50:00', 16, 13),
('2022-02-05 08:10:00', 17, 16),
('2025-05-12 14:00:00', 18, 1),
('2020-07-14 13:40:00', 19, 20),
('2024-03-28 10:00:00', 20, 18),
('2021-11-01 11:35:00', 21, 5),
('2023-01-07 09:10:00', 22, 8),
('2022-08-16 12:25:00', 23, 15),
('2020-04-09 17:05:00', 24, 6),
('2021-09-23 15:45:00', 25, 2),
('2024-05-18 08:50:00', 26, 19),
('2025-04-27 16:15:00', 27, 4),
('2022-10-11 14:35:00', 28, 7),
('2023-12-03 10:10:00', 29, 11),
('2020-01-22 13:55:00', 30, 12),
('2021-08-19 09:45:00', 31, 3),
('2024-11-30 15:20:00', 32, 17),
('2022-06-14 11:30:00', 33, 13),
('2023-03-25 16:50:00', 34, 10),
('2025-02-13 10:30:00', 35, 1),
('2020-05-20 08:25:00', 36, 6),
('2021-03-27 14:15:00', 37, 14),
('2024-07-09 15:10:00', 38, 16),
('2023-06-05 12:40:00', 39, 9),
('2022-01-12 09:05:00', 40, 20),
('2020-08-01 13:10:00', 41, 5),
('2025-01-29 11:25:00', 42, 18),
('2023-07-22 10:55:00', 43, 8),
('2021-05-02 16:35:00', 44, 7),
('2022-11-08 09:20:00', 45, 19),
('2024-02-14 13:30:00', 46, 4),
('2020-12-20 12:15:00', 47, 15),
('2021-07-03 11:40:00', 48, 2),
('2023-09-29 14:05:00', 49, 13),
('2025-05-01 08:00:00', 50, 6),
('2022-03-16 17:30:00', 51, 11),
('2020-06-24 10:20:00', 52, 12),
('2024-04-08 09:15:00', 53, 10),
('2021-10-05 14:50:00', 54, 3),
('2023-02-26 15:40:00', 55, 17),
('2020-10-13 08:30:00', 56, 1),
('2022-12-01 13:55:00', 57, 16),
('2025-03-03 12:00:00', 58, 14),
('2020-11-06 16:10:00', 59, 9),
('2024-08-20 10:45:00', 60, 19),
('2021-02-28 11:50:00', 61, 4),
('2023-04-14 14:30:00', 62, 18),
('2022-09-07 13:35:00', 63, 7)

-- ahora añadiremos 20 tratamientos 

INSERT INTO tratamientos (nombredeltratamiento, observaciones, id_registrodevisitas) VALUES
('Tratamiento A', 'Observación para Tratamiento A - sesión 1', 1),
('Tratamiento A', 'Observación para Tratamiento A - sesión 2', 2),
('Tratamiento A', 'Observación para Tratamiento A - sesión 3', 3),
('Tratamiento A', 'Observación para Tratamiento A - sesión 4', 4),
('Tratamiento A', 'Observación para Tratamiento A - sesión 5', 5),

('Tratamiento B', 'Observación para Tratamiento B - sesión 1', 6),
('Tratamiento B', 'Observación para Tratamiento B - sesión 2', 7),
('Tratamiento B', 'Observación para Tratamiento B - sesión 3', 8),
('Tratamiento B', 'Observación para Tratamiento B - sesión 4', 9),
('Tratamiento B', 'Observación para Tratamiento B - sesión 5', 10),

('Tratamiento C', 'Observación para Tratamiento C - sesión 1', 11),
('Tratamiento C', 'Observación para Tratamiento C - sesión 2', 12),
('Tratamiento C', 'Observación para Tratamiento C - sesión 3', 13),
('Tratamiento C', 'Observación para Tratamiento C - sesión 4', 14),
('Tratamiento C', 'Observación para Tratamiento C - sesión 5', 15),

('Tratamiento D', 'Observación para Tratamiento D - sesión 1', 16),
('Tratamiento D', 'Observación para Tratamiento D - sesión 2', 17),
('Tratamiento D', 'Observación para Tratamiento D - sesión 3', 18),
('Tratamiento D', 'Observación para Tratamiento D - sesión 4', 19),
('Tratamiento D', 'Observación para Tratamiento D - sesión 5', 20),

('Tratamiento E', 'Observación para Tratamiento E - sesión 1', 21),
('Tratamiento E', 'Observación para Tratamiento E - sesión 2', 22),
('Tratamiento E', 'Observación para Tratamiento E - sesión 3', 23),
('Tratamiento E', 'Observación para Tratamiento E - sesión 4', 24),
('Tratamiento E', 'Observación para Tratamiento E - sesión 5', 25),

('Tratamiento F', 'Observación para Tratamiento F - sesión 1', 26),
('Tratamiento F', 'Observación para Tratamiento F - sesión 2', 27),
('Tratamiento F', 'Observación para Tratamiento F - sesión 3', 28),
('Tratamiento F', 'Observación para Tratamiento F - sesión 4', 29),
('Tratamiento F', 'Observación para Tratamiento F - sesión 5', 30),

('Tratamiento G', 'Observación para Tratamiento G - sesión 1', 31),
('Tratamiento G', 'Observación para Tratamiento G - sesión 2', 32),
('Tratamiento G', 'Observación para Tratamiento G - sesión 3', 33),
('Tratamiento G', 'Observación para Tratamiento G - sesión 4', 34),
('Tratamiento G', 'Observación para Tratamiento G - sesión 5', 35),

('Tratamiento H', 'Observación para Tratamiento H - sesión 1', 36),
('Tratamiento H', 'Observación para Tratamiento H - sesión 2', 37),
('Tratamiento H', 'Observación para Tratamiento H - sesión 3', 38),
('Tratamiento H', 'Observación para Tratamiento H - sesión 4', 39),
('Tratamiento H', 'Observación para Tratamiento H - sesión 5', 40),

('Tratamiento I', 'Observación para Tratamiento I - sesión 1', 41),
('Tratamiento I', 'Observación para Tratamiento I - sesión 2', 42),
('Tratamiento I', 'Observación para Tratamiento I - sesión 3', 43),
('Tratamiento I', 'Observación para Tratamiento I - sesión 4', 44),
('Tratamiento I', 'Observación para Tratamiento I - sesión 5', 45),

('Tratamiento J', 'Observación para Tratamiento J - sesión 1', 46),
('Tratamiento J', 'Observación para Tratamiento J - sesión 2', 47),
('Tratamiento J', 'Observación para Tratamiento J - sesión 3', 48),
('Tratamiento J', 'Observación para Tratamiento J - sesión 4', 49),
('Tratamiento J', 'Observación para Tratamiento J - sesión 5', 50),

('Tratamiento K', 'Observación para Tratamiento K - sesión 1', 51),
('Tratamiento K', 'Observación para Tratamiento K - sesión 2', 52),
('Tratamiento K', 'Observación para Tratamiento K - sesión 3', 53),
('Tratamiento K', 'Observación para Tratamiento K - sesión 4', 54),
('Tratamiento K', 'Observación para Tratamiento K - sesión 5', 55),

('Tratamiento L', 'Observación para Tratamiento L - sesión 1', 56),
('Tratamiento L', 'Observación para Tratamiento L - sesión 2', 57),
('Tratamiento L', 'Observación para Tratamiento L - sesión 3', 58),
('Tratamiento L', 'Observación para Tratamiento L - sesión 4', 59),
('Tratamiento L', 'Observación para Tratamiento L - sesión 5', 60),

('sin tratamiento', 'Observación para Tratamiento M - sesión 1', 61),
('sin tratamiento', 'Observación para Tratamiento M - sesión 2', 62),
('sin tratamiento', 'Observación para Tratamiento M - sesión 3', 63)

-- DQL para hacer consultas
select * from mascotas;

select * from dueñosdemascotas;

select * from servicios;

select * from registrodevisitas;

select * from tratamientos;



-- DQL
-- Creación de tabla a partir de consulta
-- Alias en campos
-- Alias en subconsultas
-- Funciones de agregación (COUNT, AVG, MAX, etc.)
-- Alias en funciones de agregación
-- CONCAT
-- UPPER, LOWER
-- LENGTH, SUBSTRING, TRIM
-- ROUND
-- IF en campos


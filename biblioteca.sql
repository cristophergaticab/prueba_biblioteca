-- 1) Crear base de datos --

create database biblioteca;

-- Crear tablas --

create table libros(
isbn bigint primary key,
titulo_libro varchar(200),
num_paginas int,
cod_autor smallint,
nombre_autor varchar(30),
apellido_autor varchar(30),
nacimiento_muerte varchar(10) not null,
tipo_autor varchar(10) not null
);

select * from libros

create table socio (
rut varchar(12) primary key,
nombre varchar(50),
apellido varchar(50),
direccion varchar(50),
telefono varchar (10)
);

select * from socio

create table prestamo(
id_prestamo int primary key,
socio_nombre varchar(25),
libro_nombre varchar(30) not null,
fecha_inicio date,
fecha_realdevolucion date,
libro_isbn bigint not null,
socio_rut varchar(12) not null,
foreign key (libro_isbn) references libros(isbn),
foreign key (socio_rut) references socio (rut)
);

select * from prestamo 

-- Insertar registros en tablas --
insert into libros (isbn, titulo_libro, num_paginas, cod_autor, nombre_autor, apellido_autor, nacimiento_muerte, tipo_autor)
values
(111-1111111-111,'CUENTOS DE TERROR',344,3,'JOSE','SALGADO','1968-2020','PRINCIPAL'),
(111-1111111-112, 'CUENTOS DE TERROR', 344, 3, 'ANA', 'SALGADO', 1972, 'COAUTOR'),
(222-2222222-222, 'POESIAS CONTENPORANEAS', 167, 1, 'ANDRES', 'ULLOA', 1982, 'PRINCIPAL'),
(333-3333333-333, 'HISTORIA DE ASIA', 511, 2, 'SERGIO', 'MARDONES', '1950-2012', 'PRINCIPAL'),
(444-4444444-444, 'MANUAL DE MECANICA', 298, 5, 'MARTIN', 'PORTA', 1976, 'PRINCIPAL');


insert into socio (rut, nombre, apellido, direccion, telefono)
values 
('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111'),
('2222222-2', 'ANA', 'PÉREZ', 'PASAJE 2, SANTIAGO', '922222222'),
('3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333'),
('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3, SANTIAGO', '944444444'),
('5555555-5', 'SILVANA', 'MUÑOZ', 'PASAJE 3, SANTIAGO', '955555555');

insert into prestamo (id_prestamo, socio_nombre, libro_nombre, fecha_inicio, fecha_realdevolucion, libro_isbn, socio_rut)
values 
('1', 'JUAN SOTO', 'CUENTOS DE TERROR', '20-01-2020', '27-01-2020', 111-1111111-111, '1111111-1'),
('2', 'SILVANA MUÑOZ', 'POESÍAS CONTEMPORANEAS', '20-01-2020', '30-01-2020', 222-2222222-222, '5555555-5'),
('3', 'SANDRA AGUILAR', 'HISTORIA DE ASIA', '22-01-2020', '30-01-2020', 333-3333333-333, '3333333-3'),
('4', 'ESTEBAN JEREZ', 'MANUAL DE MECÁNICA', '23-01-2020', '30-01-2020', 444-4444444-444, '4444444-4'),
('5', 'ANA PÉREZ', 'CUENTOS DE TERROR', '27-01-2020', '04-02-2020', 111-1111111-111, '2222222-2'),
('6', 'JUAN SOTO', 'MANUAL DE MECÁNICA', '31-01-2020', '12-02-2020', 444-4444444-444, '1111111-1'),
('7', 'SANDRA AGUILAR', 'POESÍAS CONTEMPORANEAS', '31-01-2020', '12-02-2020', 222-2222222-222, '3333333-3');


-- Consultas --

-- Mostrar todos los libros que posean menos de 300 páginas --
select * from libros where num_paginas <300;

-- Mostrar todos los autores que hayan nacido después del 01-01-1970 --
select nombre_autor, apellido_autor from libros where nacimiento_muerte > '01-01-1970';

-- ¿Cuál es el libro más solicitado? --
select libro_isbn as mas_solicitado, count(libro_isbn) as solicitud from prestamo group by libro_isbn order by solicitud desc limit 1;


-- Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto
-- debería pagar cada usuario que entregue el préstamo después de 7 días.

select socio.nombre, libros.titulo_libro , (fecha_realdevolucion-fecha_inicio)-7 as atraso, (fecha_realdevolucion-fecha_inicio)*100-700 as cobro
from prestamo join socio on socio.rut = prestamo.socio_rut join libros on libros.isbn = prestamo.libro_isbn;

create database instituto;

use instituto;

create table roles(
	id int not null primary key auto_increment, -- para sql server identity
    nombre varchar(20) not null 
);

create table regiones(
	id int not null primary key auto_increment, -- para sql server identity
    nombre varchar(100) not null,
    codigo varchar(10) not null
);

create table comunas(
	id int not null primary key auto_increment,
    nombre varchar(50) not null,
    codigo varchar(20),
    region_id int not null,
    constraint FK_regiones foreign key(region_id) references regiones(id)
);

create table empleados(
	id int not null primary key auto_increment,
	rut varchar(20) not null,
	nombre varchar(200) not null,
	fecha_nacimiento date,
	email varchar(100) not null,
	direccion varchar(255) not null,
	rol_id int not null,
	comuna_id int not null,
	constraint FK_roles foreign key(rol_id) references roles(id),
	constraint FK_comunas foreign key(comuna_id) references comunas(id)
);

create table usuarios(
	id int not null primary key auto_increment,
	email varchar(100) not null,
	clave varchar(255) not null,
	activo int not null,
	usuarioable_id int not null,
	usuarioable_type varchar(20) not null 
);

create table telefonos(
	id int not null primary key auto_increment,
	numero int not null,
	fijo int not null,
	telefonoable_id int not null,
	telefonoable_type varchar(20) not null
);

desc comunas; -- es solo de mysql
show tables; -- es solo mysql

-- insertar datos con campos especificos
insert into roles(nombre) values('Administrador');
insert into roles(nombre) values('Docente');
insert into roles(nombre) values('Jefe de Carrera');

insert into regiones(nombre,codigo) values('Metropolitana de Santiago','XIII');
insert into regiones(nombre,codigo) values('De Valparaiso','V');
insert into regiones(nombre,codigo) values('Del Libertador General Bernardo OHiggins','VI');
insert into regiones(nombre,codigo) values('Del Bio Bio','VIII');

insert into comunas(nombre, codigo, region_id) values('Santiago','',1);
insert into comunas(nombre, codigo, region_id) values('Valparaiso','',2);
insert into comunas(nombre, codigo, region_id) values('Viña del Mar','',2);
insert into comunas(nombre, codigo, region_id) values('Concepcion','',4);
insert into comunas(nombre, codigo, region_id) values('Rancagua','',3);
insert into comunas(nombre, codigo, region_id) values('Estacion Central','',1);
-- insertar datos masivos
insert into roles values(null,'Estudiante');

select * from comunas;
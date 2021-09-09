CREATE Table sedes(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT  NULL,
direccion VARCHAR(255) NOT NULL,
comuna_id INT NOT NULL,
empleado_id INT NOT NULL,
constraint FK_comunas_empleados FOREIGN KEY(comuna_id) REFERENCES comunas(id),
constraint FK_empleados FOREIGN KEY(empleado_id) REFERENCES empleados(id)
);

desc empleados;
select e.id, e.nombre, r.nombre as rol from empleados e
inner join roles r on e.rol_id = r.id;

select s.nombre, s.direccion, c.nombre as comuna, e.nombre as empleado, r.nombre as cargo
from sedes s
inner join empleados e on s.empleado_id = e.id
inner join comunas c on s.comuna_id = c.id
inner join roles r on e.rol_id = r.id;

select e.nombre as escuela, s.nombre as sede, empl.nombre as director
from escuelas e
inner join sedes s on s.id = e.sede_id
inner join empleados empl on empl.id = e.empleado_id;

select car.nombre as carrera, car.codigo, es.nombre as escuela, e.nombre as jefe from carreras car
inner join empleados e on car.empleado_id = e.id
inner join escuelas es on car.escuela_id = es.id;

select * from roles;

select TIMESTAMPDIFF(year,fecha_nacimiento,curdate())  as edad from empleados;

create table escuelas(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) not null,
    sede_id int NOT NULL,
    empleado_id INT NOT NULL,
    FOREIGN KEY(sede_id) REFERENCES sedes(id),
    FOREIGN KEY(empleado_id) REFERENCES empleados(id)
);

create table carreras(
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(100) not null,
    codigo VARCHAR(50) NOT NULL,
    escuela_id INT NOT NULL,
    empleado_id INT NOT NULL,
    FOREIGN KEY(escuela_id) REFERENCES escuelas(id),
    FOREIGN KEY(empleado_id) REFERENCES empleados(id)
);


select * from empleados where rol_id = 3;

--modificacion de datos de una tabla
update roles SET nombre = 'Director de Escuela' where id = 3;

insert into escuelas(nombre,sede_id,empleado_id) values('Tecnologia',1,2);
insert into carreras(nombre,codigo,escuela_id,empleado_id) values('Ingenieria en Informatica','INF001',1,3);

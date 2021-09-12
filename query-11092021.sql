show tables;
desc telefonos;

select * from empleados;
;

--fijo = 1, movil = 2
INSERT INTO telefonos(numero, fijo, telefonoable_id, telefonoable_type) VALUES(963245187, 2, 2,'empleados');

desc telefonos;

--agregar una restriccion de tipo UNIQUE al campo numero de la tabla telefono
ALTER TABLE telefonos modify numero int not null UNIQUE;

--activo = 1, inactivo = 2


desc usuarios;
select * from empleados;

ALTER TABLE usuarios modify email varchar(100) not null unique;

--consultar por emails duplicados
select email, count(email) as cuenta from usuarios GROUP BY email;

select c.nombre as comuna, count(e.id) as total
from empleados e INNER JOIN comunas c ON e.comuna_id = c.id
GROUP BY comuna;

INSERT INTO usuarios (email, clave, activo, usuarioable_id, usuarioable_type) VALUES ('luis.mora@aiep.cl', sha('lmora.123'),1,3,'empleados');

--consulta tipo login
select u.id, e.nombre FROM usuarios u
INNER JOIN empleados e ON e.id = u.usuarioable_id
WHERE u.email = 'pablo.contreras@aiep.cl' AND clave = sha('pcontreras.123') AND u.activo = 1;

update usuarios SET activo = 2 WHERE id = 1;
SELECT * from empleados;
desc empleados;

INSERT into empleados (rut, nombre, fecha_nacimiento, email, direccion, rol_id, comuna_id) VALUES ('20467890-K','Lucia Suarez','1999-09-02','lsuarezj@gmail.com','San Martin 899',3,1);

INSERT into sedes (nombre, direccion, comuna_id, empleado_id) VALUES ('Valparaiso', 'Avenida Peru 415',2,4);

alter TABLE sedes modify empleado_id int not NULL UNIQUE;

SELECT
  count(id) as total,
  round(avg(TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())),2) AS edad_promedio
FROM
  empleados;


Select * from escuelas;

desc roles;

ALTER TABLE escuelas modify empleado_id int not null UNIQUE;

select length(nombre) from roles where id = 3;

select e.id, e.nombre, es.nombre as escuela, s.nombre as sede, r.nombre as cargo from empleados e
inner JOIN roles r ON r.id = e.rol_id
inner join escuelas es ON e.id = es.empleado_id
inner JOIN sedes s ON es.sede_id = s.id
where e.id = 5;

update roles set nombre = 'Jefe(a) de Carrera' where id = 4;

INSERT INTO escuelas (nombre, sede_id, empleado_id) VALUES ('Negocios',1,5);





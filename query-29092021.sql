select e.rut, e.nombre as estudiante, m.fecha_matricula, m.valor, n.nombre as nivel, c.nombre as carrera, es.nombre as escuela, s.nombre as sede from estudiantes e
INNER JOIN matriculas m ON m.estudiante_id = e.id
INNER JOIN niveles n ON n.id = m.nivel_id
INNER JOIN carreras c ON c.id = m.carrera_id
INNER JOIN escuelas es ON es.id = c.escuela_id
INNER JOIN sedes s ON s.id = es.sede_id
LIMIT 3;

select COUNT(*) from matriculas;
select c.nombre as carrera, COUNT(*) as total from matriculas m INNER JOIN carreras c ON m.carrera_id = m.id
GROUP BY carrera;

create or replace View matriculados as
select
  e.rut,
  e.nombre as estudiante,
  m.fecha_matricula,
  m.valor,
  n.nombre as nivel,
  c.nombre as carrera,
  es.nombre as escuela,
  s.nombre as sede
from
  estudiantes e
  INNER JOIN matriculas m ON m.estudiante_id = e.id
  INNER JOIN niveles n ON n.id = m.nivel_id
  INNER JOIN carreras c ON c.id = m.carrera_id
  INNER JOIN escuelas es ON es.id = c.escuela_id
  INNER JOIN sedes s ON s.id = es.sede_id;

  select * from matriculados;
  select sede, escuela, carrera, sum(valor) from matriculados GROUP BY sede, escuela, carrera;

select * from estudiantes;

create Table claves_anteriores(
  id int not null PRIMARY KEY AUTO_INCREMENT,
  usuario_id int not null,
  clave int not null,
  FOREIGN key (usuario_id) REFERENCES usuarios(id)
);

alter table claves_anteriores drop key usuario_id;

alter table claves_anteriores drop usuario_id;

alter table claves_anteriores drop email;

alter Table claves_anteriores add usuario_id int not null after id;

alter Table claves_anteriores modify clave varchar(255) not null;

update usuarios set clave = sha1('123456') where id = 2;
SELECT * from claves_anteriores;
select * from usuarios;
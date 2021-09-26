--eliminar un campo de una tabla

ALTER Table sedes drop constraint FK_empleados;

alter table sedes drop empleado_id;

desc carreras;

ALTER table escuelas drop constraint escuelas_ibfk_2;
alter table escuelas drop empleado_id;

alter table carreras drop constraint carreras_ibfk_2;
alter table carreras drop empleado_id;

CREATE Table asignaciones(
  id int not NULL PRIMARY KEY AUTO_INCREMENT,
  empleado_id INT NOT NULL,
  asignacionable_id int not null,
  asignacionable_type varchar(50) not null,
  FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);

desc asignaciones;

--consulta para conocer la cantidad de estudiantes matriculados por carreras

--creacion de vista
select s.nombre as sede, e.nombre as escuela, c.nombre as carrera, COUNT(m.id) as cantidad
FROM carreras c
LEFT JOIN matriculas m ON m.carrera_id = c.id
INNER JOIN escuelas e ON c.escuela_id = e.id
INNER JOIN sedes s ON s.id = e.sede_id
GROUP BY sede, escuela, carrera;

select * FROM escuelas;

CREATE View matriculados as
  select
    s.nombre as sede,
    e.nombre as escuela,
    c.nombre as carrera,
    COUNT(m.id) as cantidad
  FROM
    carreras c
    LEFT JOIN matriculas m ON m.carrera_id = c.id
    INNER JOIN escuelas e ON c.escuela_id = e.id
    INNER JOIN sedes s ON s.id = e.sede_id
  GROUP BY
    sede,
    escuela,
    carrera;

    select * from matriculados;

    select escuela, sum(cantidad) as cantidad from matriculados GROUP BY escuela;

  INSERT INTO
  matriculas (
    fecha_matricula,
    valor,
    regimen,
    carrera_id,
    estudiante_id,
    nivel_id
  )
VALUES(now(), 0, 2, 2, 2, 1);

select * from carreras;

desc carreras;

delete from carreras where id = 1;

alter table carreras add activo int not null after tecnica;

update carreras set tecnica = 2 WHERE id in(1,3,4);

UPDATE carreras set activo = 2 where id = 4;

select
  c.nombre as carrera,
  count(m.id) as matricula
FROM
  matriculas m
  INNER join carreras c ON c.id = m.carrera_id
GROUP BY
  carrera;

delimiter //
create Procedure pa_consulta_matricula()
  begin
    select c.nombre as carrera, count(m.id) as matricula FROM matriculas m
    INNER join carreras c ON c.id = m.carrera_id
    GROUP BY carrera;
    end //
    DELIMITER;

call pa_consulta_matricula;

select c.nombre as carrera, SUM(m.valor) as total from matriculas m INNER JOIN carreras c on c.id = m.carrera_id where c.nombre = 'Auditoria'
GROUP BY carrera;





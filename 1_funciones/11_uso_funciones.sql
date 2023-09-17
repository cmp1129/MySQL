

/****************************************************************

EJERCICIO 11

Realiza las siguientes consultas y operaciones en la tabla de usuarios utilizando
las funciones realizadas en ejercicios anteriores :

  a) Capitaliza el nombre y el apellido de los usuarios
  b) Poner un password aleatorio a los usuarios
  c) Lista de los usuarios con un DNI erróneo  
  d) Lista de los usuarios mayores de edad.
  e) Cálculo del número de usuarios agrupados por edad.  

****************************************************************/

use prog;

drop table if exists usuario;
create table usuario (
    dni char(9) primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    fecha_n date,
    pwd varchar(20)
);

insert into usuario values 
('12345678A','   EVA','LUNA','1995-12-05','123456'),
('76524706A','INES','  PRADO','2001-09-18','abc4532'),
('30937156V','PABLO','  CANADELL','2002-07-16','56yhuj');


-- SOLUCION :


-- a) Capitaliza el nombre y el apellido de los usuarios

update usuario set nombre=capitaliza(nombre), apellido=capitaliza(apellido);



-- b) Poner un password aleatorio a los usuarios

update usuario set pwd = random_password(8);



-- c) Lista de los usuarios con un DNI erróneo

select * from usuario where not dni_valido(dni);



-- d) Lista de los usuarios mayores de edad

select * from usuario where edad(fecha_n)>=18;



-- e) Cálculo del número de usuarios agrupados por edad.

select edad(fecha_n), count(*) from usuario group by edad(fecha_n);



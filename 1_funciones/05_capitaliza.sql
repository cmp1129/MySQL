/*****************************************************************

EJERCICIO 5

Escribe una función para capitalizar una cadena poniendo la inicial en 
mayúscula y el resto en minúsculas.

Además se deben eliminar los espacios de los extremos.

*****************************************************************/

use prog;

drop function if exists capitaliza;

-- Solución

delimiter $$

create function capitaliza( _nom varchar(50) ) returns varchar(50)
begin
  
  declare _inicial char(1);
  declare _resto varchar(50);
  
  set _nom = trim(_nom); 
  set _inicial = left(_nom,1);
  set _resto = substring(_nom,2);
  
  return concat( upper(_inicial), lower(_resto));
end$$

delimiter ;


-- pruebas

select capitaliza('juan');     -- devuelve 'Juan'
select capitaliza('JUAN');     -- devuelve 'Juan'
select capitaliza('   juan '); -- devuelve 'Juan'

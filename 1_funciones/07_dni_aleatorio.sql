/*******************************************************************************

EJERCICIO 7

Funcion: random_DNI ()

Obtiene un DNI aleatorio válido de 9 caracteres 
( 8 dígitos numéricos más la letra ) con la parte numérica 
igual o superior a 1000
  
Valor de retorno : El DNI generado aleatoriamente

AYUDA: Te puede ser útil la función LPAD() de MySQL

*******************************************************************************/

use prog;

drop function if exists random_DNI;

-- Solución 

delimiter $$

create function random_DNI () returns char(9)
begin

  declare _num   int;
  declare _letra char(1);
  
  set _num   = floor( 1000 + rand()*99999000 );
  
  set _letra = substring('TRWAGMYFPDXBNJZSQVHLCKE', _num % 23 + 1, 1);
  
  return lpad( concat(_num,_letra) ,9,'0');
   
end$$

delimiter ;


-- Prueba

select random_DNI();

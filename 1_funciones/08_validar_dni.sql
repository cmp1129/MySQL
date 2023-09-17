/*******************************************************************************

EJERCICIO 8

Escribe una función para comprobar si un DNI es válido.

Para que sea válido debe tener 8 dígitos numéricos más la letra que le corresponde

AYUDA : 

El operador RLIKE sirve para realizar comparaciones con expresiones regulares.
Te puede ser util la expresión regular [0-9]{8}[A-Z] para validar el formato

*******************************************************************************/

use prog;

drop function if exists dni_valido;

-- Solución 

delimiter $$

create function dni_valido ( _dni char(9) ) returns boolean
begin

    declare _num int;
    declare _letra char(1);
    declare _letraOK char(1);
    
    -- Validamos el formato con una expresión regular
    
    if _dni not rlike '[0-9]{8}[A-Z]' then
      return false;
    end if;
   
    -- Separamos la parte numérica de la letra
    
    set _num = left(_dni,8);
    set _letra = right(_dni,1);
    set _letraOK = substring('TRWAGMYFPDXBNJZSQVHLCKE', _num % 23 + 1, 1);
    
    -- Comprobamos la letra utilizando el algoritmo del ejercicio anterior
    
    if _letra = _letraOK then
      return true;
    else
      return false;
    end if;
    
end$$

delimiter ;

-- Prueba

select dni_valido('123G');        -- devuelve 0 (FALSE)
select dni_valido('12345678A');   -- devuelve 0 (FALSE)
select dni_valido('12345678Z');   -- devuelve 1 (TRUE)
select dni_valido('30937156V');   -- devuelve 1 (TRUE)
select dni_valido('30937156G');   -- devuelve 0 (FALSE)


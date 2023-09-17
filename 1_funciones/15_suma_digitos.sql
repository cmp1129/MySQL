
/*******************************************************************************

EJERCICIO 15

Función : suma_digitos( _num int )

Función que devuelve la suma de los dígitos de un número.

Parámetros:
  _num : Un número entero
  
Valor de retorno : La suma de los dígitos del parámetro _num

AYUDA : 
En SQL la conversión entre cadenas y enteros es automática.
Podemos guardar _num en una cadena de caracteres y luego hacer un bucle para sumar
dígito a dígito.

*******************************************************************************/

use prog;

drop function if exists suma_digitos;

-- SOLUCION

delimiter $$

create function suma_digitos( _num int ) returns int
begin
    declare _cadena varchar(20);
    declare _suma int;
    declare _i int;

    set _cadena = _num; -- conversión de tipos automática
    
    set _i = 1;
    set _suma = 0;
    
    while _i <= character_length(_cadena) do
        set _suma = _suma + substring(_cadena,_i,1);
        set _i = _i + 1;
    end while;
    
    return _suma;    
end$$

delimiter ;


-- Prueba :

select suma_digitos(111000);  -- debe devolver 3
select suma_digitos(12120);   -- debe devolver 6


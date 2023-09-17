
/*******************************************************************************

EJERCICIO 14

Función : cuenta_letras( _cadena, _letra )

Función que devuelve el número de veces que aparece un carácter en una cadena.

Parámetros:
  _cadena : Es la cadena que hay que examinar
  _letra  : Es la letra que hay que buscar
  
Valor de retorno : El número de veces que aparece _letra en _cadena  


*******************************************************************************/

use prog;

drop function if exists cuenta_letra;

-- SOLUCION

delimiter $$

create function cuenta_letra( _cadena varchar(255), _letra char(1)) returns int
begin
    
    declare _i int;
    declare _n int;
    
    set _i = 1;
    set _n = 0;
    
    while _i <= character_length(_cadena) do
        if substring(_cadena,_i,1)=_letra then
            set _n = _n + 1;
        end if;
        set _i = _i + 1;
    end while;
    
    return _n;    
end$$

delimiter ;


-- Prueba :

select cuenta_letra('programacion','a');        -- debe devolver 2
select cuenta_letra('yo me quedo en casa','e'); -- debe devolver 3


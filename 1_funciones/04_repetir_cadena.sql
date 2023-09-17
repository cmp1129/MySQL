/*******************************************************************************

EJERCICIO 4. 

Función que devuelve una cadena de como máximo 500 caracteres concatenando 
una cadena dada las veces que se le pida.
 
Si se necesitaran más de 500 caracteres la función devuelve un valor null

*******************************************************************************/

use prog;

drop function if exists repetir;

-- Solución

delimiter $$

create function repetir ( _cadena varchar(500), _veces int ) returns varchar(500)
begin
    
    -- Declaraciones
    
    declare _total varchar(500) default '';
    declare _i int default 0;
    
    -- Comprobación inicial
    
    if char_length(_cadena)*_veces > 500 then
      return null;
    end if;
    
    -- Bucle para concatenar
    
    while _i < _veces do

        set _total = concat(_total,_cadena);
        set _i = _i + 1;
    
    end while;
    
    -- Devolver resultado
    
    return _total;
    
    
end$$

delimiter ;


-- pruebas

select repetir('hola',3);      -- devuelve holaholahola
select repetir('adios',500);   -- devuelve null

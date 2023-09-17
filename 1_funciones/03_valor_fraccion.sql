/********************************************************************

EJERCICIO 3

Escribe una función que devuelva el valor numérico de una fracción.

La fracción puede no tener denominador y ser simplemente un número.

********************************************************************/

use prog;

drop function if exists valor_fraccion;

-- Solución

delimiter $$

create function valor_fraccion ( _frac varchar(20) ) returns double
begin

    declare _pos int;
    declare _num int;
    declare _den int;
    declare _valor double;
    
    -- Buscamos la posición de la barra
    
    set _pos = instr(_frac,'/');
    
    -- Comprobamos si la barra se ha encontrado
    
    if _pos=0 then    
    
        set _valor = _frac;      
        
    else
    
        set _num = left(_frac,_pos-1);
        set _den = substring(_frac,_pos+1);
        set _valor = _num/_den;        
        
    end if;
    
    return _valor;
    
end$$

delimiter ;

-- pruebas

select valor_fraccion('125');     -- devuelve 125
select valor_fraccion('12/5');    -- devuelve 2.4
select valor_fraccion('10/100');  -- devuelve 0.1




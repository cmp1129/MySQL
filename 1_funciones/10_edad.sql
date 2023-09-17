
/*******************************************************************************

EJERCICIO 10

Escribe una función para calcular la edad de una persona a partir de la 
fecha de nacimiento.

Si la fecha de nacimiento es posterior a la actual devuelve -1


Planteamiento :
--------------------

Como ejemplo, si estamos en 2020 las personas nacidas en el año 2000 
tendrán 20 años, excepto las nacidas:

- en un mes posterior al actual (tendrán 19 años)

- en el mes actual pero en un dia posterior al actual (tendrán 19 años)

*******************************************************************************/

use prog;

drop function if exists edad;


-- SOLUCION

delimiter $$

create function edad ( _fecha_n date ) returns int
begin
 
    declare _edad int;
    declare _hoy date;
    
    set _hoy = curdate();
    
    -- Comprobación del valor del parámetro
    
    if _fecha_n > _hoy then
      return -1;
    end if;


    -- Calculamos la diferencia de los años

    set _edad = year(_hoy) - year(_fecha_n);
    
    -- Aplicamos las comparaciones explicadas en el enunciado

    if ( month(_fecha_n) > month(_hoy) ) then
      
        set _edad = _edad - 1;
    
    elseif ( month(_fecha_n) = month(_hoy) and day(_fecha_n)>day(_hoy)) then
    
        set _edad = _edad - 1;
    
    end if;
    
    return _edad;
end$$

delimiter ;


-- Pruebas : 
-- probamos con la fecha de hace 5 años exactamente y con más/menos un día

select edad( curdate() - interval 5 year - interval 1 day); -- debe dar 5
select edad( curdate() - interval 5 year);                  -- debe dar 5 
select edad( curdate() - interval 5 year + interval 1 day); -- debe dar 4

select edad(curdate() + interval 1 day);                    -- debe dar -1




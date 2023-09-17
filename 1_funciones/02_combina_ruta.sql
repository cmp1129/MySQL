/*******************************************************************

EJERCICIO 2

Escribe una función que reciba la ruta de una carpeta y el nombre de un 
fichero y devuelva la ruta completa combinando ambas partes.

El nombre de la carpeta puede tener la barra al final o no

Si el nombre de la carpeta es un valor nulo debe devolver solamente el 
nombre del fichero.

*******************************************************************/

use prog;

drop function if exists combina_ruta;

-- Solución

delimiter $$

create function combina_ruta( _carpeta varchar(200), _fichero varchar(100))
returns varchar(200)
begin
    declare _total varchar(200);
    
    if _carpeta is null then
    
        set _total = _fichero;
        
    elseif right(_carpeta,1)='/' then
    
        set _total = concat(_carpeta,_fichero);
        
    else
    
        set _total = concat(_carpeta,'/',_fichero);
        
    end if;    
    
    return _total;
    
end$$

delimiter ;


-- prueba

select combina_ruta('/web/img','leoncio.png');  -- devuelve /web/img/leoncio.png
select combina_ruta('/web/img/','triston.png'); -- devuelve /web/img/triston.png
select combina_ruta(null,'magila_gorila.png');  -- devuelve magila_gorila.png

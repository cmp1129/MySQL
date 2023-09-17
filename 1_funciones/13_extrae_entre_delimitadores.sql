
/********************************************************************************

EJERCICIO 13

Función : extrae ( _cadena, _delim1, _delim2 )

Función que a partir de una cadena devuelve la subcadena contenida entre dos 
delimitadores dados.

Solo tiene en cuenta la primera aparición del primer delimitador y la primera 
aparición del segundo delimitador posteriormente al primero.

Si tal subcadena no existe la función debe devolver un valor NULL

AYUDA: Para buscar a partir de determinada posición usar la función LOCATE() de MySQL

*********************************************************************************/

use prog;

drop function if exists extrae;

-- SOLUCION

delimiter $$

create function extrae( _cadena varchar(200), _delim1 char(1), _delim2 char(1)) returns varchar(200)
begin
    
    declare _pos1 int;
    declare _pos2 int;    
    
    set _pos1 = locate(_delim1,_cadena); -- también se podía usar instr()
    
    if _pos1 = 0 then 
        return null;
    end if;
    
    set _pos2 = locate(_delim2,_cadena,_pos1+1); --busca detrás de _delim1
    
    if _pos2 = 0 then
        return null;
    end if;
    
    return  substring(_cadena, _pos1+1, _pos2-_pos1-1);
    
end$$

delimiter ;


-- pruebas

select extrae( 'C. Rambla, 15 (08081) Barcelona','(',')'); -- debe devolver 08081
select extrae( 'wsedr[]hjk','[',']');         -- debe devolver una cadena vacía
select extrae( 'sds}fdha', '{','}' );         -- debe devolver NULL


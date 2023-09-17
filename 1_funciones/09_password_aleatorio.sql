/*****************************************************************

EJERCICIO 9

Escribe una función para obtener un password aleatorio formado por números,
letras mayúsculas y letras minúsculas

La longitud del password debe ser un parámetro de la función

*****************************************************************/

use prog;

drop function if exists random_password;


-- SOLUCION :

delimiter $$

create function random_password ( _len int ) returns varchar(255)
begin    
    
    declare _validos varchar(200);
    declare _pass varchar(255);
    declare _letra char(1);
    declare _i, _pos int;
    
    set _validos = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';    
    set _pass = '';
    set _i = 0;
    while _i < _len do
                
        set _pos  = floor(1+rand()*char_length(_validos));        
        set _letra = substring(_validos, _pos, 1);
        set _pass = concat(_pass, _letra);
        set _i    = _i + 1;
        
    end while;

    return _pass;
end$$

delimiter ;


-- prueba

select random_password(20);

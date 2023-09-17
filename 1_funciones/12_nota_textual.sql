/*******************************************************************************

EJERCICIO 12

Escribir una función que nos de la nota textual que le corresponde a una nota
numérica en un examen. La nota puede tenr decimales y no se redondea

0 <= nota < 5 --> Insuficiente
5 <= nota < 6 --> Suficiente
6 < nota <= 7 --> Bien
7 < nota <= 9 --> Notable
9 < nota <=10 --> Excelente

*******************************************************************************/

use prog;

drop function if exists nota_textual;

-- SOLUCION :

delimiter $$

create function nota_textual ( _nota double ) returns varchar(20)
begin

    if _nota not between 0 and 10 then 
        return 'Incorrecto';
    elseif _nota>=9 then
        return 'Excelente';
    elseif _nota>=7 then
        return 'Notable';
    elseif _nota >=6 then
        return 'Bien';
    elseif _nota>=5 then
        return 'Suficiente';
    else 
        return 'Insuficiente';
    end if;
end$$

delimiter ;

 -- otra posible solución con CASE


drop function if exists nota_textual_2; 

create function nota_textual_2 ( _nota double ) returns varchar(20)
  return 
    case 
        when _nota not between 0 and 10 then 'Incorrecto'
        when _nota >=9 then 'Excelente'
        when _nota >=7 then 'Notable'
        when _nota >=6 then 'Bien'
        when _nota >=5 then 'Suficiente'
        else 'Insuficiente'
    end;

    
-- Pruebas:

select nota_textual(3.6);
select nota_textual(5);
select nota_textual(6.8);
select nota_textual(7.1);
select nota_textual(10);
select nota_textual(11);

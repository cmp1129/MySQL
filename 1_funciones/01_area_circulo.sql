/*******************************************************************************

EJERCICIO 1. 

Escribe una función para calcular el área de un círculo. El parámetro es el radio.

El área de un círculo se obtiene multiplicando PI por el cuadrado del radio.

En MySQL existe la función PI() que nos da el valor de PI.
 
*******************************************************************************/

use prog;

drop function if exists area_circulo;

-- Solución

create function area_circulo ( _radio double ) returns double
  return pi() * _radio * _radio; 


-- pruebas

select area_circulo(8);

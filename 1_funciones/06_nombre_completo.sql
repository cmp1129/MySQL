/*******************************************************************************

EJERCICIO 6

Funcion: nombre_completo ( _nombre, _apellido )

Obtiene una cadena con el apellido y el nombre capitalizados y separados por una coma.

(No se deben tener en cuenta los nombres y apellidos compuestos como José Luis del Monte)


*******************************************************************************/

use prog;

drop function if exists nombre_completo;


-- Solución :

-- aprovechamos la función realizada en el ejercicio anterior

create function nombre_completo ( _nombre varchar(50), _apellido varchar(50) )
returns varchar(102)
  
  return concat(capitaliza(_apellido),', ',capitaliza(_nombre));
  


-- pruebas

select nombre_completo('  juan', ' barril  '); -- devuelve 'Barril, Juan'
select nombre_completo('iSABEL ', 'robles'); -- devuelve 'Robles, Isabel'

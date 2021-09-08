Nuestro Sql debe contener lo siguiente



Este script debe ser reejecutable, me permite instalar todos los menús, de manera que si voy a una base limpia corro este script y me instala toda la estructura, para esto:

/***CREAR EL ROL CAPACITACION SEMILLERO****/
0) Borra el rol si ya existe y lo crea de nuevo
1)	Busca el id del rol ‘CAPACITACION’ y lo guarda en una variable
2)	Borra de la cew_menu_role, todos los registros que le corresponden a dicho rol

//Crear menu fase 4
3)	Crear el menú FASE 4
a.	Buscar el menú con el url de fase 4 y lo guarda en una variable
b.	Si existe lo borra
c.	Inserta el menú fase 4
d.	Asigna permisos sobre este menú al rol CAPACITACION SEMILLERO

//Menus de cada uno
4)	Crear los menús principales, para cada estudiante: 
a.	Buscar el menú con el url de su menú principal, guardarlo en una variable.
b.	Si existe borrarlo
c.	Insertar su menú principal
d.	Asignar permisos sobre este menú al rol CAPACITACION SEMILLERO


5)	Crear los nuevos menús con la pantalla del formulario creado por cada uno. Siguiendo la misma lógica de los puntos 3 y 4, entra borrando, inserta y da permisos

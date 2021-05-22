/* ACTIVAR SALIDA DE TEXTO POR PANTALLA*/

SET SERVEROUTPUT ON;


/*DECLARACION DE VARIABLES*/

BEGIN
--PRUEBA TABLA EMPLEADOS
PACK_EMPLEADOS.INICIALIZAR;
PACK_EMPLEADOS.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_EMPLEADOS.INSERTAR('Prueba 2 - nombreprueba', nuevovalor, salidaesperada);
PACK_EMPLEADOS.ACTUALIZAR('Prueba 3 - nombreprueba', nuevovalor, salidaesperada);
PACK_EMPLEADOS.ACTUALIZAR('Prueba 4 - nombreprueba', nuevovalor, salidaesperada);
PACK_EMPLEADOS.ELIMINAR('Prueba 5 - nombreprueba', nuevovalor, salidaesperada);
--PRUEBA TABLA LIGAS
PACK_LIGAS.INICIALIZAR;
PACK_LIGAS.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_LIGAS.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_LIGAS.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_LIGAS.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_LIGAS.ELIMINAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
--PRUEBA TABLA EVENTOS
PACK_EVENTOS.INICIALIZAR;
PACK_EVENTOS.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_EVENTOS.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_EVENTOS.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_EVENTOS.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_EVENTOS.ELIMINAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
--PRUEBA TABLA COMPITEEN
PACK_COMPITE_EN.INICIALIZAR;
PACK_COMPITE_EN.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_COMPITE_EN.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_COMPITE_EN.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_COMPITE_EN.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_COMPITE_EN.ELIMINAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
--PRUEBA TABLA JUEGA
PACK_JUEGA.INICIALIZAR;
PACK_JUEGA.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_JUEGA.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_JUEGA.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_JUEGA.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_JUEGA.ELIMINAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
--PRUEBA TABLA SE ENFRENTAEN
PACK_SE_ENFRENTA_EN.INICIALIZAR;
PACK_SE_ENFRENTA_EN.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_SE_ENFRENTA_EN.INSERTAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_SE_ENFRENTA_EN.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_SE_ENFRENTA_EN.ACTUALIZAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
PACK_SE_ENFRENTA_EN.ELIMINAR('Prueba 1 - nombreprueba', nuevovalor, salidaesperada);
--PRUEBA TABLA

--PRUEBA TABLA

--PRUEBA TABLA


END;
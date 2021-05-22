SET SERVEROUTPUT ON;
--LAS PRUEBAS DE ELIMINAR ELEMENTOS SE REALIZAR�N AL FINAL
DECLARE
    OID_EQUIPO INTEGER;
    OID_ESTADISTICA INTEGER;
    OID_ESTADISTICA_FIFA INTEGER;
    OID_ESTADISTICA_FORTNITE INTEGER;
    OID_ESTADISTICA_BRAWL INTEGER;
BEGIN
------------------------------------
--PRUEBAS PARA LA TABLA EQUIPOS
------------------------------------
    PACK_EQUIPOS.INICIALIZAR();
    PACK_EQUIPOS.INSERTAR('PRUEBA 1 - INSERCI�N DE EQUIPO', 'TITANS', 1, 3, NULL, TRUE);
    OID_EQUIPO := SEC_OID_EQ.CURRVAL;
    PACK_EQUIPOS.INSERTAR('PRUEBA 2 - INSERCI�N DE EQUIPO CON NOMBRE NULL', NULL, 2, 67, NULL, FALSE);
    PACK_EQUIPOS.MODIFICAR('PRUEBA 3 - MODIFICACI�N DE EQUIPO', OID_EQUIPO, 'GIANTS', 4, 15, NULL, TRUE);
    PACK_EQUIPOS.MODIFICAR('PRUEBA 4 - CAMBIO DEL NOMBRE DEL EQUIPO A NULL', OID_EQUIPO, NULL, 8, 32, NULL, FALSE);
    --PACK_EQUIPOS.ELIMINAR('PRUEBA ELIMINACI�N DE EQUIPO', OID_EQUIPO, TRUE);
    DBMS_OUTPUT.put_line('');
    
-----------------------------------------------------------------------------------------------------------
--PRUEBAS PARA LA TABLA JUGADORES, LO QUE INCLUYE A LAS PRUEBAS DE LA TABLA EMPLEADOS AL SER SU TABLA PADRE
-----------------------------------------------------------------------------------------------------------

--PRUEBAS RELACIONADAS CON JUGADORES
    PACK_JUGADORES.INICIALIZAR();
    PACK_JUGADORES.INSERTAR('PRUEBA 1 - INSERCI�N DE JUGADOR', '21153329E', 'HEGOA RIA HERRERA', 18, 600065504,
                             'LOL',TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2020-06-07', 'YYYY-MM-DD'),'N',
                            50, 'HEGOARIA@GMAIL.COM', 'TREMOR', 'TW:@HEGOA', 'AVENIDA REINA MERCEDES 43', 'M',
                            'JUNGLA', NULL, NULL, NULL, NULL, OID_EQUIPO, TRUE);
    PACK_JUGADORES.INSERTAR('PRUEBA 2 - INSERCI�N DE JUGADOR CON DNI NULL', NULL, 'MANUEL HERRERA FERNANDEZ', 22, 700065504,
                             'LOL',TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-06-01', 'YYYY-MM-DD'),'Y',
                            50, 'MANHERFER@GMAIL.COM', 'MANOLO', 'IG:@MANHERFER32', 'AVENIDA REINA MERCEDES 1', 'L',
                            'TOPLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.MODIFICAR('PRUEBA 3 - MODIFICACI�N DE JUGADOR', '21153329E', 'FERNANDO RIA HERRERA', 20, 633633198,
                             'FIFA',TO_DATE('2020-01-22', 'YYYY-MM-DD'), TO_DATE('2020-06-10', 'YYYY-MM-DD'),'Y',
                            45, 'HEGOARIAHERRERA@GMAIL.COM', 'CR7', 'IG:@HEGOA', 'AVENIDA REINA MERCEDES 30', 'L',
                            'CENTRO', NULL, NULL, NULL, NULL, OID_EQUIPO, TRUE);
                            
--PRUEBAS RELACIONADAS CON EMPLEADOS
    PACK_JUGADORES.INSERTAR('PRUEBA 4 - INSERCI�N DE EMPLEADO CON DNI YA EXISTENTE (RN-06)',  '21153329E', 'CARLOS RIA HERRERA', 19, 123456789,
                             'LOL',TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2020-06-07', 'YYYY-MM-DD'),'N',
                            50, 'HEGOARIA@GMAIL.COM', 'TREMOR', 'TW:@HEGOA', 'AVENIDA REINA MERCEDES', 'M',
                            'MIDLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, TRUE);
    PACK_JUGADORES.INSERTAR('PRUEBA 5 - INSERCI�N DE EMPLEADO CON EDAD NULL', '12345678A', 'MANUEL HERRERA FERNANDEZ', NULL, 700065504,
                             'LOL',TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-06-01', 'YYYY-MM-DD'),'Y',
                            50, 'MANHERFER@GMAIL.COM', 'MANOLO', 'IG:@MANHERFER32', 'AVENIDA REINA MERCEDES 1', 'L',
                            'TOPLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.INSERTAR('PRUEBA 6 - INSERCI�N DE EMPLEADO CON NOMBRE NULL', '12345678A', NULL, 40, 700065504,
                             'LOL',TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-06-01', 'YYYY-MM-DD'),'Y',
                            50, 'MANHERFER@GMAIL.COM', 'MANOLO', 'IG:@MANHERFER32', 'AVENIDA REINA MERCEDES 1', 'L',
                            'TOPLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.INSERTAR('PRUEBA 7 - INSERCI�N DE EMPLEADO CON NUMERO DE TEL�FONO YA EXISTENTE', '12345678A',
                            'MANUEL HERRERA FERNANDEZ', 40, 123456789,
                             'LOL',TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-06-01', 'YYYY-MM-DD'),'Y',
                            50, 'MANHERFER@GMAIL.COM', 'MANOLO', 'IG:@MANHERFER32', 'AVENIDA REINA MERCEDES 1', 'L',
                            'TOPLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.INSERTAR('PRUEBA 8 - INSERCI�N DE EMPLEADO CON NICK NULL', '12345678A', 'FELICIA GOMEZ CARRASCO', 40, 700065504,
                             'LOL',TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-06-01', 'YYYY-MM-DD'),'Y',
                            50, 'MANHERFER@GMAIL.COM', NULL, 'IG:@MANHERFER32', 'AVENIDA REINA MERCEDES 1', 'L',
                            'TOPLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.INSERTAR('PRUEBA 9 - INSERCI�N DE EMPLEADO CON CAMPO SECCION FUERA DEL RANGO DEL ENUMERATE','12345678A',
                            'MANUEL HERRERA FERNANDEZ', 40, 999999999,
                             'JUEGONOEXISTENTE',TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-06-01', 'YYYY-MM-DD'),'Y',
                            50, 'MANHERFER@GMAIL.COM', 'MANOLO', 'IG:@MANHERFER32', 'AVENIDA REINA MERCEDES 1', 'L',
                            'TOPLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.INSERTAR('PRUEBA 10 - INSERCI�N DE EMPLEADO CON CAMPO EXPERIENCIAPREVIA FUERA DEL RANGO DEL ENUMERATE',
                             '12345678A', 'MANUEL HERRERA FERNANDEZ', 40, 999999999,
                             'LOL',TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-06-01', 'YYYY-MM-DD'),'W',
                            50, 'MANHERFER@GMAIL.COM', 'MANOLO', 'IG:@MANHERFER32', 'AVENIDA REINA MERCEDES 1', 'L',
                            'TOPLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.INSERTAR('PRUEBA 11 - INSERCI�N DE EMPLEADO CON CAMPO TALLA FUERA DEL RANGO DEL ENUMERATE',
                             '12345678A', 'MANUEL HERRERA FERNANDEZ', 40, 999999999,
                             'LOL',TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-06-01', 'YYYY-MM-DD'),'Y',
                            50, 'MANHERFER@GMAIL.COM', 'MANOLO', 'IG:@MANHERFER32', 'AVENIDA REINA MERCEDES 1', 'DE',
                            'TOPLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.INSERTAR('PRUEBA 12 - INSERCI�N DE EMPLEADO CON FECHAINICIOCONTRATO > FECHAFINCONTRATO',
                             '12345678A', 'MANUEL HERRERA FERNANDEZ', 40, 999999999,
                             'LOL',TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-02-01', 'YYYY-MM-DD'),'Y',
                            50, 'MANHERFER@GMAIL.COM', 'MANOLO', 'IG:@MANHERFER32', 'AVENIDA REINA MERCEDES 1', 'L',
                            'TOPLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.MODIFICAR('PRUEBA 13 - CAMBIO DE EDAD A NULL', '21153329E', 'CARLOS RIA HERRERA', NULL, 123456789,
                             'LOL',TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2020-06-07', 'YYYY-MM-DD'),'N',
                            50, 'HEGOARIA@GMAIL.COM', 'TREMOR', 'TW:@HEGOA', 'AVENIDA REINA MERCEDES', 'M',
                            'MIDLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.MODIFICAR('PRUEBA 14 - CAMBIO DE NOMBRE A NULL', '21153329E', NULL, 19, 123456789,
                             'LOL',TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2020-06-07', 'YYYY-MM-DD'),'N',
                            50, 'HEGOARIA@GMAIL.COM', 'TREMOR', 'TW:@HEGOA', 'AVENIDA REINA MERCEDES', 'M',
                            'MIDLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.INSERTAR('PRUEBA 15.A - INSERCI�N DE EMPLEADO','21153329F', 'MIGUEL CERVANTES TORNERO', 23, 987654321,
                             'FORTNITE',TO_DATE('2020-08-20', 'YYYY-MM-DD'), TO_DATE('2020-12-07', 'YYYY-MM-DD'),'Y',
                            40, 'HEGOARIA@GMAIL.COM', 'LOLITO', 'TW:@LOLITO', 'CALLE SEVILLA 13', 'S',
                            NULL, NULL, NULL, NULL, NULL, OID_EQUIPO, TRUE);
    PACK_JUGADORES.MODIFICAR('PRUEBA 15.B - CAMBIO DE NUMERO DE TEL�FONO A UNO YA EXISTENTE',
                             '21153329F', 'MIGUEL CERVANTES TORNERO', 23, 123456789,
                             'FORTNITE',TO_DATE('2020-08-20', 'YYYY-MM-DD'), TO_DATE('2020-12-07', 'YYYY-MM-DD'),'Y',
                            40, 'HEGOARIA@GMAIL.COM', 'LOLITO', 'TW:@LOLITO', 'CALLE SEVILLA 13', 'S',
                            NULL, NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.MODIFICAR('PRUEBA 16 - CAMBIO DE NICK A NULL', '21153329E', 'CARLOS RIA HERRERA', 19, 123456789,
                             'LOL',TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2020-06-07', 'YYYY-MM-DD'),'N',
                            50, 'HEGOARIA@GMAIL.COM', NULL, 'TW:@HEGOA', 'AVENIDA REINA MERCEDES', 'M',
                            'MIDLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.MODIFICAR('PRUEBA 17 - CAMBIO DE SECCI�N FUERA DEL LIMITE DEL ENUMERATE',
                              '21153329E', 'CARLOS RIA HERRERA', 19, 123456789,
                             'JUEGONOEXISTENTE',TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2020-06-07', 'YYYY-MM-DD'),'N',
                            50, 'HEGOARIA@GMAIL.COM', 'TREMOR', 'TW:@HEGOA', 'AVENIDA REINA MERCEDES', 'M',
                            'MIDLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.MODIFICAR('PRUEBA 18 - CAMBIO DE EXPERIENCIAPREVIA FUERA DEL LIMITE DEL ENUMERATE',
                              '21153329E', 'CARLOS RIA HERRERA', 19, 123456789,
                             'LOL',TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2020-06-07', 'YYYY-MM-DD'),'W',
                            50, 'HEGOARIA@GMAIL.COM', 'TREMOR', 'TW:@HEGOA', 'AVENIDA REINA MERCEDES', 'M',
                            'MIDLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.MODIFICAR('PRUEBA 19 - CAMBIO DE TALLA FUERA DEL LIMITE DEL ENUMERATE', 
                              '21153329E', 'CARLOS RIA HERRERA', 19, 123456789,
                             'LOL',TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2020-06-07', 'YYYY-MM-DD'),'N',
                            50, 'HEGOARIA@GMAIL.COM', 'TREMOR', 'TW:@HEGOA', 'AVENIDA REINA MERCEDES', 'DE',
                            'MIDLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    PACK_JUGADORES.MODIFICAR('PRUEBA 20 - CAMBIO DE FECHAS PARA QUE FECHAINICIOCONTRATO > FECHAFINCONTRATO',
                              '21153329E', 'CARLOS RIA HERRERA', 19, 123456789,
                             'LOL',TO_DATE('2020-10-20', 'YYYY-MM-DD'), TO_DATE('2020-02-07', 'YYYY-MM-DD'),'N',
                            50, 'HEGOARIA@GMAIL.COM', 'TREMOR', 'TW:@HEGOA', 'AVENIDA REINA MERCEDES', 'M',
                            'MIDLANER', NULL, NULL, NULL, NULL, OID_EQUIPO, FALSE);
    --PACK_JUGADORES.ELIMINAR('PRUEBA ELIMINAR JUGADOR/EMPLEADO', '21153329E', TRUE);
    DBMS_OUTPUT.put_line('');
    
----------------------------------
--PRUEBAS DE LA TABLA ESTADISTICAS
----------------------------------
    PACK_ESTADISTICAS.INICIALIZAR();
    PACK_ESTADISTICAS.INSERTAR('PRUEBA 1 - INSERTAR ESTADISTICA', 'Enero', 50, '21153329F', TRUE);
    OID_ESTADISTICA := SEC_OID_ST.CURRVAL;
    PACK_ESTADISTICAS.INSERTAR('PRUEBA 2 - INSERTAR ESTADISTICA CON DNI NULL', 'Enero', 50, NULL, FALSE);
    PACK_ESTADISTICAS.INSERTAR('PRUEBA 3 - INSERTAR ESTADISTICA CON MES FUERA DEL RANGO DEL ENUMERATE','MESNOEXISTENTE', 50, '21153329F', FALSE);
    PACK_ESTADISTICAS.INSERTAR('PRUEBA 4 - INSERTAR ESTADISTICA CON HORASTRABAJADAS < 40 (RN-01)', 'Enero', 30, '21153329E', FALSE);
    PACK_ESTADISTICAS.MODIFICAR('PRUEBA 5 - MODIFICAR ESTADISTICA', OID_ESTADISTICA, 'Febrero', 60, '21153329E', TRUE);
    PACK_ESTADISTICAS.MODIFICAR('PRUEBA 6 - CAMBIO DE DNI A NULL', OID_ESTADISTICA, 'Febrero', 60, NULL, FALSE);
    PACK_ESTADISTICAS.MODIFICAR('PRUEBA 7 - CAMBIO DE MES FUERA DEL RANGO DEL ENUMERATE', OID_ESTADISTICA, 'MESNOESXISTENTE', 60, '21153329E', FALSE);
    PACK_ESTADISTICAS.MODIFICAR('PRUEBA 8 - CAMBIO DE HORASTRABAJADAS A MENOS DE 40', OID_ESTADISTICA, 'Febrero', 30, '21153329E', FALSE);
    --PACK_ESTADISTICAS.ELIMINAR('PRUEBA ELIMINAR ESTADISTICA', OID_ESTADISTICA, TRUE);
    DBMS_OUTPUT.put_line('');
    
--------------------------------------    
--PRUEBAS DE LA TABLA ESTADISTICASFIFA
--------------------------------------
    PACK_ESTADISTICAS_FIFA.INICIALIZAR();
    PACK_ESTADISTICAS_FIFA.INSERTAR('PRUEBA 1 - INSERTAR ESTADISTICA_FIFA', 'Enero', 50, '21153329F', 54.47, 7.3, TRUE);
    OID_ESTADISTICA_FIFA := SEC_OID_ST.CURRVAL;
    PACK_ESTADISTICAS_FIFA.INSERTAR('PRUEBA 2 - INSERTAR ESTADISTICA_FIFA CON GOLESPORPARTIDO < 0', 'Enero', 50, '21153329E', 54.47, -7.0, FALSE);
    PACK_ESTADISTICAS_FIFA.MODIFICAR('PRUEBA 3 - MODIFICAR ESTADISTICA_FIFA', OID_ESTADISTICA_FIFA, 'Marzo', 70, '21153329E', 100.00, 20.0, TRUE);
    PACK_ESTADISTICAS_FIFA.MODIFICAR('PRUEBA 4 - CAMBIAR GOLESPORPARTIDO A UN NUMERO MENOR QUE 0', OID_ESTADISTICA_FIFA, 'Marzo', 70, '21153329E', 100.00, -33.4, FALSE);
    --PACK_ESTADISTICAS_FIFA.ELIMINAR('PRUEBA ELIMINAR ESTADISTICA_FIFA', OID_ESTADISTICA_FIFA, TRUE);
    DBMS_OUTPUT.put_line('');
    
------------------------------------------
--PRUEBAS DE LA TABLA ESTADISTICASFORTNITE
------------------------------------------
    PACK_ESTADISTICAS_FORTNITE.INICIALIZAR();
    PACK_ESTADISTICAS_FORTNITE.INSERTAR('PRUEBA 1 - INSERTAR ESTADISTICA_FORTNITE', 'Enero', 50, '21153329F', 10, 111.11, TRUE);
    OID_ESTADISTICA_FORTNITE := SEC_OID_ST.CURRVAL;
    PACK_ESTADISTICAS_FORTNITE.INSERTAR('PRUEBA 2 - INSERTAR ESTADISTICA_FORTNITE CON HORASSTREAMING <= 5', 'Enero', 50, '21153329E', 0, 111.11, FALSE);
    PACK_ESTADISTICAS_FORTNITE.MODIFICAR('PRUEBA 3 - MODIFICAR ESTADISTICA_FORTNITE', OID_ESTADISTICA_FORTNITE, 'Abril', 55, '21153329E', 15, 222.22, TRUE);
    PACK_ESTADISTICAS_FORTNITE.MODIFICAR('PRUEBA 4 - CAMBIAR HORASSTEAMING A UN NUMERO MENOR O IGUAL QUE 5', OID_ESTADISTICA_FORTNITE, 'Abril', 55, '21153329E', 5, 222.22, FALSE);
    --PACK_ESTADISTICAS_FORTNITE.ELIMINAR('PRUEBA ELIMINAR ESTADISTICA_FORTNITE', OID_ESTADISTICA_FORTNITE, TRUE);
    DBMS_OUTPUT.put_line('');

    
--------------------------------------------
--PRUEBAS DE LA TABLA ESTADISTICASBRAWLSTARS
--------------------------------------------
    PACK_ESTADISTICAS_BRAWL.INICIALIZAR();
    PACK_ESTADISTICAS_BRAWL.INSERTAR('PRUEBA 1 - INSERTAR ESTADISTICA_BRAWL_STARS', 'Enero', 50, '21153329F', 48.75, 32.34, 5000, TRUE);
    OID_ESTADISTICA_BRAWL := SEC_OID_ST.CURRVAL;
    PACK_ESTADISTICAS_BRAWL.INSERTAR('PRUEBA 2 - INSERTAR ESTADISTICA_BRAWL_STARS CON COPAS <= 0', 'Enero', 50, '21153329E', 48.75, 32.34, -3, FALSE);
    PACK_ESTADISTICAS_BRAWL.MODIFICAR('PRUEBA 3 - MODIFICAR ESTADISTICA_BRAWL_STARS', OID_ESTADISTICA_BRAWL, 'Mayo', 100, '21153329E', 69.96, 50.50, 8000, TRUE);
    PACK_ESTADISTICAS_BRAWL.MODIFICAR('PRUEBA 4 - CAMBIAR COPAS A UN NUMERO MENOR O IGUAL A 0', OID_ESTADISTICA_BRAWL, 'Mayo', 100, '21153329E', 69.96, 50.50, 0, FALSE);
    PACK_ESTADISTICAS_BRAWL.ELIMINAR('PRUEBA ELIMINAR ESTADISTICA_BRAWL_STARS', OID_ESTADISTICA_BRAWL, TRUE);
    DBMS_OUTPUT.put_line('');
END;
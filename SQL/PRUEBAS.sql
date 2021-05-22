SET SERVEROUTPUT ON;
--LAS PRUEBAS DE ELIMINAR ELEMENTOS SE REALIZAR�N AL FINAL
DECLARE
    OID_EQUIPO INTEGER;
    OID_ESTADISTICA INTEGER;
    OID_ESTADISTICA_FIFA INTEGER;
    OID_ESTADISTICA_FORTNITE INTEGER;
    OID_ESTADISTICA_BRAWL INTEGER;
    OID_PARTIDO_CSGO INTEGER;
    OID_PARTIDO_FORTNITE INTEGER;
    OID_PARTIDO_BRAWL INTEGER;
    OID_PARTIDO_LOL INTEGER;
    OID_PARTIDO_CLASH INTEGER;
    OID_PARTIDO_FIFA INTEGER;
    OID_SEGUIMIENTO_LIGAS INTEGER;
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
    DBMS_OUTPUT.put_line('');
    
----------------------------------    
--PRUEBAS DE LA TABLA PARTIDOSCSGO
----------------------------------
    Pack_Partidos_CSGO.Inicializar();
    Pack_Partidos_CSGO.Insertar('PRUEBA 1 - INSERCI�N DE PARTIDO_CSGO', 'Victoria', 'Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),  'Alex, Bea y Carlos', NULL, 'dust2', 8, 12, TRUE);
    Pack_Partidos_CSGO.Insertar('PRUEBA 2 - INSERCI�N DE PARTIDO_CSGO', 'Derrota', 'Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),  'Diego, Esteban y Fausto', NULL, 'nuke', 3, 4, TRUE);
    OID_PARTIDO_CSGO := SEC_OID_PT.CURRVAL;
    Pack_Partidos_CSGO.Insertar('PRUEBA 3 - INSERCI�N DE PARTIDO_CSGO CON FALLO: TIPO_PARTIDO NO VALIDO', 'Derrota', 'Partido erroneo', TO_DATE('2016-03-4','YYYY-MM-DD'),  'Diego, Esteban y Fausto', NULL, 'nuke', 3, 4, FALSE);
    Pack_Partidos_CSGO.Insertar('PRUEBA 4 - INSERCI�N DE PARTIDO_CSGO CON FALLO: PUNTUACION FUERA DEL RANGO(ENTRE 0 Y 16)', 'Derrota', 'Amistoso', TO_DATE('2016-03-4','YYYY-MM-DD'),  'Diego, Esteban y Fausto', NULL, 'nuke', 18, 4, FALSE);
    Pack_Partidos_CSGO.Modificar('PRUEBA 5 - MODIFICACI�N DE PARTIDO_CSGO', OID_PARTIDO_CSGO, 'Derrota', 'Liga', TO_DATE('2012-09-25','YYYY-MM-DD'), 'Diego, Esteban y Fausto', NULL, 'dust5', 9, 13, TRUE);
    Pack_Partidos_CSGO.Modificar('PRUEBA 6 - MODIFICACI�N DE PARTIDO_CSGO CON FALLO: TIPO_PARTIDO NO VALIDO',OID_PARTIDO_CSGO, 'Derrota', 'TIPOPARTIDO', TO_DATE('2012-09-25','YYYY-MM-DD'), 'Diego, Esteban y Fausto', NULL, 'dust5', 9, 13, FALSE);
    Pack_Partidos_CSGO.Modificar('PRUEBA 7 - MODIFICACI�N DE PARTIDO_CSGO CON FALLO: PUNTUACION FUERA DEL RANGO(ENTRE 0 Y 16)',OID_PARTIDO_CSGO, 'Derrota', 'Amistoso', TO_DATE('2012-09-25','YYYY-MM-DD'), 'Diego, Esteban y Fausto', NULL, 'dust5', -4, 13, FALSE);
    DBMS_OUTPUT.put_line('');

--------------------------------------
--PRUEBAS DE LA TABLA PARTIDOSFORTNITE
--------------------------------------
    PACK_PARTIDOS_FORTNITE.INICIALIZAR();
    Pack_Partidos_Fortnite.Insertar('PRUEBA 1 - INSERCI�N DE PARTIDO_FORTNITE', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                    'Alex, Bea y Carlos', NULL, 23, 'SQUAD', 1, 420, TRUE);
    Pack_Partidos_Fortnite.Insertar('PRUEBA 2 - INSERCI�N DE PARTIDO_FORTNITE', 'Derrota','Entrenamiento', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                    'Diego, Esteban y Fausto', NULL, 20, 'SQUAD', 7, 200, TRUE);
    OID_PARTIDO_FORTNITE := SEC_OID_PT.CURRVAL;
    Pack_Partidos_Fortnite.Insertar('PRUEBA 3 - INSERCI�N DE PARTIDO_FORTNITE CON FALLO: TIPO NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                    'Gonzalo, Helena e Irene', NULL, 23, 'Tipo erroneo', 1, 420, FALSE);
    Pack_Partidos_Fortnite.Insertar('PRUEBA 4 - INSERCI�N DE PARTIDO FORTNITE CON FALLO: POSICION NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                    'JKL', NULL, -80, 'SQUAD', 1, 100, FALSE);
    Pack_Partidos_Fortnite.Insertar('PRUEBA 5 - INSERCI�N DE PARTIDO_FORTNITE CON FALLO: BAJAS NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                    'MNO', NULL, 23, 'SQUAD', 9999, 420, FALSE);
    Pack_Partidos_Fortnite.Modificar('PRUEBA 6 - MODIFICACI�N', OID_PARTIDO_FORTNITE, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                    'Diego, Esteban y Fausto', NULL, 21, 'SQUAD', 1, 400, TRUE);
    DBMS_OUTPUT.put_line('');

----------------------------------------
--PRUEBAS DE LA TABLA PARTIDOSBRAWLSTARS
----------------------------------------
    PACK_PARTIDOS_BRAWL.INICIALIZAR();
    Pack_Partidos_Brawl.Insertar('PRUEBA 1 - INSERCI�N DE PARTIDO_BRAWL_STARS', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                'Alex, Bea y Carlos', NULL, 'Factory Rush', 'Asedio', 'Shelly, Nita, Colt vs Dynamite, Barley, Poco', '73:0', TRUE);
    Pack_Partidos_Brawl.Insertar('PRUEBA 2 - INSERCI�N DE PARTIDO_BRAWL_STARS', 'Derrota','Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),
                                'Diego, Esteban y Fausto', NULL, 'Double Swoosh', 'Atrapa Gemas', 'PAM, tick, colt vs leon, Barley, jessie', '11:2', TRUE);
    OID_PARTIDO_BRAWL := SEC_OID_PT.CURRVAL;
    Pack_Partidos_Brawl.Insertar('PRUEBA 3 - INSERCI�N DE PARTIDO_BRAWL_STARS CON FALLO: MODO NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                'Gonzalo, Helena e Irene', NULL, 'Factory Rush', 'Modo erroneo', 'Shelly, Nita, Bolt vs Dynamite, Barley, Poco', '10:3', FALSE);
    Pack_Partidos_Brawl.Modificar('PRUEBA 4 - MODIFICACI�N DE PARTIDO_BRAWL_STARS', OID_PARTIDO_BRAWL, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                'Diego, Esteban y Fausto', NULL, 'Factory Rush', 'Atrapa Gemas', 'Emz, Nita, Bull vs Rosa, Brock, Piper', '5:2', TRUE);
    DBMS_OUTPUT.put_line('');

---------------------------------
--PRUEBAS DE LA TABLA PARTIDOSLOL
---------------------------------
    PACK_PARTIDOS_LOL.INICIALIZAR();
    Pack_Partidos_LoL.Insertar('PRUEBA 1 - INSERCI�N DE PARTIDO_LOL', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                'Alex, Bea y Carlos', NULL, '34,23', 'Jax, Sejuani, Viktor, Tristana, Nami vs Darius, Kayn, LeBlanc, Jhin, Swain',
                                'Yasuo, Irelia, Master Yi, Fizz, Zed, Akali, Pyke, Riven, Mordekaiser, Zoe', 5,
                                'Jax: Trinity Force, Ninja Tabis, Steraks Gage, Titanic Hydra, Spirit Visage', TRUE);
    Pack_Partidos_LoL.Insertar('PRUEBA 2 - INSERCI�N DE PARTIDO_LOL', 'Derrota', 'Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),
                                'Diego, Esteban y Fausto', NULL, '21,12', 'Nautilus, Rengar, Kassadin, Garen, Yuumi vs Vladimir, Elise, Qiyana, Vayne, Thresh',
                                'Yasuo, Irelia, Master Yi, Fizz, Zed, Akali, Pyke, Riven, Mordekaiser, Zoe', 8,
                                'Rengar: Yhoumuus Ghostblade, Boots of Mobility, Duskblade of Draktharr, Ravenous Hydra', TRUE);
    OID_PARTIDO_LOL := SEC_OID_PT.CURRVAL;
    Pack_Partidos_LoL.Modificar('PRUEBA 3 - MODIFICACI�N DE PARTIDO_LOL', OID_PARTIDO_LOL, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                'Diego, Esteban y Fausto', NULL, '09,21', 'Maokai, Rengar, Kassadin, Garen, Yuumi vs Vladimir, Elise, Qiyana, Vayne, Thresh',
                                'Yasuo, Irelia, Master Yi, Fizz, Zed, Akali, Pyke, Riven, Mordekaiser, Zoe', 2,
                                'Rengar: Yhoumuus Ghostblade, Boots of Mobility, Duskblade of Draktharr, Ravenous Hydra', TRUE);
    DBMS_OUTPUT.put_line('');

-----------------------------------------
--PRUEBAS DE LA TABLA PARTIDOSCLASHROYALE
-----------------------------------------
    pack_partidos_clash_royale.inicializar();
    Pack_Partidos_Clash_Royale.Insertar('PRUEBA 1 - INSERCI�N DE PARTIDO_CLASH_ROYALE', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                        'Alex, Bea y Carlos', NULL, 5, 'Mago electrico', 'Lavaloon con esbirros', '1vs1', TRUE);
    Pack_Partidos_Clash_Royale.Insertar('PRUEBA 2 - INSERCI�N DE PARTIDO_CLASH_ROYALE', 'DERROTA','Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),
                                        'Diego, Esteban y Fausto', NULL, 7, 'Baby dragon y golem', 'MinerPoison 3.1 y Royal Giant lightning', '2vs2', TRUE);
    OID_PARTIDO_CLASH := SEC_OID_PT.CURRVAL;
    Pack_Partidos_Clash_Royale.Insertar('PRUEBA 3 - INSERCI�N ERRONEA DE PARTIDO_CLASH_ROYALE: MODO FUERA DEL RANGO DEL ENUMERATE', 'DERROTA','Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),
                                        'Diego, Esteban y Fausto', NULL, 7, 'Baby dragon y golem', 'MinerPoison 3.1 y Royal Giant lightning', 'MODO ERRONEO', FALSE);
    Pack_Partidos_Clash_Royale.Modificar('PRUEBA 3 - MODIFICACI�N DE PARTIDO_CLASH_ROYALE', OID_PARTIDO_CLASH, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                        'Diego, Esteban y Fausto', NULL, 13, 'Sabueso de lava', 'pekkaram con arquero magico', '1vs1', TRUE);
    DBMS_OUTPUT.put_line('');

----------------------------------
--PRUEBAS DE LA TABLA PARTIDOSFIFA
----------------------------------
    PACK_PARTIDOS_FIFA.INICIALIZAR();
    Pack_Partidos_Fifa.Insertar('PRUEBA 1 - INSERCI�N DE PARTIDO_FIFA', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                'Alex, Bea y Carlos', NULL, 'Betis vs Sevilla', 3, TRUE);
    Pack_Partidos_Fifa.Insertar('PRUEBA 2 - INSERCI�N DE PARTIDO_FIFA', 'DERROTA','Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),
                                'Diego, Esteban y Fausto', NULL, 'Real Madrid vs Rayo Vallecano', 6, TRUE);
    OID_PARTIDO_FIFA := SEC_OID_PT.CURRVAL;
    Pack_Partidos_Fifa.Insertar('PRUEBA 3 - INSERCI�N DE PARTIDO_FIFA CON FALLO: GOLES NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                'Alex, Bea y Carlos', NULL, 'Betis vs Sevilla', -3, FALSE);
    Pack_Partidos_Fifa.Modificar('PRUEBA 3 - MODIFICACI�N DE PARTIDO_FIFA', OID_PARTIDO_FIFA, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
                                'Diego, Esteban y Fausto', NULL,'Betis vs Barcelona', 9, TRUE);
    DBMS_OUTPUT.put_line('');

    /*
    PACK_EQUIPOS.ELIMINAR('PRUEBA ELIMINACI�N DE EQUIPO', OID_EQUIPO, TRUE);
    PACK_JUGADORES.ELIMINAR('PRUEBA ELIMINAR JUGADOR/EMPLEADO', '21153329E', TRUE);
    PACK_ESTADISTICAS.ELIMINAR('PRUEBA ELIMINAR ESTADISTICA', OID_ESTADISTICA, TRUE);
    PACK_ESTADISTICAS_FIFA.ELIMINAR('PRUEBA ELIMINAR ESTADISTICA_FIFA', OID_ESTADISTICA_FIFA, TRUE);
    PACK_ESTADISTICAS_FORTNITE.ELIMINAR('PRUEBA ELIMINAR ESTADISTICA_FORTNITE', OID_ESTADISTICA_FORTNITE, TRUE);
    Pack_Partidos_CSGO.Eliminar('PRUEBA - ELIMINACI�N PARTIDO_CSGO', OID_PARTIDO_CSGO, TRUE);
    Pack_Partidos_Fortnite.Eliminar('PRUEBA - ELIMINACI�N DE PARTIDO_FORTNITE', OID_PARTIDO_FORTNITE, TRUE);
    Pack_Partidos_Brawl.Eliminar('PRUEBA - ELIMINACI�N DE PARTIDO_BRAWL_STARS', OID_PARTIDO_BRAWL, TRUE);
    Pack_Partidos_LoL.Eliminar('PRUEBA - ELIMINACI�N DE PARTIDO_LOL', OID_PARTIDO_LOL, TRUE);
    Pack_Partidos_Clash_Royale.Eliminar('PRUEBA - ELIMINACI�N DE PARTIDO_CLASH_ROYALE', OID_PARTIDO_CLASH, TRUE);
    Pack_Partidos_Fifa.Eliminar('PRUEBA - ELIMINACI�N DE PARTIDO_FIFA', OID_PARTIDO_FIFA, TRUE);
    DBMS_OUTPUT.put_line('');
    */
END;
/
INSERT INTO LIGAS(NOMBRE, POSICION, IMPORTEPREMIO, FECHACOBROPREMIO) VALUES('LIGA DE PRUEBA', 4, 3000, NULL);
INSERT INTO EQUIPOSRIVALES(NOMBRE, JUGADORES, LOGO) VALUES('TEAM SOLO MID', 'TU, YO Y PEPE', 'Y');
INSERT INTO PARTICIPAEN(OID_ER, OID_LG) VALUES(SEC_OID_LG.CURRVAL, SEC_OID_ER.CURRVAL);
INSERT INTO PARTIDOS(RESULTADO, TIPOPARTIDO, VIDEOJUEGO, FECHA, JUGADORESSELECCIONADOS, OID_LG) VALUES (NULL,'Amistoso', 'LOL', TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'JUAN Y MANUEL', NULL);
INSERT INTO EQUIPOS(DNI, NOMBRE, CLASIFICACIONGLOBAL, CLASIFICACIONNACIONAL) VALUES(NULL, 'SQL', 1000, 500);
INSERT INTO JUEGA(OID_EQ, OID_PT) VALUES(SEC_OID_EQ.CURRVAL, SEC_OID_PT.CURRVAL);
INSERT INTO SEENFRENTAEN(OID_PT, OID_ER) VALUES(SEC_OID_PT.CURRVAL, SEC_OID_ER.CURRVAL);
INSERT INTO REDESSOCIALES(NOMBRE, FECHA, NUMEROSEGUIDORES, INTERACCIONES) VALUES('TW:@ZEROZONE', TO_DATE('2015-08-25', 'YYYY-MM-DD'), 10000, 278);
INSERT INTO REDESSOCIALES(NOMBRE, FECHA, NUMEROSEGUIDORES, INTERACCIONES) VALUES('IG:@ZEROZONE', TO_DATE('2015-08-25', 'YYYY-MM-DD'), 1000, 67);
INSERT INTO COMPITEEN(OID_EQ, OID_LG) VALUES(SEC_OID_EQ.CURRVAL, SEC_OID_LG.CURRVAL);

---------------------------------------
--PRUEBAS DE LOS REQUISITOS FUNCIONALES
---------------------------------------
DECLARE
OID_SEGUIMIENTO_LIGAS INTEGER;
BEGIN
    jugadores_por_videojuego('LOL');
    horas_por_jugador('21153329E', 'Abril');
    rivales_por_liga('LIGA DE PRUEBA');
    partidos_no_jugados('LOL');
    consulta_area_comunicacion(SYSDATE);
    rendimiento_fortnite('21153329E', 'Abril');
    OID_SEGUIMIENTO_LIGAS := SEC_OID_EQ.CURRVAL;
    seguimiento_ligas(OID_SEGUIMIENTO_LIGAS);
    DBMS_OUTPUT.put_line('');
END;
/
------------------------------------------------------
--INSERTS Y UPDATES PARA PROBAR LOS TRIGGERS(RN) RESTANTES
------------------------------------------------------

--PRUEBA TRIGGER 2
delete from ligas;
INSERT INTO LIGAS (NOMBRE, POSICION, IMPORTEPREMIO, FECHACOBROPREMIO) VALUES('ZeroZone',1,100,NULL);
UPDATE LIGAS SET FECHACOBROPREMIO = null WHERE nombre = 'ZeroZone';

--PRUEBA TRIGGER 3 EQUIPOS
delete from juega;
delete from seenfrentaen;
delete from partidos;
delete from equiposrivales;
delete from ligas;
delete from equipos;
delete from managers;
delete from empleados;
delete from equiposrivales;
INSERT INTO EMPLEADOS VALUES('31876579E', 'Candela', 18, 608498833,'Jugador', 'LOL', '05/09/2020', '13/09/2020','Y', 43,'FKDI@GMAIL.COM','ITWARD','@ITWARD','AV/REINA MERCEDES 58','M');
INSERT INTO MANAGERS VALUES('31876579E');
INSERT INTO EQUIPOS(dni,nombre, clasificacionGlobal, clasificacionNacional) VAlueS ('31876579E', 'equipo1', 4, 2);

INSERT INTO EMPLEADOS VALUES('31826579E', 'Candela', 18, 608492833,'Jugador', 'LOL', '05/09/2020', '13/09/2020','Y', 43,'FKDI@GMAIL.COM','ITWARD','@ITWARD','AV/REINA MERCEDES 58','M');
INSERT INTO MANAGERS VALUES('31826579E');
INSERT INTO EQUIPOS(dni,nombre, clasificacionGlobal, clasificacionNacional) VAlueS ('31826579E', 'equipo2', 4, 2);


INSERT INTO LIGAS (NOMBRE, POSICION, IMPORTEPREMIO, FECHACOBROPREMIO) VALUES('liga1',1,100,NULL);
INSERT INTO EQUIPOSRIVALES(NOMBRE,JUGADORES,LOGO) VALUES ('TeamQueso', 'Xiao,Itward,Tremor','Y');
INSERT INTO PARTIDOS (resultado, tipoPartido, videojuego, fecha,jugadoresseleccionados, OID_LG) 
    VALUES (null, 'Liga', 'LOL', TO_DATE('03-03-2019', 'DD-MM-YYYY'), 'todos' , sec_oid_lg.currval);
INSERT INTO JUEGA(oid_pt, oid_eq) values (sec_oid_pt.currval, sec_oid_eq.currval -1);
INSERT INTO JUEGA(oid_pt, oid_eq) values (sec_oid_pt.currval, sec_oid_eq.currval);

--PRUEBA TRIGGER 3 EQUIPOS RIVALES
delete from juega;
delete from seenfrentaen;
delete from partidos;
delete from equiposrivales;
delete from ligas;
delete from equipos;
delete from managers;
delete from empleados;
delete from equiposrivales;
INSERT INTO EMPLEADOS VALUES('31876579E', 'Candela', 18, 608498833,'Jugador', 'LOL', '05/09/2020', '13/09/2020','Y', 43,'FKDI@GMAIL.COM','ITWARD','@ITWARD','AV/REINA MERCEDES 58','M');
INSERT INTO MANAGERS VALUES('31876579E');
INSERT INTO EQUIPOS(dni,nombre, clasificacionGlobal, clasificacionNacional) VAlueS ('31876579E', 'equipo1', 4, 2);

INSERT INTO LIGAS (NOMBRE, POSICION, IMPORTEPREMIO, FECHACOBROPREMIO) VALUES('liga1',1,100,NULL);
INSERT INTO EQUIPOSRIVALES(NOMBRE,JUGADORES,LOGO) VALUES ('TeamQueso', 'Xiao,Itward,Tremor','Y');
INSERT INTO EQUIPOSRIVALES(NOMBRE,JUGADORES,LOGO) VALUES ('TeamWueso', 'Xiao,Itward,Tremor','Y');
INSERT INTO PARTIDOS (resultado, tipoPartido, videojuego, fecha,jugadoresseleccionados, OID_LG) 
    VALUES (null, 'Liga', 'LOL', TO_DATE('03-03-2019', 'DD-MM-YYYY'), 'todos' , sec_oid_lg.currval);
INSERT INTO SEENFRENTAEN (OID_PT, OID_ER) VALUES (SEC_OID_PT.CURRVAL, SEC_OID_ER.CURRVAL -1);
INSERT INTO SEENFRENTAEN (OID_PT, OID_ER) VALUES (SEC_OID_PT.CURRVAL, SEC_OID_ER.CURRVAL);

DELETE FROM REDESSOCIALES;
DELETE FROM PARTIDOS;


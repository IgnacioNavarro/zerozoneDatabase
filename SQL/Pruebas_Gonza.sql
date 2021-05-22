SET SERVEROUTPUT ON;

--Prueba Pack_Partidos_CSGO

BEGIN
Pack_Partidos_CSGO.Insertar('PRUEBA 1 - INSERCIÓN', 'Victoria', 'Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),  'Alex, Bea y Carlos', NULL, 'dust2', 8, 12, TRUE);
Pack_Partidos_CSGO.Insertar('PRUEBA 2 - INSERCIÓN', 'Derrota', 'Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),  'Diego, Esteban y Fausto', NULL, 'nuke', 3, 4, TRUE);
Pack_Partidos_CSGO.Insertar('PRUEBA 3 - INSERCIÓN CON FALLO: TIPO_PARTIDO NO VALIDO', 'Derrota', 'Partido erroneo', TO_DATE('2016-03-4','YYYY-MM-DD'),  'Diego, Esteban y Fausto', NULL, 'nuke', 3, 4, FALSE);
END;

DECLARE
oid_1 integer;
BEGIN
SELECT sec_oid_pt.CURRVAL INTO oid_1 FROM DUAL;
Pack_Partidos_CSGO.Modificar('PRUEBA 4 - MODIFICACIÓN', oid_1 - 1, 'Victoria', 'Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'), 'Diego, Esteban y Fausto', NULL, 'dust2', 9, 12, TRUE);
Pack_Partidos_CSGO.Eliminar('PRUEBA 5 - ELIMINACIÓN', oid_1, TRUE);
END;

BEGIN
Pack_Partidos_CSGO.Inicializar();
END;



--Prueba Pack_Partidos_Fortnite

BEGIN
Pack_Partidos_Fortnite.Insertar('PRUEBA 1 - INSERCIÓN', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Alex, Bea y Carlos', NULL, 23, 'SQUAD', 1, 420, TRUE);
Pack_Partidos_Fortnite.Insertar('PRUEBA 2 - INSERCIÓN', 'Derrota','Entrenamiento', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL, 20, 'SQUAD', 7, 200, TRUE);
Pack_Partidos_Fortnite.Insertar('PRUEBA 3 - INSERCIÓN CON FALLO: TIPO NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Gonzalo, Helena e Irene', NULL, 23, 'Tipo erroneo', 1, 420, FALSE);
Pack_Partidos_Fortnite.Insertar('PRUEBA 4 - INSERCIÓN CON FALLO: POSICION NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'JKL', NULL, -80, 'SQUAD', 1, 100, FALSE);
Pack_Partidos_Fortnite.Insertar('PRUEBA 5 - INSERCIÓN CON FALLO: BAJAS NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'MNO', NULL, 23, 'SQUAD', 9999, 420, FALSE);
END;

DECLARE
oid_1 integer;
BEGIN
SELECT sec_oid_pt.CURRVAL INTO oid_1 FROM DUAL;
Pack_Partidos_Fortnite.Modificar('PRUEBA 6 - MODIFICACIÓN', oid_1 - 1, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL, 21, 'SQUAD', 1, 400, TRUE);
Pack_Partidos_Fortnite.Eliminar('PRUEBA 7 - ELIMINACIÓN', oid_1, TRUE);
END;

BEGIN
Pack_Partidos_Fortnite.Inicializar();
END;


--Prueba Pack_Partidos_Brawl

BEGIN
Pack_Partidos_Brawl.Insertar('PRUEBA 1 - INSERCIÓN', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Alex, Bea y Carlos', NULL, 'Factory Rush', 'Asedio', 'Shelly, Nita, Colt vs Dynamite, Barley, Poco', '73:0', TRUE);
Pack_Partidos_Brawl.Insertar('PRUEBA 2 - INSERCIÓN', 'Derrota','Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL, 'Double Swoosh', 'Atrapa Gemas', 'PAM, tick, colt vs leon, Barley, jessie', '11:2', TRUE);
Pack_Partidos_Brawl.Insertar('PRUEBA 3 - INSERCIÓN CON FALLO: MODO NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Gonzalo, Helena e Irene', NULL, 'Factory Rush', 'Modo erroneo', 'Shelly, Nita, Bolt vs Dynamite, Barley, Poco', '10:3', FALSE);
END;

DECLARE
oid_1 integer;
BEGIN
SELECT sec_oid_pt.CURRVAL INTO oid_1 FROM DUAL;
Pack_Partidos_Brawl.Modificar('PRUEBA 4 - MODIFICACIÓN', oid_1-1, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL, 'Factory Rush', 'Atrapa Gemas', 'Emz, Nita, Bull vs Rosa, Brock, Piper', '5:2', TRUE);
Pack_Partidos_Brawl.Eliminar('PRUEBA 5 - ELIMINACIÓN', oid_1, TRUE);
END;

BEGIN
Pack_Partidos_Brawl.Inicializar();
END;

--Prueba Pack_Partidos_LoL (tiene problemas con el kda)

BEGIN
Pack_Partidos_LoL.Insertar('PRUEBA 1 - INSERCIÓN', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Alex, Bea y Carlos', NULL, '34,23', 'Jax, Sejuani, Viktor, Tristana, Nami vs Darius, Kayn, LeBlanc, Jhin, Swain',
'Yasuo, Irelia, Master Yi, Fizz, Zed, Akali, Pyke, Riven, Mordekaiser, Zoe', 5,
'Jax: Trinity Force, Ninja Tabis, Steraks Gage, Titanic Hydra, Spirit Visage', TRUE);
Pack_Partidos_LoL.Insertar('PRUEBA 2 - INSERCIÓN', 'Derrota', 'Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL, '21,12', 'Nautilus, Rengar, Kassadin, Garen, Yuumi vs Vladimir, Elise, Qiyana, Vayne, Thresh',
'Yasuo, Irelia, Master Yi, Fizz, Zed, Akali, Pyke, Riven, Mordekaiser, Zoe', 8,
'Rengar: Yhoumuus Ghostblade, Boots of Mobility, Duskblade of Draktharr, Ravenous Hydra', TRUE);
END;

DECLARE
oid_1 integer;
BEGIN
SELECT sec_oid_pt.CURRVAL INTO oid_1 FROM DUAL;
Pack_Partidos_LoL.Modificar('PRUEBA 3 - MODIFICACIÓN', oid_1-1, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL, '09,21', 'Maokai, Rengar, Kassadin, Garen, Yuumi vs Vladimir, Elise, Qiyana, Vayne, Thresh',
'Yasuo, Irelia, Master Yi, Fizz, Zed, Akali, Pyke, Riven, Mordekaiser, Zoe', 2,
'Rengar: Yhoumuus Ghostblade, Boots of Mobility, Duskblade of Draktharr, Ravenous Hydra', TRUE);
Pack_Partidos_LoL.Eliminar('PRUEBA 4 - ELIMINACIÓN', oid_1, TRUE);
END;

BEGIN
Pack_Partidos_LoL.Inicializar();
END;

--Prueba Pack_Partidos_Clash_Royale

BEGIN
Pack_Partidos_Clash_Royale.Insertar('PRUEBA 1 - INSERCIÓN', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Alex, Bea y Carlos', NULL, 5, 'Mago electrico', 'Lavaloon con esbirros', '1vs1', TRUE);
Pack_Partidos_Clash_Royale.Insertar('PRUEBA 2 - INSERCIÓN', 'DERROTA','Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL, 7, 'Baby dragon y golem', 'MinerPoison 3.1 y Royal Giant lightning', '2vs2', TRUE);
END;

DECLARE
oid_1 integer;
BEGIN
SELECT sec_oid_pt.CURRVAL INTO oid_1 FROM DUAL;
Pack_Partidos_Clash_Royale.Modificar('PRUEBA 3 - MODIFICACIÓN', oid_1-1, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL, 13, 'Sabueso de lava', 'pekkaram con arquero magico', '1vs1', TRUE);
Pack_Partidos_Clash_Royale.Eliminar('PRUEBA 4 - ELIMINACIÓN', oid_1, TRUE);
END;

BEGIN
Pack_Partidos_Clash_Royale.Inicializar();
END;

--Prueba Pack_Partidos_Fifa
BEGIN
Pack_Partidos_Fifa.Insertar('PRUEBA 1 - INSERCIÓN', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Alex, Bea y Carlos', NULL, 'Betis vs Sevilla', 3, TRUE);
Pack_Partidos_Fifa.Insertar('PRUEBA 2 - INSERCIÓN', 'DERROTA','Entrenamiento', TO_DATE('2012-09-25','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL, 'Real Madrid vs Rayo Vallecano', 6, TRUE);
Pack_Partidos_Fifa.Insertar('PRUEBA 3 - INSERCIÓN CON FALLO: GOLES NO VALIDO', 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Alex, Bea y Carlos', NULL, 'Betis vs Sevilla', -3, FALSE);
END;

DECLARE
oid_1 integer;
BEGIN
SELECT sec_oid_pt.CURRVAL INTO oid_1 FROM DUAL;
Pack_Partidos_Fifa.Modificar('PRUEBA 3 - MODIFICACIÓN', oid_1-1, 'Victoria','Amistoso', TO_DATE('2012-09-24','YYYY-MM-DD'),
'Diego, Esteban y Fausto', NULL,'Betis vs Barcelona', 9, TRUE);
Pack_Partidos_Fifa.Eliminar('PRUEBA 4 - ELIMINACIÓN', oid_1, TRUE);
END;

BEGIN
Pack_Partidos_Fifa.Inicializar();
END;

--Pruebas requisitos funcionales
DECLARE
w_oid integer;
BEGIN
jugadores_por_videojuego('Clash Royale');
horas_por_jugador('12345678A', 'ABRIL');
rivales_por_liga('Superliga Orange');
partidos_no_jugados('LoL');
partidos_no_jugados('Fortnite');
consulta_area_comunicacion(TO_DATE('2015-05-25','YYYY-MM-DD'));
ranking_jugadores('Brawl Stars', TO_DATE('2000-01-01','YYYY-MM-DD'), TO_DATE('2020-12-30','YYYY-MM-DD'));
/* Esto va comentado porque sin datos los cursores petan :)
rendimiento_lol('12345678A', 'ENERO');
rendimiento_fortnite('12345678A', 'FEBRERO');
rendimiento_clash('12345678A', 'MARZO');
rendimiento_csgo('12345678A', 'MAYO');
rendimiento_fifa('12345678A', 'JUNIO');
rendimiento_brawl('12345678A', 'SEPTIEMBRE');
*/
SELECT sec_oid_eq.NEXTVAL INTO w_oid FROM DUAL;
seguimiento_ligas(w_oid - 1);
END;

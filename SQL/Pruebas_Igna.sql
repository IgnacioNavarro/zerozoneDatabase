-----------------
--INSERTS PARA PROBAR TRIGGERS
----------------

SET SERVEROUTPUT ON;


--PRUEBA TRIGGEER 2
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
    VALUES (null, 'Liga', 'LOL', TO_DATE('03-03-2020', 'DD-MM-YYYY'), 'todos' , sec_oid_lg.currval);
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
    VALUES (null, 'Liga', 'LOL', TO_DATE('03-03-2020', 'DD-MM-YYYY'), 'todos' , sec_oid_lg.currval);
    INSERT INTO SEENFRENTAEN (OID_PT, OID_ER) VALUES (SEC_OID_PT.CURRVAL, SEC_OID_ER.CURRVAL -1);
    INSERT INTO SEENFRENTAEN (OID_PT, OID_ER) VALUES (SEC_OID_PT.CURRVAL, SEC_OID_ER.CURRVAL);



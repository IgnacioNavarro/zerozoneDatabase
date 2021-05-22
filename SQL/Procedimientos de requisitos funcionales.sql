--RF_01
CREATE OR REPLACE PROCEDURE jugadores_por_videojuego
(w_videojuego IN empleados.seccion%TYPE)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Jugadores de ' || w_videojuego);
    
    FOR registro IN (SELECT DISTINCT * FROM empleados NATURAL JOIN jugadores
        WHERE seccion = w_videojuego AND dni IN (SELECT dni FROM jugadores))
    LOOP
        DBMS_OUTPUT.PUT_LINE( registro.dni || ', ' || registro.nombre || ', ' || registro.nick);
    END LOOP;
    
END jugadores_por_videojuego;
/
--RF_02
CREATE OR REPLACE PROCEDURE horas_por_jugador
(w_dni IN jugadores.dni%TYPE,
w_mes IN estadisticas.mes%TYPE)
IS
    w_horasTrabajadas   estadisticas.horasTrabajadas%TYPE;
BEGIN
    SELECT SUM(horasTrabajadas)INTO w_horasTrabajadas FROM empleados NATURAL JOIN jugadores NATURAL JOIN estadisticas
        WHERE dni = w_dni AND mes = w_mes;
    DBMS_OUTPUT.PUT_LINE( 'El jugador con DNI ' || w_dni || ' trabajó un total de ' || w_horasTrabajadas || ' horas.');
END horas_por_jugador;
/
--RF_03
CREATE OR REPLACE PROCEDURE rivales_por_liga
(w_liga IN ligas.nombre%TYPE)
IS
w_rival equiposRivales.nombre%TYPE;
w_jugadores equiposRivales.jugadores%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Rivales en la liga ' || w_liga);
    FOR registro IN (SELECT * FROM ligas NATURAL JOIN participaEn WHERE nombre = w_liga)
    LOOP
        SELECT nombre, jugadores INTO w_rival, w_jugadores FROM participaEn NATURAL JOIN equiposRivales WHERE oid_pe = registro.oid_pe;
        DBMS_OUTPUT.PUT_LINE( w_rival || ', ' || w_jugadores);
    END LOOP;
    
END rivales_por_liga;
/
--RF_04
CREATE OR REPLACE PROCEDURE partidos_no_jugados_fortnite
IS
BEGIN
        DBMS_OUTPUT.PUT_LINE('Partidos programados de la sección de Fortnite');
        FOR registro IN (SELECT nombre, fecha, tipoPartido FROM equipos NATURAL JOIN juega NATURAL JOIN partidos
            WHERE videojuego = 'Fortnite' AND fecha > (SELECT SYSDATE FROM DUAL))
        LOOP
            DBMS_OUTPUT.PUT_LINE( registro.nombre || 'compite el día ' || registro.fecha || ' en un partido de tipo ' || registro.tipoPartido);
        END LOOP;
END partidos_no_jugados_fortnite;
/
CREATE OR REPLACE PROCEDURE partidos_no_jugados_general
(w_videojuego IN partidos.videojuego%TYPE)
IS
w_equipo equipos.nombre%TYPE;
w_rival equiposRivales.nombre%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Partidos programados de la sección de ' || w_videojuego);
    FOR registro IN (SELECT * FROM partidos WHERE videojuego = w_videojuego AND fecha > (SELECT SYSDATE FROM DUAL))
    LOOP
        SELECT nombre INTO w_equipo FROM equipos NATURAL JOIN juega NATURAL JOIN partidos WHERE oid_pt = registro.oid_pt;
        SELECT nombre INTO w_rival FROM equiposRivales NATURAL JOIN seEnfrentaEn NATURAL JOIN partidos WHERE oid_pt = registro.oid_pt;
        DBMS_OUTPUT.PUT_LINE( w_equipo|| ' vs ' || w_rival || ' el día ' || registro.fecha || ' en un partido de tipo ' || registro.tipoPartido);
    END LOOP;
END partidos_no_jugados_general;
/
CREATE OR REPLACE PROCEDURE partidos_no_jugados
(w_videojuego IN partidos.videojuego%TYPE)
IS
BEGIN
    IF (w_videojuego = 'Fortnite') THEN partidos_no_jugados_fortnite;
        ELSE partidos_no_jugados_general(w_videojuego);
    END IF;
END partidos_no_jugados;
/
--RF_05
CREATE OR REPLACE PROCEDURE consulta_area_comunicacion
(w_fecha IN redesSociales.fecha%TYPE)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Datos de las redes sociales en ' || w_fecha);
    FOR registro IN (SELECT nombre, numeroSeguidores, interacciones FROM redesSociales WHERE fecha < w_fecha)
    LOOP
        DBMS_OUTPUT.PUT_LINE( 'La red social ' || registro.nombre || ' cuenta con ' || registro.numeroSeguidores
            || ' seguidores y ' || registro.interacciones || ' interacciones.');
    END LOOP;
END consulta_area_comunicacion;
/
--RF_06
CREATE OR REPLACE PROCEDURE ranking_jugadores
(w_videojuego IN partidos.videojuego%TYPE,
fechaInicio IN partidos.fecha%TYPE,
fechaFin in partidos.fecha%TYPE)
IS
CURSOR c IS SELECT nick, COUNT(*) FROM empleados NATURAL JOIN jugadores NATURAL JOIN equipos NATURAL JOIN juega NATURAL JOIN partidos
        WHERE videojuego = w_videojuego AND resultado = 'Y' AND fecha BETWEEN fechaInicio AND fechaFin GROUP BY nick ORDER BY 2;
w_nick              empleados.nick%TYPE;
w_victorias         INTEGER;
w_puesto            INTEGER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Ranking de jugadores del juego ' || w_videojuego);
    w_puesto := 1;
    OPEN c;
    LOOP
        FETCH c INTO w_nick, w_victorias;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(w_puesto || '. ' || w_nick || ', con '
            || w_victorias || ' victorias.');
        w_puesto := 1 + w_puesto;
    END LOOP;
    CLOSE c;
END ranking_jugadores;
/
--RF_07
CREATE OR REPLACE PROCEDURE rendimiento_lol
(w_dni IN jugadores.dni%TYPE,
w_mes IN estadisticas.mes%TYPE)
IS
w_winRate       estadisticasLoL.winRatePorCampeon%TYPE;
w_nick          empleados.nick%TYPE;
BEGIN
    SELECT winRatePorCampeon, nick INTO w_winRate, w_nick FROM empleados NATURAL JOIN jugadores NATURAL JOIN estadisticas NATURAL JOIN estadisticasLoL
        WHERE dni = w_dni AND mes = w_mes;
    DBMS_OUTPUT.PUT_LINE('El winrate del jugador ' || w_nick || ' es de ' || w_winRate || '%');
END rendimiento_lol;
/
CREATE OR REPLACE PROCEDURE rendimiento_fortnite
(w_dni IN jugadores.dni%TYPE,
w_mes IN estadisticas.mes%TYPE)
IS
w_kda       estadisticasFortnite.kda%TYPE;
w_nick      empleados.nick%TYPE;
BEGIN
    SELECT kda, nick INTO w_kda, w_nick FROM empleados NATURAL JOIN jugadores NATURAL JOIN estadisticas NATURAL JOIN estadisticasFortnite
        WHERE dni = w_dni AND mes = w_mes;
    DBMS_OUTPUT.PUT_LINE('El KDA del jugador ' || w_nick || ' es de ' || w_kda);
END rendimiento_fortnite;
/
CREATE OR REPLACE PROCEDURE rendimiento_clash
(w_dni IN jugadores.dni%TYPE,
w_mes IN estadisticas.mes%TYPE)
IS
w_winRate        estadisticasClashRoyale.winRateGlobal%TYPE;
w_nick             empleados.nick%TYPE;
BEGIN
    SELECT winRateGlobal, nick INTO w_winRate, w_nick FROM empleados NATURAL JOIN jugadores NATURAL JOIN estadisticas NATURAL JOIN estadisticasClashRoyale
        WHERE dni = w_dni AND mes = w_mes;
    DBMS_OUTPUT.PUT_LINE('El winrate del jugador ' || w_nick || ' es de ' || w_winRate || '%');
END rendimiento_clash;
/
CREATE OR REPLACE PROCEDURE rendimiento_csgo
(w_dni IN jugadores.dni%TYPE,
w_mes IN estadisticas.mes%TYPE)
IS
w_winRate        estadisticasCSGO.winRate%TYPE;
w_nick      empleados.nick%TYPE;
BEGIN
    SELECT winRate, nick INTO w_winRate, w_nick FROM empleados NATURAL JOIN jugadores NATURAL JOIN estadisticas NATURAL JOIN estadisticasCSGO
        WHERE dni = w_dni AND mes = w_mes;
    DBMS_OUTPUT.PUT_LINE('El winrate del jugador ' || w_nick || ' es de ' || w_winRate || '%');
END rendimiento_csgo;
/
CREATE OR REPLACE PROCEDURE rendimiento_fifa
(w_dni IN jugadores.dni%TYPE,
w_mes IN estadisticas.mes%TYPE)
IS
w_winRate        estadisticasCSGO.winRate%TYPE;
w_nick      empleados.nick%TYPE;
BEGIN
    SELECT winRate, nick INTO w_winRate, w_nick FROM empleados NATURAL JOIN jugadores NATURAL JOIN estadisticas NATURAL JOIN estadisticasFifa
        WHERE dni = w_dni AND mes = w_mes;
    DBMS_OUTPUT.PUT_LINE('El winrate del jugador ' || w_nick || ' es de ' || w_winRate || '%');
END rendimiento_fifa;
/
CREATE OR REPLACE PROCEDURE rendimiento_brawl
(w_dni IN jugadores.dni%TYPE,
w_mes IN estadisticas.mes%TYPE)
IS
w_winRate       estadisticasBrawlStars.winRateGlobal%TYPE;
w_nick          empleados.nick%TYPE;
BEGIN
    SELECT winRateGlobal, nick INTO w_winRate, w_nick FROM empleados NATURAL JOIN jugadores NATURAL JOIN estadisticas NATURAL JOIN estadisticasBrawlStars
        WHERE dni = w_dni AND mes = w_mes;
    DBMS_OUTPUT.PUT_LINE('El winrate del jugador ' || w_nick || ' es de ' || w_winRate || '%');
END rendimiento_brawl;
/
--RF_08
CREATE OR REPLACE PROCEDURE seguimiento_ligas
(w_oid_eq IN equipos.oid_eq%TYPE)
IS
BEGIN
    FOR registro IN (SELECT * FROM compiteEn NATURAL JOIN ligas WHERE oid_eq = w_oid_eq)
    LOOP
        DBMS_OUTPUT.PUT_LINE(registro.nombre || ', Posición: ' || registro.posicion || ', Premio: ' || registro.importePremio);
    END LOOP;
END seguimiento_ligas;


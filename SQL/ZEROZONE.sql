DROP TABLE SEPUBLICAEN;
DROP TABLE PUBLICACIONES;
DROP TABLE EVENTOS;
DROP TABLE REDESSOCIALES;

DROP TABLE ENTRENA;
DROP TABLE COMPITEEN;
DROP TABLE ANALIZA;
DROP TABLE PARTICIPAEN;
DROP TABLE JUEGA;
DROP TABLE SEENFRENTAEN;

DROP TABLE PARTIDOSCSGO;
DROP TABLE PARTIDOSFORTNITE;
DROP TABLE PARTIDOSBRAWL;
DROP TABLE PARTIDOSLOL;
DROP TABLE PARTIDOSCLASHROYALE;
DROP TABLE PARTIDOSFIFA;

DROP TABLE PARTIDOS;
DROP TABLE EQUIPOSRIVALES;
DROP TABLE LIGAS;

DROP TABLE ESTADISTICASFIFA;
DROP TABLE ESTADISTICASBRAWLSTARS;
DROP TABLE ESTADISTICASCLASHROYALE;
DROP TABLE ESTADISTICASLOL;
DROP TABLE ESTADISTICASCSGO;
DROP TABLE ESTADISTICASFORTNITE;

DROP TABLE DISEÑADORES;
DROP TABLE MANAGERS CASCADE CONSTRAINT;
DROP TABLE COACHS;
DROP TABLE ANALISTAS;
DROP TABLE JUGADORES;
DROP TABLE DIRECTIVOS;
DROP TABLE COMMUNITY_MANAGERS;
DROP TABLE EQUIPOS;
DROP TABLE ESTADISTICAS CASCADE CONSTRAINT;
DROP TABLE EMPLEADOS CASCADE CONSTRAINT;




/*sólo está creada, sin condición ninguna etc etc)*/
CREATE TABLE EMPLEADOS
(dni char(9) PRIMARY KEY not null,
nombre varchar2 (50)NOT NULL,
edad integer NOT NULL,
telefono integer UNIQUE,
tipoEmpleado varchar2(50),
seccion varchar2(50),
fechaInicioContrato date,
fechaFinContrato date,
experienciaPrevia CHAR(1),
horasMensuales integer,
correo varchar2(50),
nick varchar2(50) NOT NULL,
redesSociales varchar2(50),
direccion varchar2(100),
tallaCamiseta varchar2(2),
    CONSTRAINT "empleado_chk" CHECK (tipoEmpleado IN('Jugador', 'Manager', 'Coach' , 'Analista', 'Directiva' , 'Diseñador', 'Community Manager')),
        CONSTRAINT "seccion_chk" CHECK (seccion IN('Clash Royale', 'Brawl Stars', 'FIFA' , 'LOL', 'CSGO' , 'FORTNITE')),
        CONSTRAINT "bool_chk"  CHECK(experienciaPrevia IN ('Y','N')),
        CONSTRAINT "talla_chk" CHECK(tallaCamiseta IN ('XS','S', 'M', 'L', 'XL')),
        CONSTRAINT "fechacontrato_chk" CHECK (fechaInicioContrato < fechaFinContrato)
);


CREATE TABLE COMMUNITY_MANAGERS(
dni char(9) PRIMARY KEY NOT NULL,
FOREIGN KEY (dni) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE
);

CREATE TABLE DISEÑADORES(
dni char(9) PRIMARY KEY NOT NULL,
FOREIGN KEY (dni) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE
);

CREATE TABLE MANAGERS(
dni char(9) PRIMARY KEY NOT NULL,
FOREIGN KEY (dni) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE
);

CREATE TABLE COACHS(
dni char(9) PRIMARY KEY NOT NULL,
FOREIGN KEY (dni) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE
);

CREATE TABLE ANALISTAS(
dni char(9) PRIMARY KEY NOT NULL,
FOREIGN KEY (dni) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE
);

CREATE TABLE DIRECTIVOS(
dni char(9) PRIMARY KEY NOT NULL,
FOREIGN KEY (dni) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE
);
/*equipos es de la pagina dos pero jugadores lo necesita*/
CREATE TABLE EQUIPOS(
OID_EQ integer PRIMARY KEY,
dni char(9),
nombre varchar2(50) NOT NULL,
clasificacionGlobal integer,
clasificacionNacional integer,
FOREIGN KEY (dni) REFERENCES MANAGERS(dni)
);

CREATE TABLE JUGADORES(
dni char(9) PRIMARY KEY NOT NULL,
posicionesPrincipales varchar2(50),
nombreTutor varchar2(50) default  null,
dniTutor char(9) default null,
telefonoTutor integer default null,
correoTutor varchar2(50) default null,
OID_EQ integer,
FOREIGN KEY (dni) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE, 
FOREIGN KEY (OID_EQ) REFERENCES EQUIPOS(OID_EQ) ON DELETE SET NULL
);


CREATE TABLE ESTADISTICAS(
OID_ST integer PRIMARY KEY,
dni char(9) NOT NULL,
mes date,
horasTrabajadas integer,
FOREIGN KEY (dni) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE

);

CREATE TABLE ESTADISTICASFIFA(
OID_ST PRIMARY KEY,
winRate number(4,2),
golesPorPartido number(4,2),

FOREIGN KEY (OID_ST) REFERENCES ESTADISTICAS(OID_ST) ON DELETE CASCADE,
CONSTRAINT "goles_chk" CHECK (golesPorPartido >= 0)
);

CREATE TABLE ESTADISTICASBRAWLSTARS(
OID_ST PRIMARY KEY,
winRatePorBrawler number(4,2),
winRateGlobal number(4,2),
copas integer,

FOREIGN KEY (OID_ST) REFERENCES ESTADISTICAS(OID_ST) ON DELETE CASCADE,
CONSTRAINT "copas_chk" CHECK (copas > 0)
);

CREATE TABLE ESTADISTICASLOL(
OID_ST PRIMARY KEY,
winRatePorCampeon number(4,2),
KDAPorCampeon number(4,2),

FOREIGN KEY (OID_ST) REFERENCES ESTADISTICAS(OID_ST) ON DELETE CASCADE
);

CREATE TABLE ESTADISTICASCSGO(
OID_ST PRIMARY KEY,
winRate number(4,2),
KDA number(4,2),

FOREIGN KEY (OID_ST) REFERENCES ESTADISTICAS(OID_ST) ON DELETE CASCADE
);

CREATE TABLE ESTADISTICASFORTNITE(
OID_ST PRIMARY KEY,
horasStreaming integer,
KDA number(4,2),

FOREIGN KEY (OID_ST) REFERENCES ESTADISTICAS(OID_ST) ON DELETE CASCADE,
CONSTRAINT "horasfort_chk" CHECK(horasStreaming > 5)
);

CREATE TABLE ESTADISTICASCLASHROYALE(
OID_ST PRIMARY KEY,
winRateGlobal number(4,2),
partidasPorMazo number(4,2),
winRatePorMazo number(4,2),
hechizos integer,

FOREIGN KEY (OID_ST) REFERENCES ESTADISTICAS(OID_ST) ON DELETE CASCADE
);



/*pagina 2*/
/*EQUIPOS VA ENCIMA DE JUGADORES*/

CREATE TABLE ENTRENA(
OID_ENT integer PRIMARY KEY,
dni char(9),
OID_EQ integer,
FOREIGN KEY (dni) REFERENCES COACHS(dni) ON DELETE CASCADE,
FOREIGN KEY (OID_EQ) REFERENCES EQUIPOS(OID_EQ) ON DELETE CASCADE
);


CREATE TABLE ANALIZA(
OID_ANZ integer PRIMARY KEY,
dni char(9),
OID_EQ integer,

FOREIGN KEY (dni) REFERENCES ANALISTAS(dni) ON DELETE CASCADE,
FOREIGN KEY (OID_EQ) REFERENCES EQUIPOS(OID_EQ) ON DELETE CASCADE
);

CREATE TABLE LIGAS(
OID_LG integer PRIMARY KEY,
nombre varchar2(50) NOT NULL,
posicion integer default null,
importePremio integer,
fechaCobroPremio date default null
);


CREATE TABLE COMPITEEN(
OID_CE integer PRIMARY KEY,
OID_EQ integer,
OID_LG integer,
FOREIGN KEY (OID_LG) REFERENCES LIGAS(OID_LG) ON DELETE CASCADE,
FOREIGN KEY (OID_EQ) REFERENCES EQUIPOS(OID_EQ) ON DELETE CASCADE
);

CREATE TABLE EQUIPOSRIVALES(
OID_ER integer PRIMARY KEY,
nombre varchar2(50),
jugadores varchar2(50),
logo char(1),

CONSTRAINT "bool_chk2"  CHECK(logo IN ('Y','N'))
);

CREATE TABLE PARTICIPAEN(
OID_PE integer PRIMARY KEY,
OID_ER integer,
OID_LG integer,
FOREIGN KEY (OID_LG) REFERENCES LIGAS(OID_LG) ON DELETE CASCADE,
FOREIGN KEY (OID_ER) REFERENCES EQUIPOSRIVALES(OID_ER) ON DELETE CASCADE
);

CREATE TABLE PARTIDOS(
OID_PT integer PRIMARY KEY,
resultado varchar2(50),
tipoPartido varchar2(50),
videojuego varchar2(50),
fecha date,
jugadoresSeleccionados varchar2(50),
OID_LG integer,
FOREIGN KEY (OID_LG) REFERENCES LIGAS(OID_LG) ON DELETE SET NULL,

CONSTRAINT "videojuego_chk"  CHECK(videojuego IN ('Brawl Stars','Clash Royale', 'Fortnite', 'CSGO', 'LOL', 'Fifa')),
CONSTRAINT "tipoPartido_chk"  CHECK(tipoPartido IN ('Amistoso','Liga', 'Entrenamiento'))
);

CREATE TABLE JUEGA(
OID_JG integer PRIMARY KEY,
OID_EQ integer,
OID_PT integer,
FOREIGN KEY (OID_PT) REFERENCES PARTIDOS (OID_PT) ON DELETE CASCADE,
FOREIGN KEY (OID_EQ) REFERENCES EQUIPOS(OID_EQ)ON DELETE CASCADE
);

CREATE TABLE SEENFRENTAEN(
OID_SEF integer PRIMARY KEY,
OID_PT integer,
OID_ER integer,
FOREIGN KEY (OID_PT) REFERENCES PARTIDOS (OID_PT) ON DELETE CASCADE,
FOREIGN KEY (OID_ER) REFERENCES EQUIPOSRIVALES(OID_ER) ON DELETE CASCADE
);

CREATE TABLE PARTIDOSCSGO(
OID_PT integer PRIMARY KEY,
mapa varchar2(50),
puntuacion integer,
comprasPorRonda integer,

FOREIGN KEY (OID_PT) REFERENCES PARTIDOS(OID_PT) ON DELETE CASCADE,
CONSTRAINT "puntuacion_chk"  CHECK(puntuacion >= 0 and puntuacion <= 16)
);

CREATE TABLE PARTIDOSFORTNITE(
OID_PT integer PRIMARY KEY,
bajas integer,
tipo varchar2(50),
posicion integer,
puntos integer,

FOREIGN KEY (OID_PT) REFERENCES PARTIDOS(OID_PT) ON DELETE CASCADE,
CONSTRAINT "bajas_chk1"  CHECK(bajas >= 0),
CONSTRAINT "posicion_chk1"  CHECK(posicion >= 0 and posicion <= 100),
CONSTRAINT "tipo_chk1"  CHECK(tipo IN ('SOLO', 'DUO', 'SQUAD'))
);

CREATE TABLE PARTIDOSBRAWL(
OID_PT integer PRIMARY KEY,
mapa varchar2(50),
modo varchar2(50),
brawlers varchar2(50),
puntuacion varchar2(50),

FOREIGN KEY (OID_PT) REFERENCES PARTIDOS(OID_PT) ON DELETE CASCADE,
CONSTRAINT "modo_chk"  CHECK(modo IN('Atrapa Gemas', 'Atraco', 'Caza Estelar' , 'Balon Brawl', 'Asedio'))
);



CREATE TABLE PARTIDOSLOL(
OID_PT integer PRIMARY KEY,
kda number(4,2),
campeones varchar2(200),
baneos varchar2(200),
objetivos integer,
builds varchar2(2000),


FOREIGN KEY (OID_PT) REFERENCES PARTIDOS(OID_PT) ON DELETE CASCADE
);

CREATE TABLE PARTIDOSCLASHROYALE(
OID_PT integer PRIMARY KEY,
puntuacion integer,
baneos varchar2(50),
mazos varchar2(200),
modo varchar2(50),

FOREIGN KEY (OID_PT) REFERENCES PARTIDOS(OID_PT) ON DELETE CASCADE,
CONSTRAINT "modo_chk2"  CHECK(modo IN('1vs1', '2vs2'))
);

CREATE TABLE PARTIDOSFIFA(
OID_PT integer PRIMARY KEY,
equiposFutbol varchar2(50),
goles integer,

FOREIGN KEY (OID_PT) REFERENCES PARTIDOS(OID_PT) ON DELETE CASCADE,
CONSTRAINT "goles_chk2"  CHECK(goles >= 0)
);



/*pagina 3*/

CREATE TABLE REDESSOCIALES(
OID_RRSS integer PRIMARY KEY,
nombre varchar2(50) NOT NULL,
fecha date,
numeroSeguidores integer,
interacciones integer
);

CREATE TABLE EVENTOS(
OID_EV integer PRIMARY KEY,
OID_ER integer,
nombre varchar2(150) NOT NULL,
tipoEvento varchar2(50) NOT NULL,
fecha date,

FOREIGN KEY (OID_ER) REFERENCES EQUIPOSRIVALES(OID_ER),
CONSTRAINT "tipoEvento_chk"  CHECK(tipoEvento IN ('Partido previsto', 'Informativa', 'Presentacion' , 'Jugada'))
);

CREATE TABLE PUBLICACIONES(
OID_PB integer PRIMARY KEY,
OID_EV integer,
fecha date,
disenoListo char(1),

FOREIGN KEY (OID_EV) REFERENCES EVENTOS (OID_EV),
CONSTRAINT "Diseno_chk"  CHECK(disenoListo IN ('Y', 'N'))
);

CREATE TABLE SEPUBLICAEN(
OID_SPE integer PRIMARY KEY,
OID_PB integer REFERENCES PUBLICACIONES (OID_PB) ON DELETE CASCADE,
OID_RRSS integer REFERENCES REDESSOCIALES (OID_RRSS) ON DELETE CASCADE
);

--SECUENCIAS AUTOGENERADORAS DE OID'S
DROP SEQUENCE sec_oid_eq;
DROP SEQUENCE sec_oid_st;
DROP SEQUENCE sec_oid_ent;
DROP SEQUENCE sec_oid_anz;
DROP SEQUENCE sec_oid_lg;
DROP SEQUENCE sec_oid_ce;
DROP SEQUENCE sec_oid_er;
DROP SEQUENCE sec_oid_pe;
DROP SEQUENCE sec_oid_pt;
DROP SEQUENCE sec_oid_jg;
DROP SEQUENCE sec_oid_sef;
DROP SEQUENCE sec_oid_rrss;
DROP SEQUENCE sec_oid_pb;
DROP SEQUENCE sec_oid_spe;
DROP SEQUENCE sec_oid_ev;

CREATE SEQUENCE sec_oid_eq
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_st
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_ent
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_anz
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_lg
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_ce
    INCREMENT BY 1
    START WITH 1;

CREATE SEQUENCE sec_oid_er
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_pe
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_pt
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_jg
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_sef
    INCREMENT BY 1
    START WITH 1;

CREATE SEQUENCE sec_oid_rrss
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_pb
    INCREMENT BY 1
    START WITH 1;


CREATE SEQUENCE sec_oid_spe
    INCREMENT BY 1
    START WITH 1;
    
CREATE SEQUENCE sec_oid_ev
    INCREMENT BY 1
    START WITH 1;
    
--TRIGGERS PARA AÑADIR AUTOMATICAMENTE LOS OID GENERADOS POR LAS SECUENCIAS
CREATE OR REPLACE TRIGGER trigger_oid_eq
BEFORE INSERT ON equipos
FOR EACH ROW
BEGIN
    SELECT sec_oid_eq.nextval INTO :NEW.oid_eq FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_st
BEFORE INSERT ON estadisticas
FOR EACH ROW
BEGIN
    SELECT sec_oid_st.nextval INTO :NEW.oid_st FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_st_brawl
BEFORE INSERT ON estadisticasbrawlstars
FOR EACH ROW
BEGIN
    SELECT sec_oid_st.currval INTO :NEW.oid_st FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_st_clash
BEFORE INSERT ON estadisticasclashroyale
FOR EACH ROW
BEGIN
    SELECT sec_oid_st.currval INTO :NEW.oid_st FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_st_csgo
BEFORE INSERT ON estadisticascsgo
FOR EACH ROW
BEGIN
    SELECT sec_oid_st.currval INTO :NEW.oid_st FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_st_fifa
BEFORE INSERT ON estadisticasfifa
FOR EACH ROW
BEGIN
    SELECT sec_oid_st.currval INTO :NEW.oid_st FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_st_fortnite
BEFORE INSERT ON estadisticasfortnite
FOR EACH ROW
BEGIN
    SELECT sec_oid_st.currval INTO :NEW.oid_st FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_st_lol
BEFORE INSERT ON estadisticaslol
FOR EACH ROW
BEGIN
    SELECT sec_oid_st.currval INTO :NEW.oid_st FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_ent
BEFORE INSERT ON entrena
FOR EACH ROW
BEGIN
    SELECT sec_oid_ent.nextval INTO :NEW.oid_ent FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_anz
BEFORE INSERT ON analiza
FOR EACH ROW
BEGIN
    SELECT sec_oid_anz.nextval INTO :NEW.oid_anz FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_lg
BEFORE INSERT ON ligas
FOR EACH ROW
BEGIN
    SELECT sec_oid_lg.nextval INTO :NEW.oid_lg FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_ce
BEFORE INSERT ON compiteen
FOR EACH ROW
BEGIN
    SELECT sec_oid_ce.nextval INTO :NEW.oid_ce FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_er
BEFORE INSERT ON equiposrivales
FOR EACH ROW
BEGIN
    SELECT sec_oid_er.nextval INTO :NEW.oid_er FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_pe
BEFORE INSERT ON participaen
FOR EACH ROW
BEGIN
    SELECT sec_oid_pe.nextval INTO :NEW.oid_pe FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_pt
BEFORE INSERT ON partidos
FOR EACH ROW
BEGIN
    SELECT sec_oid_pt.nextval INTO :NEW.oid_pt FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_pt_csgo
BEFORE INSERT ON partidoscsgo
FOR EACH ROW
BEGIN
    SELECT sec_oid_pt.currval INTO :NEW.oid_pt FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_pt_fortnite
BEFORE INSERT ON partidosfortnite
FOR EACH ROW
BEGIN
    SELECT sec_oid_pt.currval INTO :NEW.oid_pt FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_pt_brawl
BEFORE INSERT ON partidosbrawl
FOR EACH ROW
BEGIN
    SELECT sec_oid_pt.currval INTO :NEW.oid_pt FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_pt_lol
BEFORE INSERT ON partidoslol
FOR EACH ROW
BEGIN
    SELECT sec_oid_pt.currval INTO :NEW.oid_pt FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_pt_clash
BEFORE INSERT ON partidosclashroyale
FOR EACH ROW
BEGIN
    SELECT sec_oid_pt.currval INTO :NEW.oid_pt FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_pt_fifa
BEFORE INSERT ON partidosfifa
FOR EACH ROW
BEGIN
    SELECT sec_oid_pt.currval INTO :NEW.oid_pt FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_jg
BEFORE INSERT ON juega
FOR EACH ROW
BEGIN
    SELECT sec_oid_jg.nextval INTO :NEW.oid_jg FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_sef
BEFORE INSERT ON seenfrentaen
FOR EACH ROW
BEGIN
    SELECT sec_oid_sef.nextval INTO :NEW.oid_sef FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_rrss
BEFORE INSERT ON redessociales
FOR EACH ROW
BEGIN
    SELECT sec_oid_rrss.nextval INTO :NEW.oid_rrss FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_pb
BEFORE INSERT ON publicaciones
FOR EACH ROW
BEGIN
    SELECT sec_oid_pb.nextval INTO :NEW.oid_pb FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_spe
BEFORE INSERT ON sepublicaen
FOR EACH ROW
BEGIN
    SELECT sec_oid_spe.nextval INTO :NEW.oid_spe FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER trigger_oid_ev
BEFORE INSERT ON eventos
FOR EACH ROW
BEGIN
    SELECT sec_oid_ev.nextval INTO :NEW.oid_ev FROM DUAL; 
END;
/

--RN_01
CREATE OR REPLACE TRIGGER HORAS_EMPLEADOS
BEFORE INSERT OR UPDATE ON ESTADISTICAS
FOR EACH ROW
DECLARE
W_DNI VARCHAR2(9);
BEGIN
SELECT DNI INTO W_DNI FROM EMPLEADOS WHERE DNI = :NEW.DNI;
IF :NEW.HORASTRABAJADAS <40 AND :NEW.DNI = W_DNI
    THEN raise_application_error(-20600, ' Cada empleado debe trabajar más de 40 horas. Ha trabajado: ' || :NEW.HORASTRABAJADAS);
    ELSE
     DBMS_OUTPUT.put_line ('El empleado ha cumplido las horas mínimas, ha trabajado: '|| :NEW.HORASTRABAJADAS || ' horas');
END IF;
END;
/
--RN_02
CREATE OR REPLACE TRIGGER COBRO_PREMIO
BEFORE UPDATE ON LIGAS
FOR EACH ROW
BEGIN
IF :NEW.FECHACOBROPREMIO is NULL
    THEN raise_application_error(-20603, ' No se puede modificar los datos de las ligas hasta que se cobre el premio.');
END IF;
END;
/
--RN_03 
CREATE OR REPLACE TRIGGER EQUIPOS_FORTNITE
BEFORE INSERT ON SEENFRENTAEN
FOR EACH ROW
DECLARE
CONTADOR INTEGER;
CONTADOR2 INTEGER;
SUMA INTEGER;
BEGIN

SELECT COUNT(OID_ER) INTO CONTADOR FROM SEENFRENTAEN NATURAL JOIN PARTIDOS WHERE VIDEOJUEGO='FORTNITE';
SELECT COUNT(OID_EQ) INTO CONTADOR2 FROM JUEGA NATURAL JOIN PARTIDOS WHERE VIDEOJUEGO='FORTNITE';
SUMA := CONTADOR+CONTADOR2;
IF SUMA>=99
THEN raise_application_error(-20611, :NEW.OID_ER || ' No pueden jugar más de 100 equipos de Fortnite un partido.');   
END IF;
END;
/
CREATE OR REPLACE TRIGGER EQUIPOS_FORTNITE2
BEFORE INSERT ON JUEGA
FOR EACH ROW
DECLARE
CONTADOR INTEGER;
CONTADOR2 INTEGER;
SUMA INTEGER;
BEGIN

SELECT COUNT(OID_ER) INTO CONTADOR FROM SEENFRENTAEN NATURAL JOIN PARTIDOS WHERE VIDEOJUEGO='FORTNITE';
SELECT COUNT(OID_EQ) INTO CONTADOR2 FROM JUEGA NATURAL JOIN PARTIDOS WHERE VIDEOJUEGO='FORTNITE';
SUMA := CONTADOR+CONTADOR2;
IF SUMA>=99
THEN raise_application_error(-20601, :NEW.OID_EQ || ' No pueden jugar más de 100 equipos de Fortnite un partido.');   
END IF;
END;
/
CREATE OR REPLACE TRIGGER EQUIPOS
BEFORE INSERT ON JUEGA
FOR EACH ROW
DECLARE
cont INTEGER;
BEGIN
SELECT COUNT(*) INTO cont FROM juega NATURAL JOIN PARTIDOS WHERE VIDEOJUEGO !='Fortnite' AND OID_PT = :NEW.OID_PT;
DBMS_OUTPUT.put_line('Trigger: ' || cont);
IF cont>=1
THEN raise_application_error(-20622, ' No pueden jugar 2 o más equipos enemigos en un partido.');   
END IF;
END;
/
CREATE OR REPLACE TRIGGER EQUIPOS_RIVALES
BEFORE INSERT ON SEENFRENTAEN
FOR EACH ROW
DECLARE
cont INTEGER;
BEGIN
SELECT COUNT(*) INTO cont FROM seEnfrentaEn NATURAL JOIN PARTIDOS WHERE VIDEOJUEGO !='FORTNITE' AND OID_PT = :NEW.OID_PT;
IF cont>=1
THEN raise_application_error(-20602, :NEW.OID_ER || ' No pueden jugar 2 o más equipos aliados en un partido.');   
END IF;
END;
/
--RN_04
CREATE OR REPLACE TRIGGER EMPLEADOS_DATOSGUARDADOS
BEFORE INSERT ON EMPLEADOS
FOR EACH ROW
DECLARE
WDNI CHAR(9);
BEGIN
DELETE FROM EMPLEADOS WHERE DNI = :NEW.DNI;
END;
/

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
        WHERE videojuego = w_videojuego AND resultado = 'Victoria' AND fecha BETWEEN fechaInicio AND fechaFin GROUP BY nick ORDER BY 2;
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
/

--CREACIÓN DE LOS PAQUETES DE PRUEBA (CABECERAS)
CREATE OR REPLACE PACKAGE Pack_Jugadores
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_dni IN empleados.dni%TYPE, w_nombre IN empleados.nombre%TYPE,
w_edad IN empleados.edad%TYPE, w_telefono IN empleados.telefono%TYPE,
w_seccion IN empleados.seccion%TYPE, w_fechaInicioContrato IN empleados.fechaInicioContrato%TYPE,
w_fechaFinContrato IN empleados.fechaFinContrato%TYPE, w_experienciaPrevia IN empleados.experienciaPrevia%TYPE,
w_horasMensuales IN empleados.horasMensuales%TYPE, w_correo IN empleados.correo%TYPE, w_nick IN empleados.nick%TYPE,
w_redesSociales IN empleados.redesSociales%TYPE, w_direccion IN empleados.direccion%TYPE,
w_tallaCamiseta IN empleados.tallaCamiseta%TYPE,
w_posicionesPrincipales IN jugadores.posicionesPrincipales%TYPE, w_nombreTutor IN jugadores.nombreTutor%TYPE,
w_dniTutor IN jugadores.dniTutor%TYPE, w_telefonoTutor IN jugadores.telefonoTutor%TYPE,
w_correoTutor IN jugadores.correoTutor%TYPE, w_oid_eq IN equipos.oid_eq%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_dni IN empleados.dni%TYPE, w_nombre IN empleados.nombre%TYPE,
w_edad IN empleados.edad%TYPE, w_telefono IN empleados.telefono%TYPE,
w_seccion IN empleados.seccion%TYPE, w_fechaInicioContrato IN empleados.fechaInicioContrato%TYPE,
w_fechaFinContrato IN empleados.fechaFinContrato%TYPE, w_experienciaPrevia IN empleados.experienciaPrevia%TYPE,
w_horasMensuales IN empleados.horasMensuales%TYPE, w_correo IN empleados.correo%TYPE, w_nick IN empleados.nick%TYPE,
w_redesSociales IN empleados.redesSociales%TYPE, w_direccion IN empleados.direccion%TYPE,
w_tallaCamiseta IN empleados.tallaCamiseta%TYPE,
w_posicionesPrincipales IN jugadores.posicionesPrincipales%TYPE, w_nombreTutor IN jugadores.nombreTutor%TYPE,
w_dniTutor IN jugadores.dniTutor%TYPE, w_telefonoTutor IN jugadores.telefonoTutor%TYPE,
w_correoTutor IN jugadores.correoTutor%TYPE, w_oid_eq IN equipos.oid_eq%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_dni IN empleados.dni%TYPE,salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Estadisticas
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_mes IN estadisticas.mes%TYPE,
w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE, w_dni IN empleados.dni%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, w_mes IN estadisticas.mes%TYPE,
w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE, w_dni IN empleados.dni%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Estadisticas_Fifa
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_mes IN estadisticas.mes%TYPE,
w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE, w_dni IN empleados.dni%TYPE, w_winRate IN estadisticasFifa.winRate%TYPE,
w_golesPorPartido IN estadisticasFifa.golesPorPartido%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, w_mes IN estadisticas.mes%TYPE,
w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE, w_dni IN empleados.dni%TYPE, w_winRate IN estadisticasFifa.winRate%TYPE,
w_golesPorPartido IN estadisticasFifa.golesPorPartido%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Estadisticas_Fortnite
IS

PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_mes IN estadisticas.mes%TYPE,
w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE, w_dni IN empleados.dni%TYPE,
w_horasStreaming IN estadisticasFortnite.horasStreaming%TYPE, w_kda IN estadisticasFortnite.kda%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, w_mes IN estadisticas.mes%TYPE,
w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE, w_dni IN empleados.dni%TYPE,
w_horasStreaming IN estadisticasFortnite.horasStreaming%TYPE, w_kda IN estadisticasFortnite.kda%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Estadisticas_Brawl
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_mes IN estadisticas.mes%TYPE,
w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE, w_dni IN empleados.dni%TYPE,
w_winRateGlobal IN estadisticasBrawlStars.winRateGlobal%TYPE, w_winRatePorBrawler IN estadisticasBrawlStars.winRatePorBrawler%TYPE,
w_copas IN estadisticasBrawlStars.copas%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, w_mes IN estadisticas.mes%TYPE,
w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE, w_dni IN empleados.dni%TYPE,
w_winRateGlobal IN estadisticasBrawlStars.winRateGlobal%TYPE, w_winRatePorBrawler IN estadisticasBrawlStars.winRatePorBrawler%TYPE,
w_copas IN estadisticasBrawlStars.copas%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Equipos
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_nombre IN equipos.nombre%TYPE,
w_clasificacionGlobal IN equipos.clasificacionGlobal%TYPE, w_clasificacionNacional IN equipos.clasificacionNacional%TYPE,
w_dni IN managers.dni%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_eq IN equipos.oid_eq%TYPE, w_nombre IN equipos.nombre%TYPE,
w_clasificacionGlobal IN equipos.clasificacionGlobal%TYPE, w_clasificacionNacional IN equipos.clasificacionNacional%TYPE,
w_dni IN managers.dni%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_eq IN equipos.oid_eq%TYPE,salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Partidos_CSGO
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_mapa IN partidosCSGO.mapa%TYPE, w_puntuacion IN partidosCSGO.puntuacion%TYPE,
w_comprasPorRonda IN partidosCSGO.comprasPorRonda%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_mapa IN partidosCSGO.mapa%TYPE, w_puntuacion IN partidosCSGO.puntuacion%TYPE,
w_comprasPorRonda IN partidosCSGO.comprasPorRonda%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Partidos_Fortnite
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_bajas IN partidosFortnite.bajas%TYPE, w_tipo IN partidosFortnite.tipo%TYPE, w_posicion IN partidosFortnite.posicion%TYPE,
w_puntos IN partidosFortnite.puntos%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_bajas IN partidosFortnite.bajas%TYPE, w_tipo IN partidosFortnite.tipo%TYPE, w_posicion IN partidosFortnite.posicion%TYPE,
w_puntos IN partidosFortnite.puntos%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Partidos_Brawl
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_mapa IN partidosBrawl.mapa%TYPE, w_modo IN partidosBrawl.modo%TYPE, w_brawlers IN partidosBrawl.brawlers%TYPE,
w_puntuacion IN partidosBrawl.puntuacion%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_mapa IN partidosBrawl.mapa%TYPE, w_modo IN partidosBrawl.modo%TYPE, w_brawlers IN partidosBrawl.brawlers%TYPE,
w_puntuacion IN partidosBrawl.puntuacion%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Partidos_LoL
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_kda IN partidosLoL.kda%TYPE, w_campeones IN partidosLoL.campeones%TYPE,w_baneos IN partidosLoL.baneos%TYPE,
w_objetivos IN partidosLoL.objetivos%TYPE,w_builds IN partidosLoL.builds%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_kda IN partidosLoL.kda%TYPE, w_campeones IN partidosLoL.campeones%TYPE,w_baneos IN partidosLoL.baneos%TYPE,
w_objetivos IN partidosLoL.objetivos%TYPE,w_builds IN partidosLoL.builds%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Partidos_Clash_Royale
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_puntuacion IN partidosClashRoyale.puntuacion%TYPE, w_baneos IN partidosClashRoyale.baneos%TYPE,
w_mazos IN partidosClashRoyale.mazos%TYPE, w_modo IN partidosClashRoyale.modo%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_puntuacion IN partidosClashRoyale.puntuacion%TYPE, w_baneos IN partidosClashRoyale.baneos%TYPE,
w_mazos IN partidosClashRoyale.mazos%TYPE, w_modo IN partidosClashRoyale.modo%TYPE,salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN);
END;
/
CREATE OR REPLACE PACKAGE Pack_Partidos_Fifa
IS
PROCEDURE Inicializar;

PROCEDURE Insertar(nombrePrueba VARCHAR2, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_equiposFutbol IN partidosFifa.equiposFutbol%TYPE, w_goles IN partidosFifa.goles%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Modificar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE, w_resultado IN partidos.resultado%TYPE,
w_tipoPartido IN partidos.tipoPartido%TYPE, w_fecha IN partidos.fecha%TYPE,
w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE, w_oid_lg IN ligas.oid_lg%TYPE,
w_equiposFutbol IN partidosFifa.equiposFutbol%TYPE, w_goles IN partidosFifa.goles%TYPE, salidaEsperada BOOLEAN);

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN);
END;
/

--CUERPOS DE LOS PAQUETES DE PRUEBAS
CREATE OR REPLACE FUNCTION resultado(salida BOOLEAN, salidaEsperada BOOLEAN)
RETURN VARCHAR2 AS
    BEGIN
        IF (salida = salidaEsperada) THEN
            RETURN 'Éxito';
        ELSE
            RETURN 'Fracaso';
        END IF;
    END resultado;
/

CREATE OR REPLACE PACKAGE BODY PACK_JUGADORES
IS 
    PROCEDURE INICIALIZAR IS
        BEGIN
            DELETE FROM EMPLEADOS WHERE TIPOEMPLEADO = 'Jugador';
        END INICIALIZAR;

    PROCEDURE INSERTAR(nombrePrueba VARCHAR2,
                        w_dni IN empleados.dni%TYPE,
                        w_nombre IN empleados.nombre%TYPE,
                        w_edad IN empleados.edad%TYPE,
                        w_telefono IN empleados.telefono%TYPE,
                        w_seccion IN empleados.seccion%TYPE,
                        w_fechaInicioContrato IN empleados.fechaInicioContrato%TYPE,
                        w_fechaFinContrato IN empleados.fechaFinContrato%TYPE,
                        w_experienciaPrevia IN empleados.experienciaPrevia%TYPE,
                        w_horasMensuales IN empleados.horasMensuales%TYPE,
                        w_correo IN empleados.correo%TYPE,
                        w_nick IN empleados.nick%TYPE,
                        w_redesSociales IN empleados.redesSociales%TYPE,
                        w_direccion IN empleados.direccion%TYPE,
                        w_tallaCamiseta IN empleados.tallaCamiseta%TYPE,
                        w_posicionesPrincipales IN jugadores.posicionesPrincipales%TYPE,
                        w_nombreTutor IN jugadores.nombreTutor%TYPE,
                        w_dniTutor IN jugadores.dniTutor%TYPE,
                        w_telefonoTutor IN jugadores.telefonoTutor%TYPE,
                        w_correoTutor IN jugadores.correoTutor%TYPE,
                        w_oid_eq IN equipos.oid_eq%TYPE,
                        salidaEsperada BOOLEAN) 
        IS
            W_SALIDA BOOLEAN := TRUE;
            W_JUGADOR JUGADORES%ROWTYPE;
        BEGIN
            INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato,
                                    fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales,
                                    direccion, tallaCamiseta)
            VALUES (w_dni, w_nombre, w_edad, w_telefono, 'Jugador', w_seccion, w_fechaInicioContrato,
                    w_fechaFinContrato, w_experienciaPrevia, w_horasMensuales, w_correo, w_nick, w_redesSociales,
                    w_direccion, w_tallaCamiseta);
        
            INSERT INTO JUGADORES (DNI, POSICIONESPRINCIPALES, NOMBRETUTOR,
                                    DNITUTOR, TELEFONOTUTOR, CORREOTUTOR, OID_EQ)
            VALUES (W_DNI, W_POSICIONESPRINCIPALES, W_NOMBRETUTOR, W_DNITUTOR,
                    W_TELEFONOTUTOR, W_CORREOTUTOR, W_OID_EQ);
            
            SELECT * INTO W_JUGADOR FROM JUGADORES WHERE W_DNI = DNI;
            IF (W_JUGADOR.POSICIONESPRINCIPALES != W_POSICIONESPRINCIPALES OR 
                W_JUGADOR.NOMBRETUTOR != W_NOMBRETUTOR OR W_JUGADOR.DNITUTOR != W_DNITUTOR OR
                W_JUGADOR.TELEFONOTUTOR != W_TELEFONOTUTOR OR W_JUGADOR.CORREOTUTOR != W_CORREOTUTOR OR
                W_JUGADOR.OID_EQ != W_OID_EQ) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END insertar;

    PROCEDURE MODIFICAR(nombrePrueba VARCHAR2,
                        w_dni IN empleados.dni%TYPE,
                        w_nombre IN empleados.nombre%TYPE,
                        w_edad IN empleados.edad%TYPE,
                        w_telefono IN empleados.telefono%TYPE,
                        w_seccion IN empleados.seccion%TYPE,
                        w_fechaInicioContrato IN empleados.fechaInicioContrato%TYPE,
                        w_fechaFinContrato IN empleados.fechaFinContrato%TYPE,
                        w_experienciaPrevia IN empleados.experienciaPrevia%TYPE,
                        w_horasMensuales IN empleados.horasMensuales%TYPE,
                        w_correo IN empleados.correo%TYPE,
                        w_nick IN empleados.nick%TYPE,
                        w_redesSociales IN empleados.redesSociales%TYPE,
                        w_direccion IN empleados.direccion%TYPE,
                        w_tallaCamiseta IN empleados.tallaCamiseta%TYPE,
                        w_posicionesPrincipales IN jugadores.posicionesPrincipales%TYPE,
                        w_nombreTutor IN jugadores.nombreTutor%TYPE,
                        w_dniTutor IN jugadores.dniTutor%TYPE,
                        w_telefonoTutor IN jugadores.telefonoTutor%TYPE,
                        w_correoTutor IN jugadores.correoTutor%TYPE,
                        w_oid_eq IN equipos.oid_eq%TYPE,
                        salidaEsperada BOOLEAN) 
        IS
            w_salida BOOLEAN := TRUE;
            W_JUGADOR JUGADORES%ROWTYPE;
        BEGIN
        UPDATE empleados SET nombre = w_nombre, edad = w_edad, telefono = w_telefono,
            seccion = w_seccion, fechaInicioContrato = w_fechaInicioContrato,
            fechaFinContrato = w_fechaFinContrato, experienciaPrevia = w_experienciaPrevia,
            horasMensuales = w_horasMensuales, correo = w_correo, nick = w_nick, redesSociales = w_redesSociales,
            direccion = w_direccion, tallaCamiseta = w_tallaCamiseta WHERE dni = w_dni;
        
        UPDATE JUGADORES SET POSICIONESPRINCIPALES = W_POSICIONESPRINCIPALES, NOMBRETUTOR = W_NOMBRETUTOR,
                            DNITUTOR = W_DNITUTOR, TELEFONOTUTOR = W_TELEFONOTUTOR, CORREOTUTOR = W_CORREOTUTOR,
                            OID_EQ = W_OID_EQ WHERE dni = w_dni;
    
        SELECT * INTO W_JUGADOR FROM JUGADORES WHERE w_dni = dni;
            IF (W_JUGADOR.POSICIONESPRINCIPALES != W_POSICIONESPRINCIPALES OR 
                W_JUGADOR.NOMBRETUTOR != W_NOMBRETUTOR OR W_JUGADOR.DNITUTOR != W_DNITUTOR OR
                W_JUGADOR.TELEFONOTUTOR != W_TELEFONOTUTOR OR W_JUGADOR.CORREOTUTOR != W_CORREOTUTOR OR
                W_JUGADOR.OID_EQ != W_OID_EQ) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
            DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END modificar;
    
    PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_dni IN EMPLEADOS.dni%TYPE, salidaEsperada BOOLEAN)
        IS
            W_SALIDA BOOLEAN := true;
            n INTEGER;
        BEGIN
    
        DELETE FROM EMPLEADOS WHERE dni = w_dni;
    
        SELECT COUNT (*) INTO n FROM JUGADORES WHERE dni = w_dni;
        IF(n != 0) THEN
            W_SALIDA := false;
        END IF;
        COMMIT WORK;
    
        DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END ELIMINAR;
    
END;
/

CREATE OR REPLACE PACKAGE BODY PACK_ESTADISTICAS
IS
    PROCEDURE INICIALIZAR IS

        BEGIN
            DELETE FROM ESTADISTICASBRAWLSTARS;
            DELETE FROM ESTADISTICASCLASHROYALE;
            DELETE FROM ESTADISTICASCSGO;
            DELETE FROM ESTADISTICASFIFA;
            DELETE FROM ESTADISTICASFORTNITE;
            DELETE FROM ESTADISTICASLOL;
            DELETE FROM ESTADISTICAS;
        END INICIALIZAR;

    PROCEDURE insertar (nombrePrueba VARCHAR2,
                        w_mes IN estadisticas.mes%TYPE,
                        w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE,
                        w_dni IN empleados.dni%TYPE,
                        salidaEsperada BOOLEAN)
        IS
            w_salida BOOLEAN := TRUE;
            W_ESTADISTICA ESTADISTICAS%ROWTYPE;
            W_OID_ST INTEGER;
        BEGIN              
            INSERT INTO ESTADISTICAS (DNI, MES, HORASTRABAJADAS) 
            VALUES (W_DNI, W_MES, W_HORASTRABAJADAS);
            
            W_OID_ST := SEC_OID_ST.CURRVAL;
            SELECT * INTO W_ESTADISTICA FROM ESTADISTICAS WHERE W_OID_ST = OID_ST;
            IF (W_ESTADISTICA.MES != W_MES OR W_ESTADISTICA.HORASTRABAJADAS != W_HORASTRABAJADAS OR
                W_ESTADISTICA.DNI != W_DNI) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
            DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END insertar;

    PROCEDURE MODIFICAR(nombrePrueba VARCHAR2,
                        w_oid_st IN estadisticas.oid_st%TYPE,
                        w_mes IN estadisticas.mes%TYPE,
                        w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE,
                        w_dni IN empleados.dni%TYPE,
                        salidaEsperada BOOLEAN) 
        IS
            w_salida BOOLEAN := TRUE;
            W_ESTADISTICA ESTADISTICAS%ROWTYPE;
        BEGIN
    
        UPDATE ESTADISTICAS SET MES = W_MES, HORASTRABAJADAS = W_HORASTRABAJADAS, DNI = W_DNI
        WHERE OID_ST = W_OID_ST;
    
        SELECT * INTO W_ESTADISTICA FROM ESTADISTICAS WHERE W_OID_ST = OID_ST;
            IF (W_ESTADISTICA.MES != W_MES OR W_ESTADISTICA.HORASTRABAJADAS != W_HORASTRABAJADAS OR
                W_ESTADISTICA.DNI != W_DNI) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
            DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END modificar;
    
    PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, salidaEsperada BOOLEAN)
        IS
            W_SALIDA BOOLEAN := true;
            n INTEGER;
        BEGIN
    
        DELETE FROM ESTADISTICAS WHERE OID_ST = W_OID_ST;
    
        SELECT COUNT (*) INTO n FROM ESTADISTICAS WHERE OID_ST = W_OID_ST;
        IF(n != 0) THEN
            W_SALIDA := false;
        END IF;
        COMMIT WORK;
    
        DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END ELIMINAR;
    
END;
/

CREATE OR REPLACE PACKAGE BODY PACK_ESTADISTICAS_FIFA
IS 
    PROCEDURE INICIALIZAR IS
        BEGIN
            FOR REGISTRO IN (SELECT * FROM ESTADISTICASFIFA) LOOP
                DELETE FROM ESTADISTICAS WHERE OID_ST = REGISTRO.OID_ST;
            END LOOP;
            DELETE ESTADISTICASFIFA;
        END INICIALIZAR;

    PROCEDURE INSERTAR(nombrePrueba VARCHAR2,
                        w_mes IN estadisticas.mes%TYPE,
                        w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE,
                        w_dni IN empleados.dni%TYPE,
                        w_winRate IN estadisticasFifa.winRate%TYPE,
                        w_golesPorPartido IN estadisticasFifa.golesPorPartido%TYPE,
                        salidaEsperada BOOLEAN) 
        IS
            W_SALIDA BOOLEAN := TRUE;
            W_ESTADISTICAFIFA ESTADISTICASFIFA%ROWTYPE;
            W_OID_ST INTEGER;
        BEGIN
            INSERT INTO ESTADISTICAS (DNI, MES, HORASTRABAJADAS) 
            VALUES (W_DNI, W_MES, W_HORASTRABAJADAS);
            
            INSERT INTO ESTADISTICASFIFA (WINRATE, GOLESPORPARTIDO)
            VALUES (W_WINRATE, W_GOLESPORPARTIDO);
            
            W_OID_ST := SEC_OID_ST.CURRVAL;
            SELECT * INTO W_ESTADISTICAFIFA FROM ESTADISTICASFIFA WHERE OID_ST = W_OID_ST;
            IF (W_ESTADISTICAFIFA.WINRATE != W_WINRATE OR
                W_ESTADISTICAFIFA.GOLESPORPARTIDO != W_GOLESPORPARTIDO) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END insertar;

    PROCEDURE MODIFICAR(nombrePrueba VARCHAR2,
                        w_oid_st IN estadisticas.oid_st%TYPE,
                        w_mes IN estadisticas.mes%TYPE,
                        w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE
                        , w_dni IN empleados.dni%TYPE,
                        w_winRate IN estadisticasFifa.winRate%TYPE,
                        w_golesPorPartido IN estadisticasFifa.golesPorPartido%TYPE,
                        salidaEsperada BOOLEAN) 
        IS
            w_salida BOOLEAN := TRUE;
            W_ESTADISTICAFIFA ESTADISTICASFIFA%ROWTYPE;
        BEGIN
        UPDATE ESTADISTICAS SET MES = W_MES, HORASTRABAJADAS = W_HORASTRABAJADAS, DNI = W_DNI
        WHERE OID_ST = W_OID_ST;
        
        UPDATE ESTADISTICASFIFA SET WINRATE = W_WINRATE, GOLESPORPARTIDO = W_GOLESPORPARTIDO
        WHERE OID_ST = W_OID_ST;
    
        SELECT * INTO W_ESTADISTICAFIFA FROM ESTADISTICASFIFA WHERE OID_ST = W_OID_ST;
            IF (W_ESTADISTICAFIFA.WINRATE != W_WINRATE OR
                W_ESTADISTICAFIFA.GOLESPORPARTIDO != W_GOLESPORPARTIDO) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
            DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END modificar;
    
    PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, salidaEsperada BOOLEAN)
        IS
            W_SALIDA BOOLEAN := true;
            n INTEGER;
        BEGIN
    
        DELETE FROM ESTADISTICAS WHERE OID_ST = W_OID_ST;
    
        SELECT COUNT (*) INTO n FROM ESTADISTICASFIFA WHERE OID_ST = OID_ST;
        IF(n != 0) THEN
            W_SALIDA := false;
        END IF;
        COMMIT WORK;
    
        DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END ELIMINAR;
    
END;
/

CREATE OR REPLACE PACKAGE BODY PACK_ESTADISTICAS_FORTNITE
IS 
    PROCEDURE INICIALIZAR IS
        BEGIN
            FOR REGISTRO IN (SELECT * FROM ESTADISTICASFORTNITE) LOOP
                DELETE FROM ESTADISTICAS WHERE OID_ST = REGISTRO.OID_ST;
            END LOOP;
            DELETE FROM ESTADISTICASFORTNITE;
        END INICIALIZAR;

    PROCEDURE INSERTAR(nombrePrueba VARCHAR2,
                        w_mes IN estadisticas.mes%TYPE,
                        w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE,
                        w_dni IN empleados.dni%TYPE,
                        w_horasStreaming IN estadisticasFortnite.horasStreaming%TYPE,
                        w_kda IN estadisticasFortnite.kda%TYPE,
                        salidaEsperada BOOLEAN) 
        IS
            W_SALIDA BOOLEAN := TRUE;
            W_ESTADISTICAFORTNITE ESTADISTICASFORTNITE%ROWTYPE;
            W_OID_ST INTEGER;
        BEGIN
            
            INSERT INTO ESTADISTICAS (DNI, MES, HORASTRABAJADAS) 
            VALUES (W_DNI, W_MES, W_HORASTRABAJADAS);
        
            INSERT INTO ESTADISTICASFORTNITE (HORASSTREAMING, KDA)
            VALUES (W_HORASSTREAMING, W_KDA);
            
            W_OID_ST := SEC_OID_ST.CURRVAL;
            SELECT * INTO W_ESTADISTICAFORTNITE FROM ESTADISTICASFORTNITE WHERE OID_ST = W_OID_ST;
            IF (W_ESTADISTICAFORTNITE.HORASSTREAMING != W_HORASSTREAMING OR
                W_ESTADISTICAFORTNITE.KDA != W_KDA) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END insertar;

    PROCEDURE MODIFICAR(nombrePrueba VARCHAR2,
                        w_oid_st IN estadisticas.oid_st%TYPE,
                        w_mes IN estadisticas.mes%TYPE,
                        w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE,
                        w_dni IN empleados.dni%TYPE,
                        w_horasStreaming IN estadisticasFortnite.horasStreaming%TYPE,
                        w_kda IN estadisticasFortnite.kda%TYPE,
                        salidaEsperada BOOLEAN) 
        IS
            w_salida BOOLEAN := TRUE;
            W_ESTADISTICAFORTNITE ESTADISTICASFORTNITE%ROWTYPE;
        BEGIN
        UPDATE ESTADISTICAS SET MES = W_MES, HORASTRABAJADAS = W_HORASTRABAJADAS, DNI = W_DNI
        WHERE OID_ST = W_OID_ST;
        
        UPDATE ESTADISTICASFORTNITE SET HORASSTREAMING = W_HORASSTREAMING, KDA = W_KDA
        WHERE OID_ST = W_OID_ST;
    
        SELECT * INTO W_ESTADISTICAFORTNITE FROM ESTADISTICASFORTNITE WHERE OID_ST = W_OID_ST;
            IF (W_ESTADISTICAFORTNITE.HORASSTREAMING != W_HORASSTREAMING OR
                W_ESTADISTICAFORTNITE.KDA != W_KDA) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
            DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END modificar;
    
    PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, salidaEsperada BOOLEAN)
        IS
            W_SALIDA BOOLEAN := true;
            n INTEGER;
        BEGIN
    
        DELETE FROM ESTADISTICAS WHERE OID_ST = W_OID_ST;
    
        SELECT COUNT (*) INTO n FROM ESTADISTICASFORTNITE WHERE OID_ST = OID_ST;
        IF(n != 0) THEN
            W_SALIDA := false;
        END IF;
        COMMIT WORK;
    
        DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END ELIMINAR;
    
END;
/

CREATE OR REPLACE PACKAGE BODY PACK_ESTADISTICAS_BRAWL
IS 
    PROCEDURE INICIALIZAR IS
        BEGIN
            FOR REGISTRO IN (SELECT * FROM ESTADISTICASBRAWLSTARS) LOOP
                DELETE FROM ESTADISTICAS WHERE OID_ST = REGISTRO.OID_ST;
            END LOOP;
            DELETE FROM ESTADISTICASBRAWLSTARS;
        END INICIALIZAR;

    PROCEDURE INSERTAR(nombrePrueba VARCHAR2,
                        w_mes IN estadisticas.mes%TYPE,
                        w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE,
                        w_dni IN empleados.dni%TYPE,
                        w_winRateGlobal IN estadisticasBrawlStars.winRateGlobal%TYPE,
                        w_winRatePorBrawler IN estadisticasBrawlStars.winRatePorBrawler%TYPE,
                        w_copas IN estadisticasBrawlStars.copas%TYPE,
                        salidaEsperada BOOLEAN) 
        IS
            W_SALIDA BOOLEAN := TRUE;
            W_ESTADISTICABRAWL ESTADISTICASBRAWLSTARS%ROWTYPE;
            W_OID_ST INTEGER;
        BEGIN
            
            INSERT INTO ESTADISTICAS (DNI, MES, HORASTRABAJADAS) 
            VALUES (W_DNI, W_MES, W_HORASTRABAJADAS);
        
            INSERT INTO ESTADISTICASBRAWLSTARS (WINRATEGLOBAL, WINRATEPORBRAWLER, COPAS)
            VALUES (W_WINRATEGLOBAL, W_WINRATEPORBRAWLER, W_COPAS);
            
            W_OID_ST := SEC_OID_ST.CURRVAL;
            SELECT * INTO W_ESTADISTICABRAWL FROM ESTADISTICASBRAWLSTARS WHERE OID_ST = W_OID_ST;
            IF (W_ESTADISTICABRAWL.WINRATEGLOBAL != W_WINRATEGLOBAL OR
                W_ESTADISTICABRAWL.WINRATEPORBRAWLER != W_WINRATEPORBRAWLER OR
                W_ESTADISTICABRAWL.COPAS != W_COPAS) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END insertar;

    PROCEDURE MODIFICAR(nombrePrueba VARCHAR2,
                        w_oid_st IN estadisticas.oid_st%TYPE,
                        w_mes IN estadisticas.mes%TYPE,
                        w_horasTrabajadas IN estadisticas.horasTrabajadas%TYPE,
                        w_dni IN empleados.dni%TYPE,
                        w_winRateGlobal IN estadisticasBrawlStars.winRateGlobal%TYPE,
                        w_winRatePorBrawler IN estadisticasBrawlStars.winRatePorBrawler%TYPE,
                        w_copas IN estadisticasBrawlStars.copas%TYPE,
                        salidaEsperada BOOLEAN) 
        IS
            w_salida BOOLEAN := TRUE;
            W_ESTADISTICABRAWL ESTADISTICASBRAWLSTARS%ROWTYPE;
        BEGIN
        UPDATE ESTADISTICAS SET MES = W_MES, HORASTRABAJADAS = W_HORASTRABAJADAS, DNI = W_DNI
        WHERE OID_ST = W_OID_ST;
        
        UPDATE ESTADISTICASBRAWLSTARS SET WINRATEGLOBAL = W_WINRATEGLOBAL,
                                    WINRATEPORBRAWLER = W_WINRATEPORBRAWLER, COPAS = W_COPAS
        WHERE OID_ST = W_OID_ST;
    
        SELECT * INTO W_ESTADISTICABRAWL FROM ESTADISTICASBRAWLSTARS WHERE OID_ST = W_OID_ST;
            IF (W_ESTADISTICABRAWL.WINRATEGLOBAL != W_WINRATEGLOBAL OR
                W_ESTADISTICABRAWL.WINRATEPORBRAWLER != W_WINRATEPORBRAWLER OR
                W_ESTADISTICABRAWL.COPAS != W_COPAS) THEN 
                w_salida := FALSE;
            END IF;
            COMMIT WORK;
        
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END modificar;
    
    PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_st IN estadisticas.oid_st%TYPE, salidaEsperada BOOLEAN)
        IS
            W_SALIDA BOOLEAN := true;
            n INTEGER;
        BEGIN
    
        DELETE FROM ESTADISTICAS WHERE OID_ST = W_OID_ST;
    
        SELECT COUNT (*) INTO n FROM ESTADISTICASBRAWLSTARS WHERE OID_ST = OID_ST;
        IF(n != 0) THEN
            W_SALIDA := false;
        END IF;
        COMMIT WORK;
    
        DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(w_salida, salidaEsperada));
        
            EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.put_line(NOMBREPRUEBA || ': ' || resultado(false, salidaEsperada));
            ROLLBACK;
        END ELIMINAR;
    
END;
/
CREATE OR REPLACE PACKAGE BODY Pack_Equipos
IS
    w_Salida BOOLEAN := TRUE;
    w_Equipo equipos%ROWTYPE;
PROCEDURE Inicializar
IS
BEGIN
    DELETE FROM equipos;
END Inicializar;

PROCEDURE Insertar  (nombrePrueba VARCHAR2,
                    w_nombre IN equipos.nombre%TYPE,
                    w_clasificacionGlobal IN equipos.clasificacionGlobal%TYPE,
                    w_clasificacionNacional IN equipos.clasificacionNacional%TYPE,
                    w_dni IN managers.dni%TYPE,
                    salidaEsperada BOOLEAN)
IS
    w_oid_eq equipos.oid_eq%TYPE;
BEGIN
    INSERT INTO equipos (nombre, clasificacionGlobal, clasificacionNacional, dni) VALUES (w_nombre, w_clasificacionGlobal, w_clasificacionNacional, w_dni);
    w_oid_eq := sec_oid_eq.CURRVAL;
    SELECT * INTO w_Equipo FROM equipos WHERE oid_eq = w_oid_eq;
    IF (w_nombre != w_Equipo.nombre AND
        w_clasificacionGlobal != w_Equipo.clasificacionGlobal AND
        w_clasificacionNacional != w_Equipo.clasificacionNacional AND
        w_dni != w_Equipo.dni)
    THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Insertar;

PROCEDURE Modificar (nombrePrueba VARCHAR2,
                    w_oid_eq IN equipos.oid_eq%TYPE,
                    w_nombre IN equipos.nombre%TYPE,
                    w_clasificacionGlobal IN equipos.clasificacionGlobal%TYPE,
                    w_clasificacionNacional IN equipos.clasificacionNacional%TYPE,
                    w_dni IN managers.dni%TYPE, salidaEsperada BOOLEAN)
IS
BEGIN
    UPDATE equipos SET nombre = w_nombre, clasificacionGlobal = w_clasificacionGlobal,
    clasificacionNacional = w_clasificacionNacional, dni = w_dni WHERE oid_eq = w_oid_eq;
    SELECT * INTO w_Equipo FROM equipos WHERE oid_eq = w_oid_eq;
    IF (w_nombre != w_Equipo.nombre AND
        w_clasificacionGlobal != w_Equipo.clasificacionGlobal AND
        w_clasificacionNacional != w_Equipo.clasificacionNacional AND
        w_dni != w_Equipo.dni)
    THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Modificar;

PROCEDURE Eliminar  (nombrePrueba VARCHAR2,
                    w_oid_eq IN equipos.oid_eq%TYPE,
                    salidaEsperada BOOLEAN)
IS
    numEquipos NUMBER := 0;
BEGIN
    DELETE FROM equipos WHERE oid_eq = w_oid_eq;
    SELECT COUNT(*) INTO numEquipos FROM equipos WHERE oid_eq = w_oid_eq;
    IF numEquipos != 0
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Eliminar;
END;
/
CREATE OR REPLACE PACKAGE BODY Pack_Partidos_CSGO
IS
    w_Salida BOOLEAN := TRUE;
    w_PartidoCSGO partidosCSGO%ROWTYPE;
PROCEDURE Inicializar
IS
BEGIN
    DELETE FROM partidosCSGO;
END Inicializar;

PROCEDURE Insertar  (nombrePrueba VARCHAR2,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_mapa IN partidosCSGO.mapa%TYPE,
                    w_puntuacion IN partidosCSGO.puntuacion%TYPE,
                    w_comprasPorRonda IN partidosCSGO.comprasPorRonda%TYPE,
                    salidaEsperada BOOLEAN)
IS
    w_oid_pt partidos.oid_pt%TYPE;
BEGIN
    INSERT INTO partidos(resultado, tipopartido, videojuego, fecha, jugadoresseleccionados, oid_lg) 
        VALUES (w_resultado, w_tipoPartido,'CSGO', w_fecha, w_jugadoresSeleccionados, w_oid_lg);
    INSERT INTO partidosCSGO(mapa, puntuacion, comprasPorRonda)
        VALUES (w_mapa, w_puntuacion, w_comprasPorRonda);
        
    w_oid_pt := sec_oid_pt.CURRVAL;
    SELECT * INTO w_PartidoCSGO FROM partidosCSGO WHERE oid_pt = w_oid_pt;
    IF (w_mapa != w_PartidoCSGO.mapa AND
    w_puntuacion != w_PartidoCSGO.puntuacion AND
    w_comprasPorRonda != w_PartidoCSGO.comprasPorRonda)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Insertar;

PROCEDURE Modificar (nombrePrueba VARCHAR2,
                    w_oid_pt IN partidos.oid_pt%TYPE,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_mapa IN partidosCSGO.mapa%TYPE,
                    w_puntuacion IN partidosCSGO.puntuacion%TYPE,
                    w_comprasPorRonda IN partidosCSGO.comprasPorRonda%TYPE,
                    salidaEsperada BOOLEAN)
IS
BEGIN
    UPDATE partidos SET resultado = w_resultado, tipoPartido = w_tipoPartido, fecha = w_fecha,
    jugadoresSeleccionados = w_jugadoresSeleccionados, oid_lg = w_oid_lg WHERE oid_pt = w_oid_pt;
    UPDATE partidosCSGO SET mapa = w_mapa, puntuacion = w_puntuacion, comprasPorRonda = w_comprasPorRonda 
    WHERE oid_pt = w_oid_pt;
    
    SELECT * INTO w_PartidoCSGO FROM partidosCSGO WHERE oid_pt = w_oid_pt;
    IF (w_mapa != w_PartidoCSGO.mapa AND
    w_puntuacion != w_PartidoCSGO.puntuacion AND
    w_comprasPorRonda != w_PartidoCSGO.comprasPorRonda)
    THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Modificar;

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE, salidaEsperada BOOLEAN)
IS
    numPartidosCSGO NUMBER := 0;
BEGIN
    DELETE FROM partidos WHERE oid_pt = w_oid_pt;
    SELECT COUNT(*) INTO numPartidosCSGO FROM partidosCSGO WHERE oid_pt = w_oid_pt;
    IF numPartidosCSGO != 0
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Eliminar;
END;
/
CREATE OR REPLACE PACKAGE BODY Pack_Partidos_Fortnite
IS
    w_Salida BOOLEAN := TRUE;
    w_PartidoFortnite partidosFortnite%ROWTYPE;
    
PROCEDURE Inicializar
IS
BEGIN
    DELETE FROM partidosFortnite;
END Inicializar;

PROCEDURE Insertar  (nombrePrueba VARCHAR2,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_bajas IN partidosFortnite.bajas%TYPE,
                    w_tipo IN partidosFortnite.tipo%TYPE,
                    w_posicion IN partidosFortnite.posicion%TYPE,
                    w_puntos IN partidosFortnite.puntos%TYPE,
                    salidaEsperada BOOLEAN)
IS
    w_oid_pt partidos.oid_pt%TYPE;
BEGIN
    INSERT INTO partidos(resultado, tipopartido, videojuego, fecha, jugadoresseleccionados, oid_lg) 
        VALUES (w_resultado, w_tipoPartido,'Fortnite', w_fecha, w_jugadoresSeleccionados, w_oid_lg);
    INSERT INTO partidosFortnite(bajas, tipo, posicion, puntos)
        VALUES (w_bajas, w_tipo, w_posicion, w_puntos);
        
    w_oid_pt := sec_oid_pt.CURRVAL;
    SELECT * INTO w_PartidoFortnite FROM partidosFortnite WHERE oid_pt = w_oid_pt;
    IF (w_bajas != w_PartidoFortnite.bajas AND
    w_tipo != w_PartidoFortnite.tipo AND
    w_posicion != w_PartidoFortnite.posicion AND
    w_puntos != w_PartidoFortnite.puntos)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Insertar;

PROCEDURE Modificar (nombrePrueba VARCHAR2,
                    w_oid_pt IN partidos.oid_pt%TYPE,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_bajas IN partidosFortnite.bajas%TYPE,
                    w_tipo IN partidosFortnite.tipo%TYPE,
                    w_posicion IN partidosFortnite.posicion%TYPE,
                    w_puntos IN partidosFortnite.puntos%TYPE,salidaEsperada BOOLEAN)
IS
BEGIN
    UPDATE partidos SET resultado = w_resultado, tipoPartido = w_tipoPartido, fecha = w_fecha,
    jugadoresSeleccionados = w_jugadoresSeleccionados, oid_lg = w_oid_lg WHERE oid_pt = w_oid_pt;
    UPDATE partidosFortnite SET bajas = w_bajas, tipo = w_tipo, posicion = w_posicion, puntos = w_puntos
    WHERE oid_pt = w_oid_pt;
    
    SELECT * INTO w_PartidoFortnite FROM partidosFortnite WHERE oid_pt = w_oid_pt;
    IF (w_bajas != w_PartidoFortnite.bajas AND
    w_tipo != w_PartidoFortnite.tipo AND
    w_posicion != w_PartidoFortnite.posicion AND
    w_puntos != w_PartidoFortnite.puntos)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Modificar;

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN)
IS
    numPartidosFortnite NUMBER := 0;
BEGIN
    DELETE FROM partidos WHERE oid_pt = w_oid_pt;
    SELECT COUNT(*) INTO numPartidosFortnite FROM partidosFortnite WHERE oid_pt = w_oid_pt;
    IF numPartidosFortnite != 0
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Eliminar;
END;
/
CREATE OR REPLACE PACKAGE BODY Pack_Partidos_Brawl
IS
    w_Salida BOOLEAN := TRUE;
    w_PartidoBrawl partidosBrawl%ROWTYPE;
PROCEDURE Inicializar
IS
BEGIN
    DELETE FROM partidosBrawl;
END Inicializar;

PROCEDURE Insertar  (nombrePrueba VARCHAR2,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_mapa IN partidosBrawl.mapa%TYPE,
                    w_modo IN partidosBrawl.modo%TYPE,
                    w_brawlers IN partidosBrawl.brawlers%TYPE,
                    w_puntuacion IN partidosBrawl.puntuacion%TYPE,
                    salidaEsperada BOOLEAN)
IS
    w_oid_pt partidos.oid_pt%TYPE;
BEGIN
    INSERT INTO partidos (resultado, tipopartido, videojuego, fecha, jugadoresseleccionados, oid_lg) 
        VALUES (w_resultado, w_tipoPartido,'Brawl Stars', w_fecha, w_jugadoresSeleccionados, w_oid_lg);
    INSERT INTO partidosBrawl (mapa, modo, brawlers, puntuacion)
        VALUES (w_mapa, w_modo, w_brawlers, w_puntuacion);
        
    w_oid_pt := sec_oid_pt.CURRVAL;
    SELECT * INTO w_PartidoBrawl FROM partidosBrawl WHERE oid_pt = w_oid_pt;
    IF (w_mapa != w_PartidoBrawl.mapa AND
    w_modo != w_PartidoBrawl.modo AND
    w_brawlers != w_PartidoBrawl.brawlers AND
    w_puntuacion != w_PartidoBrawl.puntuacion)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Insertar;

PROCEDURE Modificar (nombrePrueba VARCHAR2,
                    w_oid_pt IN partidos.oid_pt%TYPE,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_mapa IN partidosBrawl.mapa%TYPE,
                    w_modo IN partidosBrawl.modo%TYPE,
                    w_brawlers IN partidosBrawl.brawlers%TYPE,
                    w_puntuacion IN partidosBrawl.puntuacion%TYPE,
                    salidaEsperada BOOLEAN)
IS
BEGIN
    UPDATE partidos SET resultado = w_resultado, tipoPartido = w_tipoPartido, fecha = w_fecha,
    jugadoresSeleccionados = w_jugadoresSeleccionados, oid_lg = w_oid_lg WHERE oid_pt = w_oid_pt;
    UPDATE partidosBrawl SET mapa = w_mapa, modo = w_modo, brawlers = w_brawlers, puntuacion = w_puntuacion
    WHERE oid_pt = w_oid_pt;
    
    
    SELECT * INTO w_PartidoBrawl FROM partidosBrawl WHERE oid_pt = w_oid_pt;
    IF (w_mapa != w_PartidoBrawl.mapa AND
    w_modo != w_PartidoBrawl.modo AND
    w_brawlers != w_PartidoBrawl.brawlers AND
    w_puntuacion != w_PartidoBrawl.puntuacion)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Modificar;

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN)
IS
    numPartidosBrawl NUMBER := 0;
BEGIN
    DELETE FROM partidos WHERE oid_pt = w_oid_pt;
    SELECT COUNT(*) INTO numPartidosBrawl FROM partidosBrawl WHERE oid_pt = w_oid_pt;
    IF numPartidosBrawl != 0
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Eliminar;
END;
/
CREATE OR REPLACE PACKAGE BODY Pack_Partidos_LoL
IS
    w_Salida BOOLEAN := TRUE;
    w_PartidoLoL partidosLoL%ROWTYPE;
PROCEDURE Inicializar
IS
BEGIN
    DELETE FROM partidosLoL;
END Inicializar;

PROCEDURE Insertar  (nombrePrueba VARCHAR2,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_kda IN partidosLoL.kda%TYPE,
                    w_campeones IN partidosLoL.campeones%TYPE,
                    w_baneos IN partidosLoL.baneos%TYPE,
                    w_objetivos IN partidosLoL.objetivos%TYPE,
                    w_builds IN partidosLoL.builds%TYPE,
                    salidaEsperada BOOLEAN)
IS
    w_oid_pt partidos.oid_pt%TYPE;
BEGIN
    INSERT INTO partidos(resultado, tipopartido, videojuego, fecha, jugadoresseleccionados, oid_lg) 
        VALUES (w_resultado, w_tipoPartido,'LOL', w_fecha, w_jugadoresSeleccionados, w_oid_lg);
    INSERT INTO partidosLoL(kda, campeones, baneos, objetivos, builds)
        VALUES (w_kda, w_campeones, w_baneos, w_objetivos, w_builds);
        
    w_oid_pt := sec_oid_pt.CURRVAL;
    SELECT * INTO w_PartidoLoL FROM partidosLoL WHERE oid_pt = w_oid_pt;
    IF (w_kda != w_PartidoLoL.kda AND
    w_campeones != w_PartidoLoL.campeones AND
    w_baneos != w_PartidoLoL.baneos AND
    w_objetivos != w_PartidoLoL.objetivos AND
    w_builds != w_PartidoLoL.builds)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Insertar;

PROCEDURE Modificar (nombrePrueba VARCHAR2,
                    w_oid_pt IN partidos.oid_pt%TYPE,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_kda IN partidosLoL.kda%TYPE,
                    w_campeones IN partidosLoL.campeones%TYPE,
                    w_baneos IN partidosLoL.baneos%TYPE,
                    w_objetivos IN partidosLoL.objetivos%TYPE,
                    w_builds IN partidosLoL.builds%TYPE,
                    salidaEsperada BOOLEAN)
IS
BEGIN
    UPDATE partidos SET resultado = w_resultado, tipoPartido = w_tipoPartido, fecha = w_fecha,
    jugadoresSeleccionados = w_jugadoresSeleccionados, oid_lg = w_oid_lg WHERE oid_pt = w_oid_pt;
    UPDATE partidosLoL SET kda = w_kda, campeones = w_campeones, baneos = w_baneos,
    objetivos = w_objetivos, builds = w_builds WHERE oid_pt = w_oid_pt;
    
    SELECT * INTO w_PartidoLoL FROM partidosLoL WHERE oid_pt = w_oid_pt;
    IF (w_kda != w_PartidoLoL.kda AND
    w_campeones != w_PartidoLoL.campeones AND
    w_baneos != w_PartidoLoL.baneos AND
    w_objetivos != w_PartidoLoL.objetivos AND
    w_builds != w_PartidoLoL.builds)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Modificar;

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN)
IS
    numPartidosLoL NUMBER := 0;
BEGIN
    DELETE FROM partidos WHERE oid_pt = w_oid_pt;
    SELECT COUNT(*) INTO numPartidosLoL FROM partidosLoL WHERE oid_pt = w_oid_pt;
    IF numPartidosLoL != 0
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Eliminar;
END;
/
CREATE OR REPLACE PACKAGE BODY Pack_Partidos_Clash_Royale
IS
    w_Salida BOOLEAN := TRUE;
    w_PartidoClashRoyale partidosClashRoyale%ROWTYPE;
PROCEDURE Inicializar
IS
BEGIN
    DELETE FROM partidosClashRoyale;
END Inicializar;

PROCEDURE Insertar  (nombrePrueba VARCHAR2,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_puntuacion IN partidosClashRoyale.puntuacion%TYPE,
                    w_baneos IN partidosClashRoyale.baneos%TYPE,
                    w_mazos IN partidosClashRoyale.mazos%TYPE,
                    w_modo IN partidosClashRoyale.modo%TYPE,
                    salidaEsperada BOOLEAN)
IS
    w_oid_pt partidos.oid_pt%TYPE;
BEGIN
    INSERT INTO partidos(resultado, tipopartido, videojuego, fecha, jugadoresseleccionados, oid_lg) 
        VALUES (w_resultado, w_tipoPartido,'Clash Royale', w_fecha, w_jugadoresSeleccionados, w_oid_lg);
    INSERT INTO partidosClashRoyale(puntuacion, baneos, mazos, modo)
        VALUES (w_puntuacion, w_baneos, w_mazos, w_modo);
        
    w_oid_pt := sec_oid_pt.CURRVAL;
    SELECT * INTO w_PartidoClashRoyale FROM partidosClashRoyale WHERE oid_pt = w_oid_pt;
    IF (w_puntuacion != w_PartidoClashRoyale.puntuacion AND
    w_baneos != w_PartidoClashRoyale.baneos AND
    w_mazos != w_PartidoClashRoyale.mazos AND
    w_modo != w_PartidoClashRoyale.modo)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Insertar;

PROCEDURE Modificar (nombrePrueba VARCHAR2,
                    w_oid_pt IN partidos.oid_pt%TYPE,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_puntuacion IN partidosClashRoyale.puntuacion%TYPE,
                    w_baneos IN partidosClashRoyale.baneos%TYPE,
                    w_mazos IN partidosClashRoyale.mazos%TYPE,
                    w_modo IN partidosClashRoyale.modo%TYPE,
                    salidaEsperada BOOLEAN)
IS
BEGIN
    UPDATE partidos SET resultado = w_resultado, tipoPartido = w_tipoPartido, fecha = w_fecha,
    jugadoresSeleccionados = w_jugadoresSeleccionados, oid_lg = w_oid_lg WHERE oid_pt = w_oid_pt;
    UPDATE partidosClashRoyale SET puntuacion = w_puntuacion, baneos = w_baneos,
    mazos = w_mazos, modo = w_modo WHERE oid_pt = w_oid_pt;
    
    SELECT * INTO w_PartidoClashRoyale FROM partidosClashRoyale WHERE oid_pt = w_oid_pt;
    IF (w_puntuacion != w_PartidoClashRoyale.puntuacion AND
    w_baneos != w_PartidoClashRoyale.baneos AND
    w_mazos != w_PartidoClashRoyale.mazos AND
    w_modo != w_PartidoClashRoyale.modo)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Modificar;

PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN)
IS
    numPartidosClashRoyale NUMBER := 0;
BEGIN
    DELETE FROM partidos WHERE oid_pt = w_oid_pt;
    SELECT COUNT(*) INTO numPartidosClashRoyale FROM partidosClashRoyale WHERE oid_pt = w_oid_pt;
    IF numPartidosClashRoyale != 0
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Eliminar;
END;
/
CREATE OR REPLACE PACKAGE BODY Pack_Partidos_Fifa
IS
    w_Salida BOOLEAN := TRUE;
    w_PartidoFifa partidosFifa%ROWTYPE;
PROCEDURE Inicializar
IS
BEGIN
    DELETE FROM partidosFifa;
END Inicializar;

PROCEDURE Insertar  (nombrePrueba VARCHAR2,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_equiposFutbol IN partidosFifa.equiposFutbol%TYPE,
                    w_goles IN partidosFifa.goles%TYPE,
                    salidaEsperada BOOLEAN)
IS
    w_oid_pt partidos.oid_pt%TYPE;
BEGIN
    INSERT INTO partidos(resultado, tipopartido, videojuego, fecha, jugadoresseleccionados, oid_lg) 
        VALUES (w_resultado, w_tipoPartido,'Fifa', w_fecha, w_jugadoresSeleccionados, w_oid_lg);
    INSERT INTO partidosFifa(equiposFutbol, goles)
        VALUES (w_equiposFutbol, w_goles);
        
    w_oid_pt := sec_oid_pt.CURRVAL;
    SELECT * INTO w_PartidoFifa FROM partidosFifa WHERE oid_pt = w_oid_pt;
    IF (w_equiposFutbol != w_PartidoFifa.equiposFutbol AND
    w_goles != w_PartidoFifa.goles)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Insertar;

PROCEDURE Modificar (nombrePrueba VARCHAR2,
                    w_oid_pt IN partidos.oid_pt%TYPE,
                    w_resultado IN partidos.resultado%TYPE,
                    w_tipoPartido IN partidos.tipoPartido%TYPE,
                    w_fecha IN partidos.fecha%TYPE,
                    w_jugadoresSeleccionados IN partidos.jugadoresSeleccionados%TYPE,
                    w_oid_lg IN ligas.oid_lg%TYPE,
                    w_equiposFutbol IN partidosFifa.equiposFutbol%TYPE,
                    w_goles IN partidosFifa.goles%TYPE,
                    salidaEsperada BOOLEAN)
IS
BEGIN
    UPDATE partidos SET resultado = w_resultado, tipoPartido = w_tipoPartido, fecha = w_fecha,
    jugadoresSeleccionados = w_jugadoresSeleccionados, oid_lg = w_oid_lg WHERE oid_pt = w_oid_pt;
    UPDATE partidosFifa SET equiposFutbol = w_equiposFutbol, goles = w_goles WHERE oid_pt = w_oid_pt;
    
    SELECT * INTO w_PartidoFifa FROM partidosFifa WHERE oid_pt = w_oid_pt;
    IF (w_equiposFutbol != w_PartidoFifa.equiposFutbol AND
    w_goles != w_PartidoFifa.goles)
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Modificar;
PROCEDURE Eliminar(nombrePrueba VARCHAR2, w_oid_pt IN partidos.oid_pt%TYPE,salidaEsperada BOOLEAN)
IS
    numPartidosFifa NUMBER := 0;
BEGIN
    DELETE FROM partidos WHERE oid_pt = w_oid_pt;
    SELECT COUNT(*) INTO numPartidosFifa FROM partidosFifa WHERE oid_pt = w_oid_pt;
    IF numPartidosFifa != 0
        THEN w_Salida := FALSE;
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(w_Salida, salidaEsperada));
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || resultado(FALSE, salidaEsperada));
        ROLLBACK;
END Eliminar;
END;
/
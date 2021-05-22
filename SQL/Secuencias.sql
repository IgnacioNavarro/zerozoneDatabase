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
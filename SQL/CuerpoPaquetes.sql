CREATE OR REPLACE FUNCTION resultado(salida BOOLEAN, salidaEsperada BOOLEAN)
RETURN VARCHAR2 AS
    BEGIN
        IF (salida = salidaEsperada) THEN
            RETURN '�xito';
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

/*
--INSERTS PARA PROBAR ON DELETE CASCADE:
SET SERVEROUTPUT ON;

DECLARE
    NUM_OID INTEGER;
BEGIN
PACK_JUGADORES.INICIALIZAR;
END;
BEGIN
PACK_JUGADORES.INSERTAR('Prueba ON DELETE CASCADE', '21153329E', 'Hegoa', 18, 600065504,
                        'LOL', TO_DATE('2020-01-15', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD')
                        , 'Y', 10, 'hegoaria@gmail.com', 'Tremor', 'twitter lmao', 'ya quisieras tu saberla',
                        'S', 'JUNGLA', 'Felicidad', '12345678U', 625188663, 'fherreragalante@gmail.com',
                        NULL, TRUE);
END;

BEGIN
PACK_JUGADORES.ELIMINAR('ELIMINAR ON DELETE CASCADE', '21153329E', TRUE);
END;
BEGIN
PACK_ESTADISTICAS_FIFA.INSERTAR('PRUEBA', 'ENERO', 80, '21153329E', 100.00, 20.0, TRUE);
END;
BEGIN
INSERT INTO ESTADISTICAS(DNI, MES, HORASTRABAJADAS) VALUES('21153329E', 'TUMADRE', 80);
END;
*/

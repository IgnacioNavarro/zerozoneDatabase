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

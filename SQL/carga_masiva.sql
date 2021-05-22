/*CLASH ROYALE*/
    /*EMPLEADOS*/   
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('49056788L', 'PABLO CODINA MANZANARES', 18, 440356486, 'Jugador', 'Clash Royale', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'Y', 15, 'mjewell@mac.com', 'HaRKbOHL', 'TW:HaRKbOHL IG:HaRKbOHL', 'C. Comercial Lorem ipsum dolor sit, 123', 'M');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('54792253C', 'SARA CAPITAN BARBERO', 20, 892288863, 'Jugador', 'Clash Royale', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'N', 15, 'kourai@icloud.com', 'tUrgaDom', 'TW:tUrgaDom IG:tUrgaDom', 'Glorieta Lorem ipsum dolor, 240', 'S');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('27564033M', 'MONICA CLAROS SAMPEDRO', 16, 940471179, 'Jugador', 'Clash Royale', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Y', 15, 'bdthomas@hotmail.com', 'Toredo', 'TW:Toredo IG:Toredo', 'Pasaje Lorem, 241B', 'L');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('54547919S', 'AITOR ADELL IBORRA', 30, 635162763, 'Manager', 'Clash Royale', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'Y', 30, 'jdray@msn.com', 'Acucuki', 'TW:Acucuki IG:Acucuki', 'Quevedo, 35', 'L');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('31807091T', 'ANA MARIA GAVIRA PIÑEIRO', 26, 569266817, 'Coach', 'Clash Royale', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'Y', 30, 'doormat@verizon.net', 'Kolyan97', 'TW:Kolyan97 IG:Kolyan97', 'Ctra. Beas-Cortijos Nuevos, 45', 'XL');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('12834713T', 'CRISTOBAL VALDES RODRIGUES', 28, 148695561, 'Analista', 'Clash Royale', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Y', 30, 'mddallara@optonline.net', 'Lakzy', 'TW:Lakzy IG:Lakzy', 'Paseo del Atlántico, 10', 'L');
    /*MANAGER*/
INSERT INTO managers (dni) VALUES ('54547919S');
    /*EQUIPO*/
INSERT INTO equipos (dni, nombre, clasificacionGlobal, clasificacionNacional) VALUES ('54547919S', 'TOWER DEFENCE', 100, 3);
    /*JUGADORES*/
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('49056788L', NULL, SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('54792253C', NULL, SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, nombreTutor, dniTutor, telefonoTutor, correoTutor, OID_eq) VALUES ('27564033M', NULL, 'MARIO WANG BALBOA', '99420878C', 490631505, 'weazelman@gmail.com', SEC_OID_EQ.CURRVAL);
    /*ESTADISTICAS*/
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('49056788L', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasclashroyale (winRateGlobal, partidasPorMazo, winRatePorMazo) VALUES (53.00, 30.33, 45.98);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('49056788L', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasclashroyale (winRateGlobal, partidasPorMazo, winRatePorMazo) VALUES (60.00, 42.35, 52.76);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('54792253C', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasclashroyale (winRateGlobal, partidasPorMazo, winRatePorMazo) VALUES (56.00, 64.53, 46.43);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('54792253C', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasclashroyale (winRateGlobal, partidasPorMazo, winRatePorMazo) VALUES (46.00, 56.75, 66.64);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('27564033M', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasclashroyale (winRateGlobal, partidasPorMazo, winRatePorMazo) VALUES (59.00, 41.74, 54.76);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('27564033M', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasclashroyale (winRateGlobal, partidasPorMazo, winRatePorMazo) VALUES (58.00, 64.75, 65.78);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('54547919S', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('31807091T', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('12834713T', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('54547919S', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('31807091T', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('12834713T', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
    /*COACH*/
INSERT INTO coachs (dni) VALUES ('31807091T');
INSERT INTO entrena (dni, oid_eq) VALUES ('31807091T', SEC_OID_EQ.CURRVAL);
    /*ANALISTA*/
INSERT INTO analistas (dni) VALUES ('12834713T');
INSERT INTO analiza (dni, oid_eq) VALUES ('12834713T', SEC_OID_EQ.CURRVAL);

/*BRAWL STARS*/
    /*EMPLEADOS*/
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('22817208N', 'LORENZO RUZ BLANCA', 18, 980366714, 'Jugador', 'Brawl Stars', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'N', 15, 'csilvers@msn.com', 'Davon', 'TW:Davon IG:Davon', 'Carrer Lorem ipsum dolor sit, 248B 11ºA', 'M');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('16020142K', 'MARIA ANTONIA GRANERO EGEA', 19, 115789065, 'Jugador', 'Brawl Stars', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'Y', 15, 'bmidd@hotmail.com', 'laki10770', 'TW:laki10770 IG:laki10770', 'Carretera Lorem ipsum dolor sit, 293 8ºC', 'S');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('10346331B', 'LORENZO FERRERAS MOLL', 22, 725168626, 'Jugador', 'Brawl Stars', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'N', 15, 'ozawa@yahoo.ca', 'KOLIJKA', 'TW:KOLIJKA IG:KOLIJKA', 'Rambla Lorem ipsum, 212A 19ºC', 'L');        
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('86683591H', 'RAQUEL OLIVEROS MONREAL', 32, 090820902, 'Manager', 'Brawl Stars', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'Y', 30, 'malvar@hotmail.com', 'Gross600', 'TW:Gross600 IG:Gross600', 'Carretera Cádiz-Málaga, 89', 'L');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('51041511A', 'ALFONSO SARRIA ALCAIDE', 21, 460961923, 'Coach', 'Brawl Stars', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'Y', 30, 'wiseb@optonline.net', 'PEROSIDA', 'TW:PEROSIDA IG:PEROSIDA', 'Rio Segura, 89', 'XL');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('77386211C', 'DOLORES LIEBANA LLORCA', 29, 286059726, 'Analista', 'Brawl Stars', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Y', 30, 'goldberg@live.com', 'FCVP', 'TW:FCVP IG:FCVP', 'Zumalakarregi etorbidea, 20', 'L');
    /*MANAGER*/
INSERT INTO managers (dni) VALUES ('86683591H');
    /*EQUIPO*/
INSERT INTO equipos (dni, nombre, clasificacionGlobal, clasificacionNacional) VALUES ('86683591H', 'LOL PARA EL MOVIL', 60, 1);
    /*JUGADORES*/
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('22817208N', 'MID', SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('16020142K', 'LEFT', SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('10346331B', 'RIGHT', SEC_OID_EQ.CURRVAL);
    /*ESTADISTICAS*/
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('22817208N', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasbrawlstars (winRatePorBrawler, winRateGlobal) VALUES (55.86, 65.66);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('22817208N', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasbrawlstars (winRatePorBrawler, winRateGlobal) VALUES (53.86, 64.75);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('16020142K', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasbrawlstars (winRatePorBrawler, winRateGlobal) VALUES (59.36, 64.35);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('16020142K', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasbrawlstars (winRatePorBrawler, winRateGlobal) VALUES (53.75, 76.24);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('10346331B', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasbrawlstars (winRatePorBrawler, winRateGlobal) VALUES (45.36, 62.72);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('10346331B', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasbrawlstars (winRatePorBrawler, winRateGlobal) VALUES (72.86, 45.79);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('86683591H', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('51041511A', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('77386211C', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('86683591H', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('51041511A', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('77386211C', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
    /*COACH*/
INSERT INTO coachs (dni) VALUES ('51041511A');
INSERT INTO entrena (dni, oid_eq) VALUES ('51041511A', SEC_OID_EQ.CURRVAL);
    /*ANALISTA*/
INSERT INTO analistas (dni) VALUES ('77386211C');
INSERT INTO analiza (dni, oid_eq) VALUES ('77386211C', SEC_OID_EQ.CURRVAL);

/*FIFA*/
    /*EMPLEADOS*/
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('07217229J', 'MARIO CEA SOLIS', 18, 441184008, 'Jugador', 'FIFA', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'Y', 15, 'sethbrown@outlook.com', 'KetyBree', 'TW:KetyBree IG:KetyBree', 'Camino Lorem ipsum dolor, 29 11ºE', 'M');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('13289610A', 'JUAN VILLARROYA CIFUENTES', 15, 608615107, 'Jugador', 'FIFA', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'N', 15, 'morain@icloud.com', 'Milicenta', 'TW:Milicenta IG:Milicenta', 'Ronda Lorem, 254B', 'S');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('64626959H', 'MARIA JOSEFA VIVANCO PARRAGA', 17, 845062034, 'Jugador', 'FIFA', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Y', 15, 'mrdvt@me.com', 'DriadaHIL', 'TW:DriadaHIL IG:DriadaHIL', 'Cuesta Lorem ipsum dolor sit, 253 17ºB', 'L');        
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('35844105P', 'MARTIN BALLESTER CABRAL', 24, 016124574, 'Manager', 'FIFA', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'Y', 30, 'jfinke@yahoo.ca', 'Kyuubey', 'TW:Kyuubey IG:Kyuubey', 'C/ Andalucía, 89', 'L');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('97184318A', 'ALICIA MONTALVO BERNABE', 22, 268109541, 'Coach', 'FIFA', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'Y', 30, 'nweaver@yahoo.ca', 'xxDivadxx', 'TW:xxDivadxx IG:xxDivadxx', 'Valadouro, 77', 'XL');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('03438470Q', 'PEDRO DIOS GRANADOS', 29, 727089926, 'Analista', 'FIFA', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Y', 30, 'gknauss@icloud.com', 'kekcman', 'TW:kekcman IG:kekcman', 'Cruce Casa de Postas, 38', 'L');
    /*MANAGER*/
INSERT INTO managers (dni) VALUES ('35844105P');
    /*EQUIPO*/
INSERT INTO equipos (dni, nombre, clasificacionGlobal, clasificacionNacional) VALUES ('35844105P', 'TEAM CHIQUITO', 153, 48);
    /*JUGADORES*/
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('07217229J', NULL, SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, nombreTutor, dniTutor, telefonoTutor, correoTutor, OID_eq) VALUES ('13289610A', NULL, 'JUANA PEINADO TOME', '07937325W', 548530046, 'cyrus@hotmail.com', SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, nombreTutor, dniTutor, telefonoTutor, correoTutor, OID_eq) VALUES ('64626959H', NULL, 'LORENA TEJERO LAVADO', '28372289H', 256196996, 'janusfury@gmail.com', SEC_OID_EQ.CURRVAL);
/*ESTADISTICAS*/
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('07217229J', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfifa (winRate, golesPorPartido) VALUES (35.00, 21.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('07217229J', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfifa (winRate, golesPorPartido) VALUES (64.00, 18.50);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('13289610A', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfifa (winRate, golesPorPartido) VALUES (59.00, 23.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('13289610A', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfifa (winRate, golesPorPartido) VALUES (62.00, 20.50);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('64626959H', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfifa (winRate, golesPorPartido) VALUES (48.00, 17.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('64626959H', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfifa (winRate, golesPorPartido) VALUES (66.00, 10.50);


INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('35844105P', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('97184318A', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('03438470Q', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('35844105P', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('97184318A', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('03438470Q', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
    /*COACH*/
INSERT INTO coachs (dni) VALUES ('97184318A');
INSERT INTO entrena (dni, oid_eq) VALUES ('97184318A', SEC_OID_EQ.CURRVAL);
    /*ANALISTA*/
INSERT INTO analistas (dni) VALUES ('03438470Q');
INSERT INTO analiza (dni, oid_eq) VALUES ('03438470Q', SEC_OID_EQ.CURRVAL);

/*LOL*/
    /*EMPLEADOS*/
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('82957696P', 'MARIA SOLEDAD FELIU PERALTA', 25, 165217625, 'Jugador', 'LOL', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'N', 15, 'euice@gmail.com', 'Rolleks', 'TW:Rolleks IG:Rolleks', 'Reyes Católicos, 74', 'M');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('27618290M', 'ALVARO PAZOS VILLAESCUSA', 20, 515266152, 'Jugador', 'LOL', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'Y', 15, 'fmerges@live.com', 'Siasons', 'TW:Siasons IG:Siasons', 'Rio Segura, 63', 'S');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('66987933L', 'JUAN FRANCISCO PITARCH ROMA', 18, 439083208, 'Jugador', 'LOL', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'N', 15, 'oneiros@yahoo.ca', 'MeL692', 'TW:MeL692 IG:MeL692', 'Plaza de España, 94', 'L');        
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('58195956E', 'MARGARITA AROCA SALADO', 30, 635796104, 'Manager', 'LOL', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'Y', 30, 'research@aol.com', 'likaaaa', 'TW:likaaaa IG:likaaaa', 'Ctra. de Siles, 59', 'L');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('53318859Y', 'EUGENIO CAVA CAMARENA', 25, 220174541, 'Coach', 'LOL', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'Y', 30, 'pakaste@comcast.net', 'SkinxeD', 'TW:SkinxeD IG:SkinxeD', 'Visitación de la Encina, 64', 'XL');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('85802300H', 'PAULA SAEZ GONZALEZ', 27, 050637196, 'Analista', 'LOL', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Y', 30, 'bhtower@gmail.com', 'Lue', 'TW:Lue IG:Lue', 'Calle Carril de la Fuente, 36', 'L');
    /*MANAGER*/
INSERT INTO managers (dni) VALUES ('58195956E');
    /*EQUIPO*/
INSERT INTO equipos (dni, nombre, clasificacionGlobal, clasificacionNacional) VALUES ('58195956E', 'TEAM SOLOMILLO', 10, 1);
    /*JUGADORES*/
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('82957696P', 'JUNGLER', SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('27618290M', 'MIDLANER', SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('66987933L', 'SUPPORT', SEC_OID_EQ.CURRVAL);
    /*ESTADISTICAS*/
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('82957696P', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticaslol (winRatePorCampeon, kdaPorCampeon) VALUES (35.00, 21.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('82957696P', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticaslol (winRatePorCampeon, kdaPorCampeon) VALUES (64.00, 18.50);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('27618290M', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticaslol (winRatePorCampeon, kdaPorCampeon) VALUES (59.00, 23.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('27618290M', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticaslol (winRatePorCampeon, kdaPorCampeon) VALUES (62.00, 20.50);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('66987933L', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticaslol (winRatePorCampeon, kdaPorCampeon) VALUES (48.00, 17.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('66987933L', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticaslol (winRatePorCampeon, kdaPorCampeon) VALUES (66.00, 10.50);


INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('58195956E', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('53318859Y', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('85802300H', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('53318859Y', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('97184318A', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('85802300H', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
    /*COACH*/
INSERT INTO coachs (dni) VALUES ('53318859Y');
INSERT INTO entrena (dni, oid_eq) VALUES ('53318859Y', SEC_OID_EQ.CURRVAL);
    /*ANALISTA*/
INSERT INTO analistas (dni) VALUES ('85802300H');
INSERT INTO analiza (dni, oid_eq) VALUES ('85802300H', SEC_OID_EQ.CURRVAL);

/*CSGO*/
    /*EMPLEADOS*/
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('07222046T', 'MARC VELA MIRON', 26, 990831770, 'Jugador', 'CSGO', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'Y', 15, 'jsbach@yahoo.com', 'Grafica', 'TW:Grafica IG:Grafica', 'Rúa de San Pedro, 34', 'M');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('81976015J', 'FRANCISCO JAVIER GIRON TORRE', 17, 128235651, 'Jugador', 'CSGO', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'N', 15, 'tangsh@me.com', 'Katara300', 'TW:Katara300 IG:Katara300', 'Inglaterra, 77', 'S');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('17671904S', 'MARIA ROSA VALLS CUARTERO', 16, 419153571, 'Jugador', 'CSGO', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Y', 15, 'yxing@yahoo.com', 'AisTim', 'TW:AisTim IG:AisTim', 'Ctra. Beas-Cortijos Nuevos, 42', 'L');        
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('64181484F', 'MIGUEL URRUTIA GALVEZ', 23, 352260728, 'Manager', 'CSGO', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'Y', 15, 'ullman@hotmail.com', 'Spede', 'TW:Spede IG:Spede', 'Antonio Vázquez, 32', 'L');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('51649795Y', 'MARIA MAR BARRIENTOS BAJO', 31, 786699242, 'Coach', 'CSGO', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'Y', 15, 'skajan@aol.com', 'RealShot', 'TW:RealShot IG:RealShot', 'Puerto Lugar, 16', 'XL');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('23144206L', 'CESAR MACIAS NOGUES', 27, 663254876, 'Analista', 'CSGO', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Y', 15, 'thomasj@icloud.com', 'xLOVELESx', 'TW:xLOVELESx IG:xLOVELESx', 'Rosa de los Vientos, 85', 'L');
    /*MANAGER*/
INSERT INTO managers (dni) VALUES ('64181484F');
    /*EQUIPO*/
INSERT INTO equipos (dni, nombre, clasificacionGlobal, clasificacionNacional) VALUES ('64181484F', 'SPECIAL OPS SP', 500, 87);
    /*JUGADORES*/
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('07222046T', NULL, SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, nombreTutor, dniTutor, telefonoTutor, correoTutor, OID_eq) VALUES ('81976015J', NULL, 'JOSE ANTONIO SEGOVIA CARRETERO', '38915606C', 113842060, 'kronvold@hotmail.com', SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, nombreTutor, dniTutor, telefonoTutor, correoTutor, OID_eq) VALUES ('17671904S', NULL, 'ADRIAN ESTEVEZ SEDANO', '98153873Q', 750707863, 'nwiger@hotmail.com', SEC_OID_EQ.CURRVAL);
    /*ESTADISTICAS*/
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('07222046T', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticascsgo (winRate, kda) VALUES (35.00, 21.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('07222046T', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticascsgo (winRate, kda) VALUES (64.00, 18.50);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('81976015J', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticascsgo (winRate, kda) VALUES (59.00, 23.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('81976015J', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticascsgo (winRate, kda) VALUES (62.00, 20.50);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('17671904S', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticascsgo (winRate, kda) VALUES (48.00, 17.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('17671904S', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticascsgo (winRate, kda) VALUES (66.00, 10.50);


INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('64181484F', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('51649795Y', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('23144206L', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('64181484F', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('51649795Y', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('23144206L', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
    /*COACH*/
INSERT INTO coachs (dni) VALUES ('51649795Y');
INSERT INTO entrena (dni, oid_eq) VALUES ('51649795Y', SEC_OID_EQ.CURRVAL);
    /*ANALISTA*/
INSERT INTO analistas (dni) VALUES ('23144206L');
INSERT INTO analiza (dni, oid_eq) VALUES ('23144206L', SEC_OID_EQ.CURRVAL);

/*FORTNITE*/
    /*EMPLEADOS*/
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('41249763E', 'MARINA UBEDA DEL RIO', 20, 706859852, 'Jugador', 'FORTNITE', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'N', 15, 'kdawson@me.com', 'BoGuS', 'TW:BoGuS IG:BoGuS', 'C/ Cañada del Rosal, 99', 'M');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('61264567L', 'JOSE MANUEL VICARIO JAREÑO', 21, 831345951, 'Jugador', 'FORTNITE', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'Y', 15, 'drjlaw@icloud.com', 'BoGuS', 'TW:Rafoella IG:Rafoella', 'Avda. Rio Nalon, 76', 'S');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('75011105D', 'NICOLAS CARREÑO NORIEGA', 18, 386080188, 'Jugador', 'FORTNITE', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'N', 15, 'johndo@verizon.net', 'MSanyoken', 'TW:MSanyoken IG:MSanyoken', 'Fuente del Gallo, 38', 'L');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('42878163E', 'PATRICIA UGALDE NEVADO', 25, 274390509, 'Manager', 'FORTNITE', TO_DATE('2017-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), 'Y', 30, 'speeves@me.com', 'Dashulka', 'TW:Dashulka IG:Dashulka', 'Estrela, 79', 'L');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('27917312G', 'MARIANO JARQUE CONSTANTIN', 27, 131400865, 'Coach', 'FORTNITE', TO_DATE('2018-05-14', 'YYYY-MM-DD'), TO_DATE('2022-05-14', 'YYYY-MM-DD'), 'Y', 30, 'raines@aol.com', 'Lanai', 'TW:Lanai IG:Lanai', 'Bellavista, 28', 'XL');
INSERT INTO empleados (dni, nombre, edad, telefono, tipoempleado, seccion, fechaInicioContrato, fechaFinContrato, experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta) VALUES ('98020096F', 'CELIA PADIN MONREAL', 30, 469372706, 'Analista', 'FORTNITE', TO_DATE('2019-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Y', 30, 'matsn@mac.com', 'Liberalis', 'TW:Liberalis IG:Liberalis', 'Extramuros, 19', 'L');
    /*MANAGER*/
INSERT INTO managers (dni) VALUES ('42878163E');
    /*EQUIPO*/
INSERT INTO equipos (dni, nombre, clasificacionGlobal, clasificacionNacional) VALUES ('42878163E', 'DEFAULTDANCE2WIN', 328, 12);
    /*JUGADORES*/
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('41249763E', NULL, SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('61264567L', NULL, SEC_OID_EQ.CURRVAL);
INSERT INTO jugadores (dni, posicionesPrincipales, OID_eq) VALUES ('75011105D', NULL, SEC_OID_EQ.CURRVAL);
    /*ESTADISTICAS*/
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('41249763E', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfortnite (horasStreaming, kda) VALUES (10, 21.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('41249763E', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfortnite (horasStreaming, kda) VALUES (15, 18.50);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('61264567L', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfortnite (horasStreaming, kda) VALUES (9, 23.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('61264567L', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfortnite (horasStreaming, kda) VALUES (14, 20.50);

INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('75011105D', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfortnite (horasStreaming, kda) VALUES (12, 17.50);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('75011105D', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticasfortnite (horasStreaming, kda) VALUES (15, 10.50);


INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('42878163E', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('27917312G', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('98020096F', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('42878163E', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('27917312G', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
INSERT INTO estadisticas (dni, mes, horasTrabajadas) VALUES ('98020096F', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 40);
    /*COACH*/
INSERT INTO coachs (dni) VALUES ('27917312G');
INSERT INTO entrena (dni, oid_eq) VALUES ('27917312G', SEC_OID_EQ.CURRVAL);
    /*ANALISTA*/
INSERT INTO analistas (dni) VALUES ('98020096F');
INSERT INTO analiza (dni, oid_eq) VALUES ('98020096F', SEC_OID_EQ.CURRVAL);

/*EQUIPOS RIVALES*/
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('VODAFONE GIANTS', 'TH3ANTONIO, LAMABEAR, ATTILA', 'Y');
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('MOVISTAR RIDERS', 'ELYOYA, JAVAAA, XICO', 'Y');
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('MAD LIONS MADRID', 'WERLYB, FLAKKED, KOLDO', 'Y');
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('G2 ARTIC', 'OSCARININ, SUPA, NASSER', 'Y');
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('X6TENCE', 'SILER, KAMI, DUALL', 'Y');
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('FNATIC', 'KRIMZ, FLUSHA, JW', 'Y');
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('CLOUD 9', 'MIXWELL, AUTIMATIC, RUSH', 'Y');
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('TEAM HERETICS', 'KANARITO, CLOUD, KAIRI', 'Y');
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('NINJAS IN PYJAMAS', 'F0REST, LEKR0, DENNIS', 'Y');
INSERT INTO equiposrivales (nombre, jugadores, logo) VALUES ('ASTRALIS', 'MAGISK, DUPREEH, DEV1CE', 'Y');

/*LIGAS&PARTIDOS*/
INSERT INTO ligas (nombre, importePremio) VALUES ('SUPER LIGA ORANGE 2020', NULL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (1, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (2, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (3, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (4, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (5, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (6, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (1, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (2, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (3, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (4, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (5, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (6, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (7, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (8, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (9, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (10, sec_oid_lg.CURRVAL);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Derrota', 'Liga', 'Brawl Stars', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'Davon, laki10770, Gross600', sec_oid_lg.CURRVAL);
INSERT INTO partidosbrawl (mapa, modo, brawlers, puntuacion) VALUES ('Area analogica', 'Atrapa Gemas', 'Shelly, Nita, Colt', '0-3');
INSERT INTO juega (oid_eq, oid_pt) VALUES (2, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 1);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Brawl Stars', TO_DATE('2020-07-06', 'YYYY-MM-DD'), 'Davon, laki10770, Gross600', sec_oid_lg.CURRVAL);
INSERT INTO partidosbrawl (mapa, modo, brawlers, puntuacion) VALUES (NULL, 'Atrapa Gemas', NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (2, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 2);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Brawl Stars', TO_DATE('2020-03-06', 'YYYY-MM-DD'), 'Davon, laki10770, Gross600', sec_oid_lg.CURRVAL);
INSERT INTO partidosbrawl (mapa, modo, brawlers, puntuacion) VALUES ('Fuerte de la Muerte', 'Atrapa Gemas', 'Shelly, Nita, Colt', '3-0');
INSERT INTO juega (oid_eq, oid_pt) VALUES (2, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 3);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Derrota', 'Liga', 'Clash Royale', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'HaRKbOHL, tUrgaDom, Toredo', sec_oid_lg.CURRVAL);
INSERT INTO partidosclashroyale (puntuacion, baneos, mazos, modo) VALUES (3, 'PEKKA, princesa', 'agrro - hechizos', '1vs1');
INSERT INTO juega (oid_eq, oid_pt) VALUES (1, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 4);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Clash Royale', TO_DATE('2020-07-06', 'YYYY-MM-DD'), 'HaRKbOHL, tUrgaDom, Toredo', sec_oid_lg.CURRVAL);
INSERT INTO partidosclashroyale (puntuacion, baneos, mazos, modo) VALUES (3, 'PEKKA, princesa', 'agrro - hechizos', '1vs1');
INSERT INTO juega (oid_eq, oid_pt) VALUES (1, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 5);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Clash Royale', TO_DATE('2020-03-06', 'YYYY-MM-DD'), 'HaRKbOHL, tUrgaDom, Toredo', sec_oid_lg.CURRVAL);
INSERT INTO partidosclashroyale (puntuacion, baneos, mazos, modo) VALUES (2, 'PEKKA, princesa', 'agrro - hechizos', '1vs1');
INSERT INTO juega (oid_eq, oid_pt) VALUES (1, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 6);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Derrota', 'Liga', 'Fortnite', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'BoGuS, BoGuS, MSanyoken', sec_oid_lg.CURRVAL);
INSERT INTO partidosfortnite (bajas, tipo, posicion, puntos) VALUES (9, 'SOLO', 5, 20);
INSERT INTO juega (oid_eq, oid_pt) VALUES (6, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 7);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Fortnite', TO_DATE('2020-07-06', 'YYYY-MM-DD'), 'BoGuS, BoGuS, MSanyoken', sec_oid_lg.CURRVAL);
INSERT INTO partidosfortnite (bajas, tipo, posicion, puntos) VALUES (NULL, 'SOLO', NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (6, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 8);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fortnite', TO_DATE('2020-03-06', 'YYYY-MM-DD'), 'BoGuS, BoGuS, MSanyoken', sec_oid_lg.CURRVAL);
INSERT INTO partidosfortnite (bajas, tipo, posicion, puntos) VALUES (20, 'SOLO', 1, 50);
INSERT INTO juega (oid_eq, oid_pt) VALUES (6, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 9);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Derrota', 'Liga', 'CSGO', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'Grafica, Katara300, AisTim', sec_oid_lg.CURRVAL);
INSERT INTO partidoscsgo (mapa, puntuacion, comprasPorRonda) VALUES ('dust2', 10, 4);
INSERT INTO juega (oid_eq, oid_pt) VALUES (5, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 10);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'CSGO', TO_DATE('2020-07-06', 'YYYY-MM-DD'), 'Grafica, Katara300, AisTim', sec_oid_lg.CURRVAL);
INSERT INTO partidoscsgo (mapa, puntuacion, comprasPorRonda) VALUES (NULL, NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (5, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 1);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'CSGO', TO_DATE('2020-03-06', 'YYYY-MM-DD'), 'Grafica, Katara300, AisTim', sec_oid_lg.CURRVAL);
INSERT INTO partidoscsgo (mapa, puntuacion, comprasPorRonda) VALUES ('cobblestone', 16, 4);
INSERT INTO juega (oid_eq, oid_pt) VALUES (5, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 2);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Derrota', 'Liga', 'LOL', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'Rolleks, Siasons, MeL692', sec_oid_lg.CURRVAL);
INSERT INTO partidoslol (kda, campeones, baneos, objetivos, builds) VALUES (05.54, 'ANNIE, CAMILLE, OLAF, IVERN, RENGAR, NASUS, FIZZ, JANNA, VAYNE, JINX', 'CAITLYN, LULU, URGOT, ANIVIA, TEEMO, FIORA, ASHE, BARDO, SYNDRA, ZED', 5, 'mana, AD, AP, tanque armor, tanque MR, AP, AD, AD, tanque hibrido, AD');
INSERT INTO juega (oid_eq, oid_pt) VALUES (4, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 3);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'LOL', TO_DATE('2020-07-06', 'YYYY-MM-DD'), 'Rolleks, Siasons, MeL692', sec_oid_lg.CURRVAL);
INSERT INTO partidoslol (kda, campeones, baneos, objetivos, builds) VALUES (NULL, NULL, NULL, NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (4, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 4);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'LOL', TO_DATE('2020-03-06', 'YYYY-MM-DD'), 'Rolleks, Siasons, MeL692', sec_oid_lg.CURRVAL);
INSERT INTO partidoslol (kda, campeones, baneos, objetivos, builds) VALUES (15.03, 'ANNIE, CAMILLE, OLAF, IVERN, RENGAR, NASUS, FIZZ, JANNA, VAYNE, JINX', 'CAITLYN, LULU, URGOT, ANIVIA, TEEMO, FIORA, ASHE, BARDO, SYNDRA, ZED', 6, 'mana, AD, AP, tanque armor, tanque MR, AP, AD, AD, tanque hibrido, AD');
INSERT INTO juega (oid_eq, oid_pt) VALUES (4, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 5);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Derrota', 'Liga', 'Fifa', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'KetyBree, Milicenta, DriadaHIL', sec_oid_lg.CURRVAL);
INSERT INTO partidosfifa (equiposFutbol, goles) VALUES ('Madrid-Barcelona', 7);
INSERT INTO juega (oid_eq, oid_pt) VALUES (3, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 6);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Fifa', TO_DATE('2020-07-06', 'YYYY-MM-DD'), 'KetyBree, Milicenta, DriadaHIL', sec_oid_lg.CURRVAL);
INSERT INTO partidosfifa (equiposFutbol, goles) VALUES (NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (3, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 7);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fifa', TO_DATE('2020-03-06', 'YYYY-MM-DD'), 'KetyBree, Milicenta, DriadaHIL', sec_oid_lg.CURRVAL);
INSERT INTO partidosfifa (equiposFutbol, goles) VALUES ('Sevilla-Barcelona', 13);
INSERT INTO juega (oid_eq, oid_pt) VALUES (3, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 8);

INSERT INTO ligas (nombre, posicion, importePremio, fechaCobroPremio) VALUES ('LIGA TORNILLO 2020', 1, 2000, TO_DATE('2020-06-27', 'YYYY-MM-DD'));
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (1, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (2, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (3, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (4, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (5, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (6, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (1, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (2, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (3, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (4, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (5, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (6, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (7, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (8, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (9, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (10, sec_oid_lg.CURRVAL);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Brawl Stars', TO_DATE('2020-03-12', 'YYYY-MM-DD'), 'Davon, laki10770, Gross600', sec_oid_lg.CURRVAL);
INSERT INTO partidosbrawl (mapa, modo, brawlers, puntuacion) VALUES ('Area analogica', 'Atrapa Gemas', 'Shelly, Nita, Colt', '3-0');
INSERT INTO juega (oid_eq, oid_pt) VALUES (2, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 1);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Brawl Stars', TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'Davon, laki10770, Gross600', sec_oid_lg.CURRVAL);
INSERT INTO partidosbrawl (mapa, modo, brawlers, puntuacion) VALUES ('Sala de ocio', 'Atrapa Gemas', 'Shelly, Nita, Colt', '10-5');
INSERT INTO juega (oid_eq, oid_pt) VALUES (2, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 2);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Brawl Stars', TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'Davon, laki10770, Gross600', sec_oid_lg.CURRVAL);
INSERT INTO partidosbrawl (mapa, modo, brawlers, puntuacion) VALUES ('Fuerte de la Muerte', 'Atrapa Gemas', 'Shelly, Nita, Colt', '3-0');
INSERT INTO juega (oid_eq, oid_pt) VALUES (2, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 3);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Clash Royale', TO_DATE('2020-03-12', 'YYYY-MM-DD'), 'HaRKbOHL, tUrgaDom, Toredo', sec_oid_lg.CURRVAL);
INSERT INTO partidosclashroyale (puntuacion, baneos, mazos, modo) VALUES (3, 'PEKKA, princesa', 'agrro - hechizos', '2vs2');
INSERT INTO juega (oid_eq, oid_pt) VALUES (1, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 4);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Clash Royale', TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'HaRKbOHL, tUrgaDom, Toredo', sec_oid_lg.CURRVAL);
INSERT INTO partidosclashroyale (puntuacion, baneos, mazos, modo) VALUES (3, 'PEKKA, princesa', 'agrro - hechizos', '2vs2');
INSERT INTO juega (oid_eq, oid_pt) VALUES (1, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 5);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Clash Royale', TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'HaRKbOHL, tUrgaDom, Toredo', sec_oid_lg.CURRVAL);
INSERT INTO partidosclashroyale (puntuacion, baneos, mazos, modo) VALUES (3, 'PEKKA, princesa', 'agrro - hechizos', '2vs2');
INSERT INTO juega (oid_eq, oid_pt) VALUES (1, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 6);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fortnite', TO_DATE('2020-03-12', 'YYYY-MM-DD'), 'BoGuS, BoGuS, MSanyoken', sec_oid_lg.CURRVAL);
INSERT INTO partidosfortnite (bajas, tipo, posicion, puntos) VALUES (20, 'SOLO', 1, 50);
INSERT INTO juega (oid_eq, oid_pt) VALUES (6, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 7);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fortnite', TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'BoGuS, BoGuS, MSanyoken', sec_oid_lg.CURRVAL);
INSERT INTO partidosfortnite (bajas, tipo, posicion, puntos) VALUES (16, 'SOLO', 1, 45);
INSERT INTO juega (oid_eq, oid_pt) VALUES (6, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 8);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fortnite', TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'BoGuS, BoGuS, MSanyoken', sec_oid_lg.CURRVAL);
INSERT INTO partidosfortnite (bajas, tipo, posicion, puntos) VALUES (10, 'SOLO', 1, 40);
INSERT INTO juega (oid_eq, oid_pt) VALUES (6, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 9);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'CSGO', TO_DATE('2020-03-12', 'YYYY-MM-DD'), 'Grafica, Katara300, AisTim', sec_oid_lg.CURRVAL);
INSERT INTO partidoscsgo (mapa, puntuacion, comprasPorRonda) VALUES ('dust2', 16, 4);
INSERT INTO juega (oid_eq, oid_pt) VALUES (5, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 10);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'CSGO', TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'Grafica, Katara300, AisTim', sec_oid_lg.CURRVAL);
INSERT INTO partidoscsgo (mapa, puntuacion, comprasPorRonda) VALUES ('inferno', 16, 4);
INSERT INTO juega (oid_eq, oid_pt) VALUES (5, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 1);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'CSGO', TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'Grafica, Katara300, AisTim', sec_oid_lg.CURRVAL);
INSERT INTO partidoscsgo (mapa, puntuacion, comprasPorRonda) VALUES ('cobblestone', 16, 4);
INSERT INTO juega (oid_eq, oid_pt) VALUES (5, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 2);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'LOL', TO_DATE('2020-03-12', 'YYYY-MM-DD'), 'Rolleks, Siasons, MeL692', sec_oid_lg.CURRVAL);
INSERT INTO partidoslol (kda, campeones, baneos, objetivos, builds) VALUES (10.54, 'ANNIE, CAMILLE, OLAF, IVERN, RENGAR, NASUS, FIZZ, JANNA, VAYNE, JINX', 'CAITLYN, LULU, URGOT, ANIVIA, TEEMO, FIORA, ASHE, BARDO, SYNDRA, ZED', 5, 'mana, AD, AP, tanque armor, tanque MR, AP, AD, AD, tanque hibrido, AD');
INSERT INTO juega (oid_eq, oid_pt) VALUES (4, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 3);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'LOL', TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'Rolleks, Siasons, MeL692', sec_oid_lg.CURRVAL);
INSERT INTO partidoslol (kda, campeones, baneos, objetivos, builds) VALUES (20.00, 'ANNIE, CAMILLE, OLAF, IVERN, RENGAR, NASUS, FIZZ, JANNA, VAYNE, JINX', 'CAITLYN, LULU, URGOT, ANIVIA, TEEMO, FIORA, ASHE, BARDO, SYNDRA, ZED', 4, 'mana, AD, AP, tanque armor, tanque MR, AP, AD, AD, tanque hibrido, AD');
INSERT INTO juega (oid_eq, oid_pt) VALUES (4, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 4);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'LOL', TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'Rolleks, Siasons, MeL692', sec_oid_lg.CURRVAL);
INSERT INTO partidoslol (kda, campeones, baneos, objetivos, builds) VALUES (08.83, 'ANNIE, CAMILLE, OLAF, IVERN, RENGAR, NASUS, FIZZ, JANNA, VAYNE, JINX', 'CAITLYN, LULU, URGOT, ANIVIA, TEEMO, FIORA, ASHE, BARDO, SYNDRA, ZED', 6, 'mana, AD, AP, tanque armor, tanque MR, AP, AD, AD, tanque hibrido, AD');
INSERT INTO juega (oid_eq, oid_pt) VALUES (4, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 5);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fifa', TO_DATE('2020-03-12', 'YYYY-MM-DD'), 'KetyBree, Milicenta, DriadaHIL', sec_oid_lg.CURRVAL);
INSERT INTO partidosfifa (equiposFutbol, goles) VALUES ('Madrid-Barcelona', 10);
INSERT INTO juega (oid_eq, oid_pt) VALUES (3, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 6);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fifa', TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'KetyBree, Milicenta, DriadaHIL', sec_oid_lg.CURRVAL);
INSERT INTO partidosfifa (equiposFutbol, goles) VALUES ('Madrid-Betis', 13);
INSERT INTO juega (oid_eq, oid_pt) VALUES (3, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 7);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fifa', TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'KetyBree, Milicenta, DriadaHIL', sec_oid_lg.CURRVAL);
INSERT INTO partidosfifa (equiposFutbol, goles) VALUES ('Sevilla-Barcelona', 7);
INSERT INTO juega (oid_eq, oid_pt) VALUES (3, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 8);

INSERT INTO ligas (nombre, importePremio) VALUES ('ESL PRO LEAGUE 2020', NULL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (1, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (2, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (3, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (4, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (5, sec_oid_lg.CURRVAL);
INSERT INTO compiteen (oid_eq, oid_lg) VALUES (6, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (1, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (2, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (3, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (4, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (5, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (6, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (7, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (8, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (9, sec_oid_lg.CURRVAL);
INSERT INTO participaen (oid_er, oid_lg) VALUES (10, sec_oid_lg.CURRVAL);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Brawl Stars', TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'Davon, laki10770, Gross600', sec_oid_lg.CURRVAL);
INSERT INTO partidosbrawl (mapa, modo, brawlers, puntuacion) VALUES (NULL, 'Atrapa Gemas', NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (2, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 1);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Brawl Stars', TO_DATE('2020-10-06', 'YYYY-MM-DD'), 'Davon, laki10770, Gross600', sec_oid_lg.CURRVAL);
INSERT INTO partidosbrawl (mapa, modo, brawlers, puntuacion) VALUES (NULL, 'Atrapa Gemas', NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (2, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 2);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Brawl Stars', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'Davon, laki10770, Gross600', sec_oid_lg.CURRVAL);
INSERT INTO partidosbrawl (mapa, modo, brawlers, puntuacion) VALUES ('Fuerte de la Muerte', 'Atrapa Gemas', 'Shelly, Nita, Colt', '3-0');
INSERT INTO juega (oid_eq, oid_pt) VALUES (2, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 3);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Clash Royale', TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'HaRKbOHL, tUrgaDom, Toredo', sec_oid_lg.CURRVAL);
INSERT INTO partidosclashroyale (puntuacion, baneos, mazos, modo) VALUES (NULL, NULL, NULL, '2vs2');
INSERT INTO juega (oid_eq, oid_pt) VALUES (1, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 4);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Clash Royale', TO_DATE('2020-10-06', 'YYYY-MM-DD'), 'HaRKbOHL, tUrgaDom, Toredo', sec_oid_lg.CURRVAL);
INSERT INTO partidosclashroyale (puntuacion, baneos, mazos, modo) VALUES (NULL, NULL, NULL, '2vs2');
INSERT INTO juega (oid_eq, oid_pt) VALUES (1, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 5);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Clash Royale', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'HaRKbOHL, tUrgaDom, Toredo', sec_oid_lg.CURRVAL);
INSERT INTO partidosclashroyale (puntuacion, baneos, mazos, modo) VALUES (3, 'PEKKA, princesa', 'agrro - hechizos', '2vs2');
INSERT INTO juega (oid_eq, oid_pt) VALUES (1, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 6);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Fortnite', TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'BoGuS, BoGuS, MSanyoken', sec_oid_lg.CURRVAL);
INSERT INTO partidosfortnite (bajas, tipo, posicion, puntos) VALUES (NULL, 'DUO', NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (3, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 7);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Fortnite', TO_DATE('2020-10-06', 'YYYY-MM-DD'), 'BoGuS, BoGuS, MSanyoken', sec_oid_lg.CURRVAL);
INSERT INTO partidosfortnite (bajas, tipo, posicion, puntos) VALUES (NULL, 'DUO', NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (3, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 8);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fortnite', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'BoGuS, BoGuS, MSanyoken', sec_oid_lg.CURRVAL);
INSERT INTO partidosfortnite (bajas, tipo, posicion, puntos) VALUES (20, 'SOLO', 1, 50);
INSERT INTO juega (oid_eq, oid_pt) VALUES (3, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 9);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'CSGO', TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'Grafica, Katara300, AisTim', sec_oid_lg.CURRVAL);
INSERT INTO partidoscsgo (mapa, puntuacion, comprasPorRonda) VALUES (NULL, NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (5, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 10);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'CSGO', TO_DATE('2020-10-06', 'YYYY-MM-DD'), 'Grafica, Katara300, AisTim', sec_oid_lg.CURRVAL);
INSERT INTO partidoscsgo (mapa, puntuacion, comprasPorRonda) VALUES (NULL, NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (5, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 1);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'CSGO', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'Grafica, Katara300, AisTim', sec_oid_lg.CURRVAL);
INSERT INTO partidoscsgo (mapa, puntuacion, comprasPorRonda) VALUES ('dust2', 16, 4);
INSERT INTO juega (oid_eq, oid_pt) VALUES (5, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 2);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'LOL', TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'Rolleks, Siasons, MeL692', sec_oid_lg.CURRVAL);
INSERT INTO partidoslol (kda, campeones, baneos, objetivos, builds) VALUES (NULL, NULL, NULL, NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (4, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 3);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'LOL', TO_DATE('2020-10-06', 'YYYY-MM-DD'), 'Rolleks, Siasons, MeL692', sec_oid_lg.CURRVAL);
INSERT INTO partidoslol (kda, campeones, baneos, objetivos, builds) VALUES (NULL, NULL, NULL, NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (4, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 4);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'LOL', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'Rolleks, Siasons, MeL692', sec_oid_lg.CURRVAL);
INSERT INTO partidoslol (kda, campeones, baneos, objetivos, builds) VALUES (10.54, 'ANNIE, CAMILLE, OLAF, IVERN, RENGAR, NASUS, FIZZ, JANNA, VAYNE, JINX', 'CAITLYN, LULU, URGOT, ANIVIA, TEEMO, FIORA, ASHE, BARDO, SYNDRA, ZED', 5, 'mana, AD, AP, tanque armor, tanque MR, AP, AD, AD, tanque hibrido, AD');
INSERT INTO juega (oid_eq, oid_pt) VALUES (4, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 5);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Fifa', TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'KetyBree, Milicenta, DriadaHIL', sec_oid_lg.CURRVAL);
INSERT INTO partidosfifa (equiposFutbol, goles) VALUES (NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (6, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 6);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES (NULL, 'Liga', 'Fifa', TO_DATE('2020-10-06', 'YYYY-MM-DD'), 'KetyBree, Milicenta, DriadaHIL', sec_oid_lg.CURRVAL);
INSERT INTO partidosfifa (equiposFutbol, goles) VALUES (NULL, NULL);
INSERT INTO juega (oid_eq, oid_pt) VALUES (6, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 7);
INSERT INTO partidos (resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, oid_lg) VALUES ('Victoria', 'Liga', 'Fifa', TO_DATE('2020-05-06', 'YYYY-MM-DD'), 'KetyBree, Milicenta, DriadaHIL', sec_oid_lg.CURRVAL);
INSERT INTO partidosfifa (equiposFutbol, goles) VALUES ('Madrid-Barcelona',14);
INSERT INTO juega (oid_eq, oid_pt) VALUES (6, sec_oid_pt.CURRVAL);
INSERT INTO seenfrentaen (oid_pt, oid_er) VALUES (sec_oid_pt.CURRVAL, 8);

/*REDES SOCIALES*/
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Instagram', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 20000, 500000);
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Instagram', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 21500, 645000);
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Instagram', TO_DATE('2020-03-01', 'YYYY-MM-DD'), 21000, 550000);
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Instagram', TO_DATE('2020-04-01', 'YYYY-MM-DD'), 22000, 700000);
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Instagram', TO_DATE('2020-05-01', 'YYYY-MM-DD'), 25000, 1000000);
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Twitter', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 20000, 500000);
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Twitter', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 21500, 645000);
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Twitter', TO_DATE('2020-03-01', 'YYYY-MM-DD'), 21000, 550000);
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Twitter', TO_DATE('2020-04-01', 'YYYY-MM-DD'), 22000, 700000);
INSERT INTO redessociales (nombre, fecha, numeroSeguidores, interacciones) VALUES ('Twitter', TO_DATE('2020-05-01', 'YYYY-MM-DD'), 25000, 1000000);

/*EVENTOS*/
INSERT INTO eventos (oid_er, nombre, tipoEvento, fecha) VALUES (NULL, 'Pentakill de Rolleks', 'Jugada', TO_DATE('2020-04-06', 'YYYY-MM-DD'));
/*INSERT INTO publicaciones (oid_ev, fecha, disenoListo) VALUES (sec_oid_ev.CURRVAL, TO_DATE('2020-04-06', 'YYYY-MM-DD'), 'Y');*/
INSERT INTO eventos (oid_er, nombre, tipoEvento, fecha) VALUES (1, 'Partido de Brawl contra Vodafone Giants', 'Partido previsto', TO_DATE('2020-02-20', 'YYYY-MM-DD'));
/*INSERT INTO publicaciones (oid_ev, fecha, disenoListo) VALUES (sec_oid_ev.CURRVAL, TO_DATE('2020-02-01', 'YYYY-MM-DD'), 'Y');
INSERT INTO publicaciones (oid_ev, fecha, disenoListo) VALUES (sec_oid_ev.CURRVAL, TO_DATE('2020-02-10', 'YYYY-MM-DD'), 'Y');
INSERT INTO publicaciones (oid_ev, fecha, disenoListo) VALUES (sec_oid_ev.CURRVAL, TO_DATE('2020-02-19', 'YYYY-MM-DD'), 'Y');*/
INSERT INTO eventos (oid_er, nombre, tipoEvento, fecha) VALUES (NULL, 'Organizacion de eventos anuales', 'Informativa', TO_DATE('2020-07-06', 'YYYY-MM-DD'));
/*INSERT INTO publicaciones (oid_ev, fecha, disenoListo) VALUES (sec_oid_ev.CURRVAL, TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'Y');
INSERT INTO publicaciones (oid_ev, fecha, disenoListo) VALUES (sec_oid_ev.CURRVAL, TO_DATE('2020-02-01', 'YYYY-MM-DD'), 'Y');
INSERT INTO publicaciones (oid_ev, fecha, disenoListo) VALUES (sec_oid_ev.CURRVAL, TO_DATE('2020-03-01', 'YYYY-MM-DD'), 'Y');
INSERT INTO publicaciones (oid_ev, fecha, disenoListo) VALUES (sec_oid_ev.CURRVAL, TO_DATE('2020-04-01', 'YYYY-MM-DD'), 'Y');
INSERT INTO publicaciones (oid_ev, fecha, disenoListo) VALUES (sec_oid_ev.CURRVAL, TO_DATE('2020-05-01', 'YYYY-MM-DD'), 'Y');*/

/*RELACIONES*/
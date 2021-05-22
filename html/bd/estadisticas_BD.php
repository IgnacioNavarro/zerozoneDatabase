<?php

function borrarEstadistica($conexion, $oid) {
	$sql = "DELETE FROM ESTADISTICAS WHERE OID_ST =:id";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':id', $oid);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarEstadisticaCSGO($conexion, $dni, $mes, $horasTrabajadas, $winrate, $KDA) {
    
	$sql = "INSERT INTO ESTADISTICASCSGO(OID_PT, winrate, KDA)
    VALUES (:oid_pt, :winrate, :KDA)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEstadistica($conexion, $dni, $mes, $horasTrabajadas);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
        $stmt->bindParam(':winrate',$winrate);
        $stmt->bindParam(':KDA',$KDA);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarEstadisticaFortnite($conexion, $dni, $mes, $horasTrabajadas, $horasStreaming, $KDA) {
	$sql = "INSERT INTO ESTADISTICASFORTNITE(OID_ST, horasStreaming, KDA)
    VALUES (:oid_st, :horasStreaming, :KDA)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEstadistica($conexion, $dni, $mes, $horasTrabajadas);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_st',$oid);
        $stmt->bindParam(':horasStreaming',$horasStreaming);
        $stmt->bindParam(':KDA',$KDA);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarEstadisticaBrawl($conexion, $dni, $mes, $horasTrabajadas, $WRBrawler, $WRGlobal, $copas) {
    
	$sql = "INSERT INTO ESTADISTICASBRAWLSTARS(OID_ST, winRatePorBrawler, winRateGlobal, copas)
    VALUES (:oid_st, :WRBrawler, :WRGlobal, :copas)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEstadistica($conexion, $dni, $mes, $horasTrabajadas);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_st',$oid);
		$stmt->bindParam(':WRBrawler',$WRBrawler);
		$stmt->bindParam(':WRGlobal',$WRGlobal);
		$stmt->bindParam(':copas',$copas);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarEstadisticaLoL($conexion, $dni, $mes, $horasTrabajadas, $WRCampeon, $KDACampeon) {
    
	$sql = "INSERT INTO ESTADISTICASLOL(OID_ST, winRatePorCampeon, KDAPorCampeon)
    VALUES (:oid_st, :WRCampeon, :KDACampeon)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEstadistica($conexion, $dni, $mes, $horasTrabajadas);
        $oid = $conexion->lastInsertId();
		$stmt->bindParam(':oid_st',$oid);
		$stmt->bindParam(':WRCampeon',$WRCampeon);
		$stmt->bindParam(':KDACampeon',$KDACampeon);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarEstadisticaClash($conexion, $dni, $mes, $horasTrabajadas, $WRGlobal, $partidasMazo, $WRMazo, $hechizos) {
    
	$sql = "INSERT INTO ESTADISTICASCLASHROYALE(OID_ST, winRateGlobal, partidasPorMazo, winRatePorMazo, hechizos)
    VALUES (:oid_st, :WRGlobal, :partidasMazo, :WRMazo, :hechizos)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEstadistica($conexion, $dni, $mes, $horasTrabajadas);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_st',$oid);
		$stmt->bindParam(':WRGlobal',$WRGlobal);
		$stmt->bindParam(':partidasMazo',$partidasMazo);
		$stmt->bindParam(':WRMazo',$WRMazo);
        $stmt->bindParam(':hechizos',$hechizos);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarEstadisticaFifa($conexion, $dni, $mes, $horasTrabajadas, $WR, $golesPartido) {
    
	$sql = "INSERT INTO ESTADISTICASFIFA(OID_ST, winRate, golesPorPartido)
    VALUES (:oid_st, :WR, :golesPartido)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEstadistica($conexion, $dni, $mes, $horasTrabajadas);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_st',$oid);
		$stmt->bindParam(':WR',$WR);
		$stmt->bindParam(':golesPartido',$golesPartido);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

//Solo debe ser llamada por otra funcion de insertar estadistica
function insertarEstadistica($conexion, $dni, $mes, $horasTrabajadas) {
	$sql = "INSERT INTO PARTIDOS(dni, mes, horasTrabajadas)
        VALUES (:dni, :mes, :horasTrabajadas)";
	$stmt = $conexion->prepare($sql);
    $stmt->bindParam(':dni',$dni);
    $stmt->bindParam(':mes',$mes);
    $stmt->bindParam(':horasTrabajadas',$horasTrabajadas);
    $stmt->execute();
}



?>
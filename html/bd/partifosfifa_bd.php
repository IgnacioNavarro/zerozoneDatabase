<?php

function consultarPartidoFifa($conexion) {
	$sql = "SELECT * FROM PARTIDOSFIFA";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
}

function borrarPartidoFifa($conexion, $oid) {
	$sql = "DELETE FROM PARTIDOSFIFA WHERE OID_PT =:id";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':id', $oid);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}

function insertarPartidoFifa($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $equipos, $goles) {
    
	$sql = "INSERT INTO PARTIDOSFIFA(OID_PT, equiposFutbol, goles)
    VALUES (:oid_pt, :equipos, :goles)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "Fifa", $fecha, $jugadores, $liga);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
		$stmt->bindParam(':equipos',$equipos);
		$stmt->bindParam(':goles',$goles);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function actualizarPartidoFifa($conexion,$oid, $resultado, $tipo, $fecha, $jugadores, $liga, $equipos, $goles) {
    
	$sql = "UPDATE INTO PARTIDOSFIFA( equiposFutbol, goles)
    VALUES ( :equipos, :goles) WHERE OID_PT = (:id)";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':equipos',$equipos);
		$stmt->bindParam(':goles',$goles);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

//Solo debe ser llamada por otra funcion de insertar partido
function insertarPartido($conexion, $resultado, $tipo, $videojuego, $fecha, $jugadores, $liga) {
	$sql = "INSERT INTO PARTIDOS(resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, OID_LG)
		VALUES (:resultado, :tipo, :videojuego, :fecha, :jugadores, :liga)";
	$stmt = $conexion->prepare($sql);
	try{
    $stmt->bindParam(':resultado',$resultado);
    $stmt->bindParam(':tipo',$tipo);
    $stmt->bindParam(':videojuego',$videojuego);
    $stmt->bindParam(':fecha',$fecha);
    $stmt->bindParam(':jugadores',$jugadores);
    $stmt->bindParam(':liga',$liga);
	$stmt->execute();}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");

	}
}

function actualizarPartido($conexion,$oid_pt, $resultado, $tipo, $videojuego, $fecha, $jugadores, $liga) {
	$sql = "UPDATE INTO PARTIDOS(resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, OID_LG)
        VALUES (:resultado, :tipo, :videojuego, :fecha, :jugadores, :liga) WHERE oid_pt= (:id)"  ;
	$stmt = $conexion->prepare($sql);
	try{
	$stmt->bindParam(':resultado',$resultado);
    $stmt->bindParam(':tipo',$tipo);
    $stmt->bindParam(':videojuego',$videojuego);
    $stmt->bindParam(':fecha',$fecha);
    $stmt->bindParam(':jugadores',$jugadores);
    $stmt->bindParam(':liga',$liga);
	$stmt->execute();
}
catch (PDOException $e) {
	$_SESSION['excepcion'] = $e->GetMessage();
	header("Location: ../excepcion.php");
	}
}

?>
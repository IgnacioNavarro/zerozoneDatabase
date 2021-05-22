<?php

function consultarPartidoBrawl($conexion) {
	$sql = "SELECT * FROM PARTIDOSBRAWL";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
}

function borrarPartidoBrawl($conexion, $oid) {
	$sql = "DELETE FROM PARTIDOSBRAWL WHERE OID_PT =:id";
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

function insertarPartidoBrawl($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $mapa, $modo, $brawlers, $puntuacion) {
    
	$sql = "INSERT INTO PARTIDOSBRAWL(OID_PT, mapa, modo, brawlers, puntuacion)
    VALUES (:oid_pt, :mapa, :modo, :brawlers, :puntuacion)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "Brawl Stars", $fecha, $jugadores, $liga);
        $oid = $pdo->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
		$stmt->bindParam(':mapa',$mapa);
		$stmt->bindParam(':modo',$modo);
		$stmt->bindParam(':brawlers',$brawlers);
        $stmt->bindParam(':puntuacion',$puntuacion);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}


function actualizarPartidoBrawl($conexion, $oid, $resultado, $tipo, $fecha, $jugadores, $liga, $mapa, $modo, $brawlers, $puntuacion) {
	$sql = "UPDATE INTO PARTIDOSBRAWL( mapa, modo, brawlers, puntuacion) VALUES (:mapa, :modo, :brawlers, :puntuacion)
		WHERE OID_PT = (:id)";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':mapa',$mapa);
		$stmt->bindParam(':modo',$modo);
		$stmt->bindParam(':brawlers',$brawlers);
        $stmt->bindParam(':puntuacion',$puntuacion);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
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
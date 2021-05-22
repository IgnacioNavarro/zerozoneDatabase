<?php

function consultarPartidoClash($conexion) {
	$sql = "SELECT * FROM PARTIDOSCLASHROYALE";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
}

function borrarPartidoClash($conexion, $oid) {
	$sql = "DELETE FROM PARTIDOSCLASHROYALE WHERE OID_PT =:id";
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

function insertarPartidoClash($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $puntuacion, $baneos, $mazos, $modo) {
    
	$sql = "INSERT INTO PARTIDOSCLASHROYALE(OID_PT, puntuacion, baneos, mazos, modo)
    VALUES (:oid_pt, :puntuacion, :baneos, :mazos, :modo)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "Clash Royale", $fecha, $jugadores, $liga);
        $oid = $pdo->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
		$stmt->bindParam(':puntuacion',$puntuacion);
		$stmt->bindParam(':baneos',$baneos);
		$stmt->bindParam(':mazos',$mazos);
        $stmt->bindParam(':modo',$modo);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function actualizarPartidoClash($conexion, $oid,  $resultado, $tipo, $fecha, $jugadores, $liga, $puntuacion, $baneos, $mazos, $modo) {
	$sql = "UPDATE INTO PARTIDOSCLASHROYALE(puntuacion, baneos, mazos, modo) VALUES (:puntuacion, :baneos, :mazos, :modo)
		WHERE OID_PT = (:id)";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':puntuacion',$puntuacion);
		$stmt->bindParam(':baneos',$baneos);
		$stmt->bindParam(':mazos',$mazos);
        $stmt->bindParam(':modo',$modo);
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
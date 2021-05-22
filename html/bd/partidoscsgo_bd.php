<?php

function consultarPartidosCSGO($conexion) {
	$sql = "SELECT * FROM PARTIDOSCSGO";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
}
function borrarPartidoCSGO($conexion, $oid) {
	$sql = "DELETE FROM PARTIDOSCSGO WHERE OID_PT =:id"; 
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

function insertarPartidoCSGO($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $mapa, $puntuacion, $compras) {
    
	$sql = "INSERT INTO PARTIDOSCSGO(OID_PT, mapa, puntuacion, compras)
	VALUES (:oid_pt, :mapa, :puntuacion, :compras) WHERE OID_PT = (:id)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "CSGO", $fecha, $jugadores, $liga);
        $oid = $pdo->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
        $stmt->bindParam(':mapa',$mapa);
        $stmt->bindParam(':puntuacion',$puntuacion);
        $stmt->bindParam(':compras',$compras);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function actualizarPartidoCSGO($conexion,$oid, $resultado, $tipo, $fecha, $jugadores, $liga, $mapa, $puntuacion, $compras) {
    
	$sql = "UPDATE INTO PARTIDOSCSGO( mapa, puntuacion, compras) VALUES (:mapa, :puntuacion, :compras)
        WHERE OID_PT = (:id)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':mapa',$mapa);
        $stmt->bindParam(':puntuacion',$puntuacion);
        $stmt->bindParam(':compras',$compras);
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
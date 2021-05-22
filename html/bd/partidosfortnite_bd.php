<?php

function consultarPartidoFortnite($conexion) {
	$sql = "SELECT * FROM PARTIDOSFORTNITE";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
}

function borrarPartidoFortnite($conexion, $oid) {
	$sql = "DELETE FROM PARTIDOSFORTNITE WHERE OID_PT =:id";
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

function insertarPartidoFortnite($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $bajas, $tipo, $posicion, $puntos) {
	$sql = "INSERT INTO PARTIDOSFORTNITE(OID_PT, bajas, tipo, posicion, puntos)
    VALUES (:oid_pt, :bajas, :tipo, :posicion, :puntos)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "Fortnite", $fecha, $jugadores, $liga);
        $oid = $pdo->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
        $stmt->bindParam(':bajas',$bajas);
        $stmt->bindParam(':tipo',$tipo);
		$stmt->bindParam(':posicion',$posicion);
		$stmt->bindParam(':puntos',$puntos);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function actualizarPartidoFortnite($conexion, $oid, $resultado, $tipo, $fecha, $jugadores, $liga, $bajas, $tipo, $posicion, $puntos) {
	$sql = "UPDATE INTO PARTIDOSFORTNITE(bajas, tipo, posicion, puntos) VALUES (:bajas, :tipo, :posicion, :puntos)
		WHERE OID_PT = (:id)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':oid_pt',$oid);
        $stmt->bindParam(':bajas',$bajas);
        $stmt->bindParam(':tipo',$tipo);
		$stmt->bindParam(':posicion',$posicion);
		$stmt->bindParam(':puntos',$puntos);
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

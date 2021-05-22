<?php

function consultarPartidoLoL($conexion) {
	$sql = "SELECT * FROM PARTIDOSLOL";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
}

function borrarPartidoLoL($conexion, $oid) {
	$sql = "DELETE FROM PARTIDOSLOL WHERE OID_PT =:id";
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

function insertarPartidoLoL($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $kda, $campeones, $baneos, $objetivos, $builds) {
    
	$sql = "INSERT INTO PARTIDOSLOL(OID_PT, kda, campeones, baneos, objetivos, builds)
    VALUES (:oid_pt, :kda, :campeones, :baneos, :objetivos, :builds)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "LOL", $fecha, $jugadores, $liga);
		$oid = $conexion->lastInsertId();
		$stmt->bindParam(':oid_pt',$oid);
		$stmt->bindParam(':kda',$kda);
		$stmt->bindParam(':campeones',$campeones);
		$stmt->bindParam(':campeones',$campeones);
		$stmt->bindParam(':baneos',$baneos);
		$stmt->bindParam(':objetivos',$objetivos);
        $stmt->bindParam(':builds',$builds);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}


function actualizarPartidoLoL($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $kda, $campeones, $baneos, $objetivos, $builds) {
    
	$sql = "UPDATE INTO PARTIDOSLOL( kda, campeones, baneos, objetivos, builds)
    VALUES ( :kda, :campeones, :baneos, :objetivos, :builds) WHERE OID_PT = (:id)";
	$stmt = $conexion->prepare($sql);
	try {
        
		$stmt->bindParam(':kda',$kda);
		$stmt->bindParam(':campeones',$campeones);
		$stmt->bindParam(':campeones',$campeones);
		$stmt->bindParam(':baneos',$baneos);
		$stmt->bindParam(':objetivos',$objetivos);
        $stmt->bindParam(':builds',$builds);
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


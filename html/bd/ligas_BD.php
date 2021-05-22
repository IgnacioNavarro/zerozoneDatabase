<?php

function listadoLiga($conexion) {
	$sql = "SELECT * FROM LIGAS";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function borrarLiga($conexion, $oid) {
	$sql = "DELETE FROM LIGAS WHERE OID_LG =:id";
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

function insertarLiga($conexion, $nombre, $posicion, $importePremio, $fechaCobroPremio) {
	$sql = "INSERT INTO LIGAS(nombre, posicion, importePremio, fechaCobroPremio)
        VALUES (:nombre, :posicion, :importePremio, :fechaCobroPremio)";
	$stmt = $conexion->prepare($sql);
    $stmt->bindParam(':nombre',$nombre);
    $stmt->bindParam(':posicion',$posicion);
    $stmt->bindParam(':importePremio',$importePremio);
    $stmt->bindParam(':fechaCobroPremio',$fechaCobroPremio);
    $stmt->execute();
}

function actualizarLiga($conexion, $oid, $nombre, $posicion, $importePremio, $fechaCobroPremio) {
	$sql = "UPDATE LIGAS SET nombre = :nombre, posicion = :posicion, importePremio = :importePremio,
	 fechaCobroPremio = :fechaCobroPremio WHERE OID_LG = :id";

	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':id',$oid);
    	$stmt->bindParam(':nombre',$nombre);
    	$stmt->bindParam(':posicion',$posicion);
    	$stmt->bindParam(':importePremio',$importePremio);
    	$stmt->bindParam(':fechaCobroPremio',$fechaCobroPremio, PDO::PARAM_STR);
   		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}


?>
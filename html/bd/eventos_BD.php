<?php

function listadoEvento($conexion) {
	$sql = "SELECT * FROM EVENTOS";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function consultarEvento($conexion, $oid) {
	$sql = "SELECT * FROM EVENTOS WHERE OID_EV =:id";
	$stmt = $conexion->query($sql);
	try {
		$stmt->bindParam(':id', $oid);
		return $stmt->fetch();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function borrarEvento($conexion, $oid) {
	$sql = "DELETE FROM EVENTOS WHERE OID_EV =:id";
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

function insertarEvento($conexion, $nombre, $fecha, $tipo, $rival) {
	$sql = "INSERT INTO EVENTOS (OID_ER, nombre, tipoEvento, fecha) VALUES (:rival, :nombre, :tipo, :fecha)";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':rival',$rival);
		$stmt->bindParam(':nombre',$nombre);
		$stmt->bindParam(':tipo',$tipo);
		$stmt->bindParam(':fecha',$fecha);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function actualizarEvento($conexion, $oid, $nombre, $fecha, $tipo, $rival) {
	$sql = "UPDATE EVENTOS SET OID_ER = :rival, nombre = :nombre, tipoEvento = :tipo,
	fecha = :fecha WHERE OID_EV = :id";
	$stmt = $conexion->prepare($sql);
	try {
		var_dump($fecha);
		$stmt->bindParam(':id',$oid);
		$stmt->bindParam(':rival',$rival);
		$stmt->bindParam(':nombre',$nombre);
		$stmt->bindParam(':tipo',$tipo);
		$stmt->bindParam(':fecha',$fecha, PDO::PARAM_STR);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}
?>
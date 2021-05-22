<?php

function listadoEquiposRivales($conexion) {
	$sql = "SELECT * FROM EQUIPOSRIVALES";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
}

function borrarEquipoRival($conexion, $oid) {
	$sql = "DELETE FROM EQUIPOSRIVALES WHERE OID_PB =:id";
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

function insertarEquipoRival($conexion, $nombre, $jugadores, $logo) {
	$sql = "INSERT INTO EQUIPOSRIVALES(nombre, jugadores, logo) VALUES (:nombre, :jugadores, :logo)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':nombre',$nombre);
        $stmt->bindParam(':jugadores',$jugadores);
		$stmt->bindParam(':logo',$logo);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}



?>
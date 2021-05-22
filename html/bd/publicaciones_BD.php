<?php

function borrarPublicacion($conexion, $oid) {
	$sql = "DELETE FROM PUBLICACIONES WHERE OID_PB =:id";
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

function insertarPublicacion($conexion, $evento, $fecha, $diseño) {
	$sql = "INSERT INTO PUBLICACIONES(OID_EV, fecha, disenoListo) VALUES (:evento, :fecha, :diseño)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':evento',$evento);
        $stmt->bindParam(':fecha',$fecha);
		$stmt->bindParam(':diseño',$diseño);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}



?>
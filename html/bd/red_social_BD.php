<?php
function listadoInstagram($conexion){
	$sql = "SELECT * FROM REDESSOCIALES WHERE NOMBRE = 'Instagram'";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoTwitter($conexion){
	$sql = "SELECT * FROM REDESSOCIALES WHERE NOMBRE = 'Twitter'";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function borrarRedSocial($conexion, $oid) {
	$sql = "DELETE FROM REDESSOCIALES WHERE OID_RRSS =:id";
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

function insertarRedSocial($conexion, $nombre, $fecha, $seguidores, $interacciones) {
	$sql = "INSERT INTO REDESSOCIALES(nombre, fecha, numeroSeguidores, interacciones) VALUES
        (:nombre, :fecha, :seguidores, :interacciones)";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':nombre',$nombre);
        $stmt->bindParam(':fecha',$fecha);
        $stmt->bindParam(':seguidores',$seguidores);
        $stmt->bindParam(':interacciones',$interacciones);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function actualizarRedSocial($conexion, $oid, $nombre, $fecha, $seguidores, $interacciones) {
	$sql = "UPDATE REDESSOCIALES SET nombre = :nombre , fecha = :fecha, numeroSeguidores = :seguidores,
	 interacciones = :interacciones WHERE OID_RRSS = :id";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':id',$oid);
		$stmt->bindParam(':nombre',$nombre);
		$stmt->bindParam(':fecha',$fecha, PDO::PARAM_STR);
        $stmt->bindParam(':seguidores',$seguidores);
        $stmt->bindParam(':interacciones',$interacciones);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

?>
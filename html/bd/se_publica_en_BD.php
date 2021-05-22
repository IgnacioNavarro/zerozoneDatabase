<?php
function borrarSePublicaEn($conexion, $oid) {
	$sql = "DELETE FROM SEPUBLICAEN WHERE OID_SPE =:id";
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

function insertarSePublicaEn($conexion, $publicacion, $redSocial) {
	$sql = "INSERT INTO SEPUBLICAEN(OID_PB, OID_RRSS) VALUES (:pb, :rrss)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':pb',$publicacion);
        $stmt->bindParam(':rrss',$redSocial);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}
?>
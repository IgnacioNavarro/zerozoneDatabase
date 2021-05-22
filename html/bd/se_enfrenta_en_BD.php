<?php
function borrarSeEnfrentaEn($conexion, $oid) {
	$sql = "DELETE FROM SEENFRENTAEN WHERE OID_SEF =:id";
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

function insertarSeEnfrentaEn($conexion, $oid_pt, $oid_er) {
	$sql = "INSERT INTO SEENFRENTAEN(OID_PT, OID_ER) VALUES (:oid_pt, :oid_er)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':oid_pt',$oid_pt);
        $stmt->bindParam(':oid_er',$oid_er);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}
?>
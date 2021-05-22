<?php
function borrarParticipaEn($conexion, $oid) {
	$sql = "DELETE FROM PARTICIPAEN WHERE OID_PE =:id";
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

function insertarParticipaEn($conexion, $oid_er, $oid_lg) {
	$sql = "INSERT INTO PARTICIPAEN(OID_ER, OID_LG) VALUES (:oid_er, :oid_lg)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':oid_er',$oid_er);
        $stmt->bindParam(':oid_lg',$oid_lg);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}
?>
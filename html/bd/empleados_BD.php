<?php

function listadoBrawlStars($conexion){
	$sql = "SELECT * FROM EMPLEADOS NATURAL JOIN JUGADORES WHERE SECCION = 'Brawl Stars'";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoClashRoyale($conexion){
	$sql = "SELECT * FROM EMPLEADOS NATURAL JOIN JUGADORES WHERE SECCION = 'Clash Royale'";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoFIFA($conexion){
	$sql = "SELECT * FROM EMPLEADOS NATURAL JOIN JUGADORES WHERE SECCION = 'FIFA'";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoLOL($conexion){
	$sql = "SELECT * FROM EMPLEADOS NATURAL JOIN JUGADORES WHERE SECCION = 'LOL'";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoCSGO($conexion){
	$sql = "SELECT * FROM EMPLEADOS NATURAL JOIN JUGADORES WHERE SECCION = 'CSGO'";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoFortnite($conexion){
	$sql = "SELECT * FROM EMPLEADOS NATURAL JOIN JUGADORES WHERE SECCION = 'FORTNITE'";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function borrarEmpleado($conexion, $dni) {
	$sql = "DELETE FROM EMPLEADOS WHERE DNI =:dni";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':dni', $dni);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarJugador($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
							$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla, 
							$posicionesPrincipales, $nombreTutor, $dniTutor, $telefonoTutor, $correoTutor, $oid_eq) {
    
	$sql = "INSERT INTO JUGADORES(posicionesPrincipales, nombreTutor, dniTutor, telefonoTutor, correoTutor, oid_eq)
    VALUES (:posicionesPrincipales, :nombreTutor, :dniTutor, :telefonoTutor, :correoTutor, :oid_eq)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEmpleado($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
						$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla);
        $stmt->bindParam(':posicionesPrincipales',$posicionesPrincipales);
		$stmt->bindParam(':nombreTutor',$nombreTutor);
		$stmt->bindParam(':dniTutor',$dniTutor);
		$stmt->bindParam(':telefonoTutor',$telefonoTutor);
		$stmt->bindParam(':correoTutor',$correoTutor);
		$stmt->bindParam(':oid_eq',$oid_eq);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarCommunityManager($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
							$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla) {
    
	$sql = "INSERT INTO COMMUNITY_MANAGERS(dni)
    VALUES (:dni)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEmpleado($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
						$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla);
        $stmt->bindParam(':dni',$dni);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarDiseñador($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
							$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla) {
    
	$sql = "INSERT INTO DISEÑADORES(dni)
    VALUES (:dni)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEmpleado($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
						$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla);
        $stmt->bindParam(':dni',$dni);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarMannager($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
							$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla) {
    
	$sql = "INSERT INTO MANAGERS(dni)
    VALUES (:dni)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEmpleado($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
						$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla);
        $stmt->bindParam(':dni',$dni);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarCoach($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
							$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla) {
    
	$sql = "INSERT INTO COACHS(dni)
    VALUES (:dni)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEmpleado($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
						$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla);
        $stmt->bindParam(':dni',$dni);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarAnalista($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
							$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla) {
    
	$sql = "INSERT INTO ANALISTAS(dni)
    VALUES (:dni)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEmpleado($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
						$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla);
        $stmt->bindParam(':dni',$dni);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarDirectivo($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
							$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla) {
    
	$sql = "INSERT INTO DIRECTIVOS(dni)
    VALUES (:dni)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarEmpleado($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
						$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla);
        $stmt->bindParam(':dni',$dni);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

//Solo debe ser llamada por otra funcion de insertar empleado
function insertarEmpleado($conexion, $dni, $nombre, $edad, $telefono, $tipoEmpleado, $seccion, $inicioContrato, $finContrato,
							$experienciaPrevia, $horasMensuales, $correo, $nick, $RRSS, $direccion, $talla) {
	$sql = "INSERT INTO EMPLEADOS(dni, nombre, edad, telefono, tipoEmpleado, seccion, fechaInicioContrato, fechaFinContrato,
									experienciaPrevia, horasMensuales, correo, nick, redesSociales, direccion, tallaCamiseta)
        VALUES (:dni, :nombre, :edad, :telefono, :tipoEmpleado, :seccion, :inicioContrato, :finContrato, :experienciaPrevia,
				:horasMensuales, :correo, :nick, :RRSS, :direccion, :talla)";
	try {
		$stmt = $conexion->prepare($sql);
    	$stmt->bindParam(':dni',$dni);
    	$stmt->bindParam(':nombre',$nombre);
    	$stmt->bindParam(':edad',$edad);
    	$stmt->bindParam(':telefono',$telefono);
    	$stmt->bindParam(':tipoEmpleado',$tipoEmpleado);
		$stmt->bindParam(':seccion',$seccion);
		$stmt->bindParam(':inicioContrato',$inicioContrato);
		$stmt->bindParam(':finContrato',$finContrato);
		$stmt->bindParam(':experienciaPrevia',$experienciaPrevia);
		$stmt->bindParam(':horasMensuales',$horasMensuales);
		$stmt->bindParam(':correo',$correo);
		$stmt->bindParam(':nick',$nick);
		$stmt->bindParam(':RRSS',$RRSS);
		$stmt->bindParam(':direccion',$direccion);
		$stmt->bindParam(':talla',$talla);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

?>
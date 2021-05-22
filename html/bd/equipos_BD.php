<?php

function listadoEquiposPorSeccion($conexion, $seccion) {
	switch ($seccion) {
	case 'LOL':
		return listadoLOL($conexion);
	case 'FORTNITE':
		return listadoFortnite($conexion);
	case 'CSGO':
		return listadoCSGO($conexion);
	case 'FIFA':
		return listadoFIFA($conexion);
	case 'Clash Royale':
		return listadoClashRoyale($conexion);
	case 'Brawl Stars':
		return listadoBrawlStars($conexion);
	}
}

function listadoBrawlStars($conexion){
	try {
		$sql = "SELECT distinct equipos.* from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where seccion = 'Brawl Stars'";
		$stmt = $conexion->query($sql);
		$equipos = $stmt->fetchAll();
		$i = 0;
		foreach ($equipos as $equipo) {
			$result[$i][0] = $equipo;
			$sql = "SELECT empleados.nombre from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where equipos.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$sql = "SELECT nombre from compiteen natural join ligas where compiteen.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][2] = $stmt->fetchAll();
			$sql = "select nombre from managers natural join empleados where seccion = 'Brawl Stars'";
			$stmt = $conexion->query($sql);
			$result[$i][3] = $stmt->fetchAll();
			$sql = "SELECT nombre from analiza natural join analistas natural join empleados where analiza.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][4] = $stmt->fetchAll();
			$sql = "SELECT nombre from entrena natural join coachs natural join empleados where entrena.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][5] = $stmt->fetchAll();
			$i ++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoFortnite($conexion){
	try {
		$sql = "SELECT distinct equipos.* from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where seccion = 'FORTNITE'";
		$stmt = $conexion->query($sql);
		$equipos = $stmt->fetchAll();
		$i = 0;
		foreach ($equipos as $equipo) {
			$result[$i][0] = $equipo;
			$sql = "SELECT empleados.nombre from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where equipos.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$sql = "SELECT nombre from compiteen natural join ligas where compiteen.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][2] = $stmt->fetchAll();
			$sql = "select nombre from managers natural join empleados where seccion = 'FORTNITE'";
			$stmt = $conexion->query($sql);
			$result[$i][3] = $stmt->fetchAll();
			$sql = "SELECT nombre from analiza natural join analistas natural join empleados where analiza.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][4] = $stmt->fetchAll();
			$sql = "SELECT nombre from entrena natural join coachs natural join empleados where entrena.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][5] = $stmt->fetchAll();
			$i ++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoFIFA($conexion){
	try {
		$sql = "SELECT distinct equipos.* from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where seccion = 'FIFA'";
		$stmt = $conexion->query($sql);
		$equipos = $stmt->fetchAll();
		$i = 0;
		foreach ($equipos as $equipo) {
			$result[$i][0] = $equipo;
			$sql = "SELECT empleados.nombre from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where equipos.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$sql = "SELECT nombre from compiteen natural join ligas where compiteen.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][2] = $stmt->fetchAll();
			$sql = "select nombre from managers natural join empleados where seccion = 'FIFA'";
			$stmt = $conexion->query($sql);
			$result[$i][3] = $stmt->fetchAll();
			$sql = "SELECT nombre from analiza natural join analistas natural join empleados where analiza.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][4] = $stmt->fetchAll();
			$sql = "SELECT nombre from entrena natural join coachs natural join empleados where entrena.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][5] = $stmt->fetchAll();
			$i ++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoLOL($conexion){
	try {
		$sql = "SELECT distinct equipos.* from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where seccion = 'LOL'";
		$stmt = $conexion->query($sql);
		$equipos = $stmt->fetchAll();
		$i = 0;
		foreach ($equipos as $equipo) {
			$result[$i][0] = $equipo;
			$sql = "SELECT empleados.nombre from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where equipos.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$sql = "SELECT nombre from compiteen natural join ligas where compiteen.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][2] = $stmt->fetchAll();
			$sql = "select nombre from managers natural join empleados where seccion = 'LOL'";
			$stmt = $conexion->query($sql);
			$result[$i][3] = $stmt->fetchAll();
			$sql = "SELECT nombre from analiza natural join analistas natural join empleados where analiza.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][4] = $stmt->fetchAll();
			$sql = "SELECT nombre from entrena natural join coachs natural join empleados where entrena.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][5] = $stmt->fetchAll();
			$i ++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoCSGO($conexion){
	try {
		$sql = "SELECT distinct equipos.* from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where seccion = 'CSGO'";
		$stmt = $conexion->query($sql);
		$equipos = $stmt->fetchAll();
		$i = 0;
		foreach ($equipos as $equipo) {
			$result[$i][0] = $equipo;
			$sql = "SELECT empleados.nombre from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where equipos.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$sql = "SELECT nombre from compiteen natural join ligas where compiteen.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][2] = $stmt->fetchAll();
			$sql = "select nombre from managers natural join empleados where seccion = 'CSGO'";
			$stmt = $conexion->query($sql);
			$result[$i][3] = $stmt->fetchAll();
			$sql = "SELECT nombre from analiza natural join analistas natural join empleados where analiza.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][4] = $stmt->fetchAll();
			$sql = "SELECT nombre from entrena natural join coachs natural join empleados where entrena.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][5] = $stmt->fetchAll();
			$i ++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoClashRoyale($conexion){
	try {
		$sql = "SELECT distinct equipos.* from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where seccion = 'Clash Royale'";
		$stmt = $conexion->query($sql);
		$equipos = $stmt->fetchAll();
		$i = 0;
		foreach ($equipos as $equipo) {
			$result[$i][0] = $equipo;
			$sql = "SELECT empleados.nombre from equipos left join jugadores on equipos.oid_eq = jugadores.oid_eq left join empleados on jugadores.dni = empleados.dni where equipos.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$sql = "SELECT nombre from compiteen natural join ligas where compiteen.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][2] = $stmt->fetchAll();
			$sql = "select nombre from managers natural join empleados where seccion = 'Clash Royale'";
			$stmt = $conexion->query($sql);
			$result[$i][3] = $stmt->fetchAll();
			$sql = "SELECT nombre from analiza natural join analistas natural join empleados where analiza.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][4] = $stmt->fetchAll();
			$sql = "SELECT nombre from entrena natural join coachs natural join empleados where entrena.oid_eq = " . $equipo["OID_EQ"];
			$stmt = $conexion->query($sql);
			$result[$i][5] = $stmt->fetchAll();
			$i ++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function borrarEquipo($conexion, $oid) {
	$sql = "DELETE FROM EQUIPOS WHERE OID_EQ =:id";
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

function insertarEquipo($conexion, $dni, $nombre, $globalRank, $nationalRank) {
	$sql = "INSERT INTO EQUIPOS(dni, nombre, clasificacionGlobal, clasificacionNacional)
        VALUES (:dni, :nombre, :globalRank, :nationalRank)";
	try{
		$stmt = $conexion->prepare($sql);
    	$stmt->bindParam(':dni',$dni);
    	$stmt->bindParam(':nombre',$nombre);
    	$stmt->bindParam(':globalRank',$globalRank);
    	$stmt->bindParam(':nationalRank',$nationalRank);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}



?>

<?php
  session_start();
  if(!isset($_SESSION["log"]))
		Header("Location: ../inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    require_once("../validaciones.php");
    $regex_texto = REGEX_TEXTO;
    $formulario["bajas"]=$_REQUEST["bajas"];
    $formulario["tipoFortnite"]=$_REQUEST["tipoFortnite"];
    $formulario["posicion"]=$_REQUEST["posicion"];
    $formulario["puntos"]=$_REQUEST["puntos"];
    $formulario["resultado"] = $_REQUEST["resultado"];
    $formulario["tipo"] = $_REQUEST["tipo"];
    $formulario["fecha"] = $_REQUEST["fecha"];
    $formulario["jugadores"] = $_REQUEST["jugadores"];
    $formulario["liga"]=$_REQUEST["liga"];
    $_SESSION["formulario"]=$formulario;
   
    $tiposFortnite= array["SOLO","DUO","SQUAD"];
    $tipos= array["Amistoso","Liga","Entrenamiento"];

    if ($formulario["posicion"] > 100 && $formulario["posicion"] < 0 || $formulario["posicion"]==NULL))
        Header("Location: partidosfortnite_form.php");
    if (!empty($formulario["liga"]) && false) 
      Header("Location: partidosfornite_form.php");
    if ($formulario["bajas"]< 0) || !in_array($formulario["tipo"], $tipos) || || !in_array($formulario["tipoFortnite"], $tiposFortnite) ||  !preg_match($regex_texto,$formulario["jugadores"]) )
        Header("Location: partidosfornite_form.php");
       
    if ($formulario['tipo'] == '') $formulario['tipo'] = null;
    if ($formulario['tipoFortnite'] == '') $formulario['tipoFortnite'] = null;
    if ($formulario['fecha'] == '') $fechadate = null;
      else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fecha'])->format("d-m-Y");
    if ($formulario['liga'] == '') $formulario['liga'] = null
       
        require_once("../bd/gestionBD.php");
        require_once("../bd/partidosfortnite_bd.php");
        $conexion = crearConexionBD();
        $bdid = "insert";
      if ($bdid == "insert")
        insertarPartidoFortnite($conexion, $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["bajas"],$formulario["tipoFortnite"] , $formulario["posicion"],$formulario["puntos"]);
      else
        actualizarPartidoFortnite($conexion, $bdid, $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["bajas"],$formulario["tipoFortnite"] , $formulario["posicion"],$formulario["puntos"]);
        cerrarConexionBD($conexion);
        Header("Location: PartidosFornite.php"); 
   
  }
  else Header("Location: partidosfortnite_form.php");
?>

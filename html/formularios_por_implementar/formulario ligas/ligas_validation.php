<!DOCTYPE HTML>  
<html>
<body>  
<?php
  session_start();
  if (isset($_SESSION["formulario"]) ){
    $formulario["nombre"]=$_REQUEST["nombre"];
    $formulario["posicion"]=$_REQUEST["posicion"];
    $formulario["importePremio"]=$_REQUEST["importePremio"];
    $formulario["fechaCobroPremio"]=$_REQUEST["fechaCobroPremio"];


    if (empty($formulario["nombre"])) {
        $errNombre = "El nombre no puede ser vacío";
      }
      else {
        if (!preg_match("/^[a-zA-Záéíóú ]*$/",$formulario["nombre"]))
          $errNombre = "El nombre solo puede contener letras y espacios";
      }

    if ($errNombre != "" || $errPosicion != "" ) {
        $_SESSION["errNombre"] = $errNombre;
         Header("Location: ligas_form.php");
      }
      else {
      $_SESSION["nombre"] = $formulario["nombre"];
      $_SESSION["posicion"] = $formulario["posicion"];
      $_SESSION["importePremio"] = $formulario["importePremio"];
      $_SESSION["fechaCobroPremio"] = $formulario["fechaCobroPremio"];  
      Header("Location: accion.php");}
    }
    else Header("Location: ligas_form.php");
  ?>
<!DOCTYPE HTML>  
<html>
<body>  
<?php
  session_start();
  if (isset($_SESSION["formulario"]) ){
    $formulario["dni"]=$_REQUEST["dni"];
    $formulario["nombre"]=$_REQUEST["nombre"];
    $formulario["clasificacionGlobal"]=$_REQUEST["clasificacionGlobal"];
    $formulario["clasificacionNacional"]=$_REQUEST["clasificacionNacional"];
    
  
      if (!preg_match("/^[0-9]{8}[A-Z]/",$formulario["dni"])){
      $errDni = "El DNI debe tener un formato válido";
      }
      if (empty($formulario["nombre"])) {
        $errNombre = "El nombre no puede ser vacío";
      }
      else {
        if (!preg_match("/^[a-zA-Záéíóú ]*$/",$formulario["nombre"]))
          $errNombre = "El nombre solo puede contener letras y espacios";
      }
      
      if ($errDNI != "" || $errNombre != "" ) {
        $_SESSION["errDNI"] = $errDNI;
        $_SESSION["errNombre"] = $errNombre;
        Header("Location: equipo_form.php");
      }
      else {
        $_SESSION["dni"] = $formulario["dni"];
        $_SESSION["nombre"] = $formulario["nombre"];
        $_SESSION["clasificacionGlobal"] = $formulario["clasificacionGlobal"];
        $_SESSION["clasificacionNacional"] = $formulario["clasificacionNacional"];
        Header("Location: accion.php");}
    }
    else {Header("Location: equipo_form.php");}
  
  ?>
<?php
    session_start();
    $_SESSION["log"] = "admin";
    Header("Location: equipo_form.php");
?>
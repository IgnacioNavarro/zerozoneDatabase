$(document).ready(function(){

    $("#estadisticas-personales").click(function () {
        $("#id-jugador").hide();
        $("#id-estadisticas").show();
        $("#estadisticas-personales").css("background-color", "#3b3a3a");
        $("#dat-pers").css("color", "#3b3a3a");
        $("#datos-personales").css("background-color", "#f2f2f2");
        $("#est-pers").css("color", "#f2f2f2");

    });
    $("#datos-personales").click(function () {
        $("#id-jugador").show();
        $("#id-estadisticas").hide();
        $("#datos-personales").css("background-color", "#3b3a3a");
        $("#est-pers").css("color", "#3b3a3a");
        $("#estadisticas-personales").css("background-color", "#f2f2f2");
        $("#dat-pers").css("color", "#f2f2f2");
    });

    $("#edit-jugbs").click(function () {
        if( $("#id-jugador").is(":hidden")){
            $("#edit-jugbs").attr("href", "estadisticas_brawl_form.php");
        }else{
            alert("maquina esto todavia no está");
        }
    });

    $("#edit-jugcr").click(function () {
        if( $("#id-jugador").is(":hidden")){
            $("#edit-jugcr").attr("href", "estadisticas_clash_form.php");
        }else{
            alert("maquina esto todavia no está");
        }
    });

    $("#edit-jugcs").click(function () {
        if( $("#id-jugador").is(":hidden")){
            $("#edit-jugcs").attr("href", "estadisticas_csgo_form.php");
        }else{
            alert("maquina esto todavia no está");
        }
    });

    $("#edit-jugfort").click(function () {
        if( $("#id-jugador").is(":hidden")){
            $("#edit-jugfort").attr("href", "estadisticas_fortnite_form.php");
        }else{
            alert("maquina esto todavia no está");
        }
    });

    $("#edit-jugfifa").click(function () {
        if( $("#id-jugador").is(":hidden")){
            $("#edit-jugfifa").attr("href", "estadisticas_fifa_form.php");
        }else{
            alert("maquina esto todavia no está");
        }
    });

    $("#edit-juglol").click(function () {
        if( $("#id-jugador").is(":hidden")){
            $("#edit-juglol").attr("href", "estadisticas_lol_form.php");
        }else{
            alert("maquina esto todavia no está");
        }
    });
});
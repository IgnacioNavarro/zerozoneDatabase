const errores_regex = ["El campo solo puede contener letras y espacios", "Introduzca un número válido",
    "Introduzca un porcentaje válido, separado por un punto",
    "El campo solo puede contener letras, espacios y algunos signos",
    "Introduzca un DNI válido con la letra en mayúscula",
    "Inserte un número de teléfono válido",
    "Inserte un correo electrónico válido"];
        
function textValidation(regex, id, mensaje = 0) {
    var re = new RegExp(regex);
    var input = document.getElementById(id).value;
    var req = document.getElementById(id).required;
    if (req && input == "") {
        document.getElementById("ERR" + id).innerHTML = "Este campo es obligatorio";
        return false;
    }
    if (re.test(input)) {
        document.getElementById("ERR" + id).innerHTML = "";
        return true;
    }
    else {
        document.getElementById("ERR" + id).innerHTML = errores_regex[mensaje];
        return false;
    }
}

function typeValidation(array, id) {
    var input = document.getElementById(id).value;
    var req = document.getElementById(id).required;
    const found = array.some(item => item === input);
    if (req && input == "") {
        document.getElementById("ERR" + id).innerHTML = "Este campo es obligatorio";
        return false;
    }
    if (found || (!req && input == "")) {
        document.getElementById("ERR" + id).innerHTML = "";
        return true;
    }
    else {
        document.getElementById("ERR" + id).innerHTML = "Seleccione uno de los valores permitidos";
        return false;
    }
}
function dateValidation(id) {
    var input = document.getElementById(id).value;
    var req = document.getElementById(id).required;
    var valid = moment(input, 'YYYY-MM-DD',true).isValid();
    if (req && input == "") {
        document.getElementById("ERR" + id).innerHTML = "Este campo es obligatorio";
        return false;
    }
    if (valid || (!req && input == "")) {
        document.getElementById("ERR" + id).innerHTML = "";
        return true;
    }
    else {
        document.getElementById("ERR" + id).innerHTML = "Introduzca una fecha válida";
        return false;
    }
}
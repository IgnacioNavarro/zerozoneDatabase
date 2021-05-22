<?php
define("REGEX_NOMBRE", "[a-zA-Záéíóúñ ]+", false);
define("REGEX_INT","[0-9]+", false);
define("REGEX_WR", "/\d\d\.\d\d", false);
define("REGEX_TEXTO", "[\-a-zA-Z0-9áéíóúñ_.,@():º ]+", false);

define("REGEXJS_NOMBRE", '"^[a-zA-Záéíóúñ ]+$"', false);
define("REGEXJS_INT",'"^[0-9]+$"', false);
define("REGEXJS_WR", '"^\d\d\.\d\d$"', false);
define("REGEXJS_TEXTO", '"^[\-a-zA-Z0-9áéíóúñ_.,@():º ]+$"', false);

function testFecha($string) {
    if ($string == '')
        return true;
    $d = DateTime::createFromFormat('Y-m-d', $string);
    return !($d && $d->format('Y-m-d') === $string);
}
?>
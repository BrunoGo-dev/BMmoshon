<?php
class Conexion {

    function getConexion() {

        // SIEMPRE intentar leer las variables de entorno de Docker
        $server = getenv('sql.freedb.tech');
        $login  = getenv('freedb_brayan0621');
        $pass   = getenv('AU!p53czm@U?5Aj');
        $bdatos = getenv('freedb_bmmoda1');

        // Validar que existan
        if (!$server || !$login || !$bdatos) {
            die("❌ Error: Variables de entorno DB_* no están definidas. Revisa tu docker-compose.");
        }

        // Conexión
        $cn = mysqli_connect($server, $login, $pass, $bdatos);

        if (!$cn) {
            die("❌ Error de conexión MySQL: " . mysqli_connect_error());
        }

        return $cn;
    }
}
?>

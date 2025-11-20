<?php
class Conexion {

    function getConexion() {

        // Leer variables de entorno correctamente
        $server = getenv('DB_HOST');
        $login  = getenv('DB_USER');
        $pass   = getenv('DB_PASSWORD');
        $bdatos = getenv('DB_NAME');

        // Validar que existan
        if (!$server || !$login || !$bdatos) {
            die("❌ Error: Variables de entorno DB_* no están definidas.");
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

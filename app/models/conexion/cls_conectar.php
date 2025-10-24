<?php
   class conexion{

    function getConexion(){

        $server="localhost:3307";
        $login="root";
        $pass="12345";
        $bdatos="BMmoda1";
        $cn=mysqli_connect($server,$login,$pass,$bdatos);
        if(mysqli_connect_error()){
            echo 'error nro: '.mysqli_connect_error();
        }else{
            echo "";
        }
        return $cn;
    }
   }


?>
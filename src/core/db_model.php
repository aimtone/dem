<?php 
  // Incluimos el archivo de configuracion el cual posee las credenciales de conexion
  include 'config.php';

  // Se crea la clase de conexion y ejecucion de consultas
  class db_model {

    // Variable de conexion
    public $conn;

    // La funcion construtora crea y abre la conexion al momento de instanciar esta clase
    function __construct() {
      $this->conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME); // Los parametros de la funcion mysqli() son las constantes previamente declaradas en el archivo config.php
      
    }

    function validateToken($username,$password) {
      $query = $this->get_query(sprintf("SELECT * FROM usuario WHERE cedula = '%s' AND clave = '%s'", $username, $password));

      $query = array_filter($query);
     
      if(count($query)!=0) {
        return true;
      } else {
        return false;
      }

    }


    // Funcion para obtener un array de resultados
    // Solo se usara para las consultas de tipo SELECT
    function get_query($sql) {
      // Lee la cadena SQL recibida y ejecuta la consulta
      $result = $this->conn->query($sql);

      // Hace el rrecorrido por el array de datos y lo guarda en la variable $rows
      while ($rows[] = $result->fetch_assoc());

      // Cierra la consulta
      $result->close();

      // Retorna el resultado obtenido
      return $rows;
    }

    // Funcion para hacer cambios dentro de la base de datos
    // Solo se usara para las consultas de tipo INSERT, UPDATE Y DELETE
    function set_query($sql) {
      // Lee la cadena SQL recibida y ejecuta la consulta
      $result = $this->conn->query($sql);

      // Retorna el resultado
      return $result;

    }

    // La funcion destructora cierra la conexion previamente abierta en el constructor
    function __destruct() {
      $this->conn->close();
    }
  }
?>
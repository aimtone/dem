<?php 
	// Se incluye el archivo de conexion de base de datos
	include '../core/db_model.php';

	// Se crea la clase que ejecuta llama a las funciones de ejecucion para interactuar con la Base de datos
	// Esta clase extiende a la clase db_model en el archivo db_model.php (hereda sus propiedades y metodos)
	// Esta clase implementa la interfaz iModel (Enmascara cada una de las funciones declaradas)
	class log extends db_model {


		function log_in($cedula, $clave) {

			return $this->get_query(sprintf("SELECT * FROM usuario WHERE cedula = '%s' AND clave = '%s'", $cedula, $clave));


		}

		function validateToken($token) {
			

		}



	}
?>
<?php 
	// Se incluye el archivo de conexion de base de datos
	include '../core/db_model.php';

	// Se crea la clase que ejecuta llama a las funciones de ejecucion para interactuar con la Base de datos
	// Esta clase extiende a la clase db_model en el archivo db_model.php (hereda sus propiedades y metodos)
	// Esta clase implementa la interfaz iModel (Enmascara cada una de las funciones declaradas)
	class schedule extends db_model {
		// Ya que la clase es generica, es importante poseer una variable que permitira identificar con que tabla se trabaja
		public $entity;
		// Almacena la informacion que sera enviada a la Base de datos
		public $data;
		// Almacena la fecha del evento para restar el intervalo de tiempo en el que se enviar el SMS
		public $eventDate;
		// Almacena el intervalo de tiempo en el que el mensaje sera enviado
		public $interval;

		// Esta funcion sera llamada al momento de usar el metodo DELETE

		function scheduler() {
			
			return $this->set_query(sprintf("
				CREATE EVENT 
					%s
				ON SCHEDULE AT '%s' - INTERVAL %s
				DO 
					insert into %s %s
				",
				substr(str_shuffle("qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890"), 0, 10),
				$this->eventDate,
				$this->interval,
				$this->entity,
				$this->data
				));

		}
	}
?>
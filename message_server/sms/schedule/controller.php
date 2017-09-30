<?php 
	// Permite la conexion desde cualquier origen
	header("Access-Control-Allow-Origin: *");
	// Permite la ejecucion de los metodos
	header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");  
	// Se incluye el archivo que contiene la clase generica
	include 'model.php';

	// Variable que guarda la instancia de la clase generica
	$obj = get_obj();

	$bodyRequest = file_get_contents("php://input");

	// Analiza el metodo usado actualmente de los cuatro disponibles: GET, POST, PUT, DELETE
	switch ($_SERVER['REQUEST_METHOD']) {
		case 'GET':
			echo "get";
			break;
		case 'POST':
			shell_exec('echo SET GLOBAL event_scheduler=on | mysql --user=root --password=root');
			// Decodifica el cuerpo de la solicitud y lo guarda en un array de PHP
			$array = json_decode($bodyRequest, true);

			// Renderiza la informacion obtenida que luego sera guardada en la Base de datos
			$obj->eventDate = $_GET['date'];
			$obj->interval = $_GET['interval'];
			$obj->entity = "outbox";
			$obj->data = renderizeData(array_keys($array), array_values($array));

			$data = $obj->scheduler();
			break;
		default:
			// Acciones cuando el metodo no se permite
			// En caso de que el Metodo Solicitado no sea ninguno de los cuatro disponible, envia la siguiente respuesta
			print_json(405, "Metodo No Permitido", null);
			break;
	}

	// ---------------------- Funciones controladoras ------------------------------- //

	// Esta funcion crea la instancia de la clase generica y la retorna
	function get_obj() {
		$object = new schedule();
		return $object;
	}

	// Esta funcion renderiza la informacion que sera enviada a la base de datos
	function renderizeData($keys, $values) {

		switch ($_SERVER['REQUEST_METHOD']) {
			case 'POST':
				# code...
				 foreach ($keys as $key => $value) {
				 	if($key == count($keys) - 1) {
				 		$str = $str . $value . ") VALUES (";

				 		foreach ($values as $key => $value) {
				 			if($key == count($values) - 1) {
				 				$str = $str . "'" . $value . "')";
				 			} else {
				 				$str = $str . "'" . $value . "',";
				 			}
				 			
				 		}
				 	} else {
				 		if($key == 0) {
				 			$str = $str . "(" . $value . ",";
				 		} else {
				 			$str = $str . $value . ",";
				 		}
				 		
				 	}
				 }

				 return $str;
				break;
			case 'PUT':
				foreach ($keys as $key => $value) {
					if($key == count($keys) - 1) {
						$str = $str . $value . "='" . $values[$key] . "'"; 
					} else {
						$str = $str . $value . "='" . $values[$key] . "',"; 
					}
				}
				return $str;
				break;
		}
		


	}

	// Esta funcion imprime las respuesta en estilo JSON y establece los estatus de la cebeceras HTTP
	function print_json($status, $mensaje, $data) {
		header("HTTP/1.1 $status $mensaje");
		header("Content-Type: application/json; charset=UTF-8");

		$response['statusCode'] = $status;
		$response['statusMessage'] = $mensaje;
		$response['data'] = $data;

		echo json_encode($response, JSON_PRETTY_PRINT);
	}
?>
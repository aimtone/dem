<?php
    // Permite la conexion desde cualquier origen
	header("Access-Control-Allow-Origin: *");
	// Permite la ejecucion de los metodos
	header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");

    include '../model/log.php';

    $obj = get_obj();

    switch ($_SERVER['REQUEST_METHOD']) {
        case 'GET':
			$cortarParams = explode("?", $_SERVER['REQUEST_URI']);
			// Esto nos ayuda a identificar cuando se esta solicitando la URL general o un elemento especifico
			$array = explode("/", $cortarParams[0]); 

			foreach ($array as $key => $value) {
				if(empty($value)) {
					unset($array[$key]);
				}
			}

			$token = end($array);
			
			$JWT = json_decode(base64_decode($token), true);

			$data = array_filter($obj->log_in($JWT['cedula'],$JWT['clave']));

			if(count($data)==1) {
				print_json(200, "Bienvenido",$data);
			} else {
				print_json(201,"No existe",null);
			}
        break;
        case 'POST':
        break;
        case 'PUT':
        break;
        case 'DELETE':
        break;
        default:
            print_json(405, "Method Not Allowed", null);
        break;

    }

    

    // ---------------------- Funciones controladoras ------------------------------- //

	// Esta funcion crea la instancia de la clase generica y la retorna
	function get_obj() {
		$object = new log;
		return $object;
	}

	// Esta funcion renderiza la informacion que sera enviada a la base de datos
	function renderizeData($keys, $values) {
		$str = "";
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
					if($key!="id") {
						if($key == count($keys) - 1) {
							$str = $str . $value . "='" . $values[$key] . "'"; 
						} else {
							$str = $str . $value . "='" . $values[$key] . "',"; 
						}
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
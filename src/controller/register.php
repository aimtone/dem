<?php 
	header("Access-Control-Allow-Origin: *");
	// Permite la ejecucion de los metodos
	header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE"); 

	include '../core/config.php';
	// Variable que guarda la instancia de la clase 

	switch ($_SERVER['REQUEST_METHOD']) {
		case 'GET':
		$register_conn = new mysqli(DB_HOST, DB_USER, DB_PASS, "information_schema");
		$info = $register_conn->query("SELECT * FROM `SCHEMATA` WHERE SCHEMA_NAME = 'dem'");
		$arr = array('existe_bd' => $info->num_rows, );
		print_json(200, "OK", $arr);
			break;
		case 'POST':
			$salida1 = shell_exec(sprintf("mysql --user=%s --password=%s < %s",DB_USER,DB_PASS,"../../smsgw.sql"));
			$salida2 = shell_exec(sprintf("mysql --user=%s --password=%s < %s",DB_USER,DB_PASS,"../../dem.sql"));
			$register_conn = new mysqli(DB_HOST, DB_USER, DB_PASS, "information_schema");
			$info = $register_conn->query("SELECT * FROM `SCHEMATA` WHERE SCHEMA_NAME = 'dem'");
			$existe_bd = $info->num_rows;
			$register_conn->close;

			if($existe_bd==1) {
				$bodyRequest = file_get_contents("php://input");
				$data = json_decode($bodyRequest);

				$sql_persona = sprintf("INSERT INTO persona(cedula,nombres,apellidos,email,telefono,fecha_de_nacimiento,id_usuario) VALUES('%s','%s','%s','%s','%s','%s','%s')", $data->cedula, $data->nombres, $data->apellidos,$data->email,$data->telefono,$data->fecha_de_nacimiento,$data->id_usuario);
				$sql_usuario = sprintf("INSERT INTO usuario(cedula,clave,nivel,id_usuario) VALUES('%s',SHA1('%s'),'%s','%s')", $data->cedula, base64_decode($data->clave), $data->nivel,$data->id_usuario);
				$sql_tipo_persona = sprintf("INSERT INTO persona_tipo(cedula,tipo_persona) VALUES('%s',9)", $data->cedula);


				$register_conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
				$info = $register_conn->query($sql_persona);

				if($info) {
					$info = $register_conn->query($sql_usuario);
					if($info) {
						$info = $register_conn->query($sql_tipo_persona);

						if($info) {
							
								print_json(200, "OK", null);
							
						} else {
							print_json(201, "Not Content", null);
						}
						
					} else {
						print_json(201, "Not Content", null);
					}
				} else {
					print_json(201, "Not Content", null);
				}
				


			} else {
				print_json(201, "Not Content", null);
			}
			


			



			break;
		default:
			print_json(405, 'Metodo no permitido', null);
			break;
	}

	    

	function print_json($status, $mensaje, $data) {
		header("HTTP/1.1 $status $mensaje");
		header("Content-Type: application/json; charset=UTF-8");

		$response['statusCode'] = $status;
		$response['statusMessage'] = $mensaje;
		$response['data'] = $data;

		echo json_encode($response, JSON_PRETTY_PRINT);
	}


?>
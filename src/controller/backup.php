<?php
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE"); 

	$hoy = getdate();

	if(!isset($_GET['accion']) || empty($_GET['accion'])) {
		print_json(200, "No se ha definido ninguna acción ('Respaldo' para respaldar, 'Restauración' para restaurar)", null);
		exit();
	} else {
		$accion = $_GET['accion'];
	}

	if(!isset($_GET['usuario']) || empty($_GET['usuario'])) {
		print_json(200, "Error en nombre de usuario de MySQL", null);
		exit();
	} else {
		$usuario = $_GET['usuario'];
	}

	if(!isset($_GET['clave']) || empty($_GET['clave'])) {
		print_json(200, "Error en clave de MySQL", null);
		exit();
	} else {
		$clave = $_GET['clave'];
	}

	if(!isset($_GET['basedatos']) || empty($_GET['basedatos'])) {
		print_json(200, "Error en nombre de base de datos de MySQL", null);
		exit();
	} else {
		$basedatos = $_GET['basedatos'];
	}

	if(!isset($_GET['nombre']) || empty($_GET['nombre'])) {
		print_json(200, "Error en nombre de archivo", null);
		exit();
	} else {
        // PARA ASIGNAR DOS DIGITOS AL DIA
		if (strlen($hoy['mday']) == 1) {
			$hoy['mday'] = "0" . $hoy['mday'];
		} 

        // PARA ASIGNAR DOS DIGITOS AL MES
		if (strlen($hoy['mon']) == 1) {
			$hoy['mon'] = "0" . $hoy['mon'];
		} 
        // PARA CREAR LA CARPETA CORRESPONDIENTE AL DIA
		$fecha = $hoy['mday'] . "-" . $hoy['mon'] . "-" . $hoy['year'];
		// ------------------------------------------------------------------//


		if(!file_exists("../backup")) {
			mkdir("../backup",0777);
		} 
		if(!file_exists("../backup" . "/" . $hoy['year'])) {
			mkdir("../backup" . "/" . $hoy['year'],0777);
		} 
		if(!file_exists("../backup" . "/" . $hoy['year']. "/" . $hoy['mon'])) {
			mkdir("../backup" . "/" . $hoy['year']. "/" . $hoy['mon'],0777);
		} 
		if(!file_exists("../backup" . "/" . $hoy['year']. "/" . $hoy['mon'] . "/" . $hoy['mday'])) {
			mkdir("../backup" . "/" . $hoy['year']. "/" . $hoy['mon'] . "/" . $hoy['mday'],0777);
		} 
		
		$nombre = explode("/",$_GET['nombre']);
		$nombre = array_pop($nombre);
		$ruta = "../backup" . "/" . $hoy['year']. "/" . $hoy['mon'] . "/" . $hoy['mday'] . "/" . $nombre . ".sql";
		


		
		
		
	}
	
	switch ($accion) {
		case "Respaldo":
				$salida = shell_exec(sprintf("mysqldump --user=%s --password=%s %s > %s",$usuario,$clave,$basedatos,$ruta));
				if(file_exists($ruta)) {
					//shell_exec(sprintf('chmod -R 777 %s',$ruta));
					chmod($ruta, 0777);
					$sql = @file_get_contents($ruta);

					if(!empty($sql)) {

						$dias = array(
							0 => "Domingo", 
							1 => "Lunes", 
							2 => "Martes", 
							3 => "Miércoles", 
							4 => "Jueves", 
							5 => "Viernes", 
							6 => "Sábado"
						);


						$array = array();
						$array['nombre'] = $nombre;
						$array['ruta'] = $ruta;
						$array['tamano'] = stat($ruta)['size'] / 1000 . " KB";
						$array['dia'] = idate('w',stat($ruta)['atime']);
						$array['fecha'] = idate('d',stat($ruta)['atime']) . "/" . idate('m',stat($ruta)['atime']) . "/" . idate('Y',stat($ruta)['atime']);
						$array['hora'] = idate('H',stat($ruta)['atime']) . ":" . idate('i',stat($ruta)['atime']);

						foreach ($dias as $key => $value) {
							# code...
							if($array['dia'] == $key) {
								$array['dia'] = $value;
							}
 						}

						print_json(200, "Comando ejecutado", $array);
					} else {
						print_json(200, "Comando no ejecutado", null);
					}

				} else {
					print_json(200, "El archivo no ha sido creado", null);
				}

			
			break;
		case "Restauracion":
		
				if(!isset($_GET['ruta']) || empty($_GET['ruta'])) {
					print_json(200, "No se ha definido ninguna ruta", null);
					exit();
				} else {
					$ruta = $_GET['ruta'];
				}

				if(file_exists($ruta)) {
					$salida = shell_exec(sprintf("mysql --user=%s --password=%s %s < %s",$usuario,$clave,$basedatos,$ruta));
					
					$arr['mensaje'] = "El archivo se ha restaurado de manera éxitosa";
					print_json(200, "OK", $arr['mensaje']);

				} else {
					$arr['mensaje'] = "El archivo que intentas restaurar no existe o se ha eliminado";
					print_json(200, "OK", $arr['mensaje']);
				}
				
			
			break;
		
		default:
			print_json(200, "Acción indefinida", null);
			break;
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
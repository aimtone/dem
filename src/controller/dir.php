<?php 
	header("Access-Control-Allow-Origin: *");
	// Permite la ejecucion de los metodos
	header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE"); 
	
	switch ($_SERVER['REQUEST_METHOD']) {

		case 'GET':
            $directorio = $_GET['directorio'];
			$directorio = opendir($directorio); //ruta actual
			$contador = 0;

			while ($archivo = readdir($directorio)) //obtenemos un archivo y luego otro sucesivamente
			{
			    if (!is_dir($archivo))//verificamos si es o no un directorio
			    {
			        $listado[$contador] = $archivo;
			    }
			  $contador++;
			}
			

			$listado = array_values($listado);

			$contador = 0;
			$arr = array();
			foreach ($listado as $item) {
				# code...
				$arr[$contador]['item'] = $item;
				if(is_dir($_GET['directorio'] . "/" . $item)) {
					$arr[$contador]['is_dir'] = true;
				} else {
					$arr[$contador]['is_dir'] = false;
				}
				$contador++;
			}

			array_multisort($arr);
			
			if(count($listado)!=0) {
				print_json(200, true, $arr);
			} else {
				print_json(200, "No existen elementos", null);
			}

			break;
		case 'DELETE':
			$directorio = $_GET['directorio'];
			unlink($directorio);
			print_json(200, "Archivo eliminado", null);
			
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
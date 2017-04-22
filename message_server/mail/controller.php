<?php 
	// Permite la conexion desde cualquier origen
	header("Access-Control-Allow-Origin: *");
	// Permite la ejecucion de los metodos
	header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");  
	// Se incluye el archivo que contiene la clase generica
	include 'class.phpmailer.php';
	include 'class.smtp.php';

	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth = true;
	$mail->SMTPSecure = "ssl";
	$mail->Host = "smtp.gmail.com";
	$mail->Port = 465;
	$mail->Username ='dem.sanfelipe@gmail.com';
	$mail->Password = 'qwertyuiop1234567890';

	$bodyRequest = file_get_contents("php://input");
	$array = json_decode($bodyRequest, true);
			
	$correo = $_GET['correo'];
	$asunto = $_GET['asunto'];
	$mensaje = $_GET['mensaje'];
	$html = $_GET['html'];
	$destinatario = $_GET['nombre'];

	$mail->AddAddress($correo, $destinatario);
	$mail->Subject = $asunto;
	$mail->isHTML(true);
	$mail->Body = $mensaje;
	$mail->MsgHTML = $html;

	if($mail->Send())
	{
		print_json(200, "Mensaje enviado", $_GET);
	}
	else{
		print_json(200, "Mensaje no enviado", $_GET);
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
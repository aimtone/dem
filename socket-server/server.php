<?php
// prevent the server from timing out
set_time_limit(0);

// include the web sockets server script (the server is started at the far bottom of this file)
require 'class.PHPWebSocket.php';
require '/var/www/html/dem/src/core/db_model.php';

// when a client sends data to the server
function wsOnMessage($clientID, $message, $messageLength, $binary) {
	global $Server;
	$ip = long2ip( $Server->wsClients[$clientID][6] );

	// check if message length is 0
	if ($messageLength == 0) {
		$Server->wsClose($clientID);
		return;
	}

	//The speaker is the only person in the room. Don't let them feel lonely.
	if ( sizeof($Server->wsClients) == 1 )
		$Server->wsSend($clientID, "Cliente Unico");
	else
		//Send the message to everyone but the person who said it
		foreach ( $Server->wsClients as $id => $client )
			if ( $id != $clientID )
				$Server->wsSend($id, "$message");
}

// when a client connects
function wsOnOpen($clientID)
{
	global $Server;
	$ip = long2ip( $Server->wsClients[$clientID][6] );

	//$Server->log( "$ip ($clientID) se ha conectado." );

	//Send a join notice to everyone but the person who joined
	//foreach ( $Server->wsClients as $id => $client )
	//	if ( $id != $clientID )
	//		$Server->wsSend($id, "Usuario $clientID se ha unido a la sala.");
}

// when a client closes or lost connection
function wsOnClose($clientID, $status) {
	global $Server;
	$ip = long2ip( $Server->wsClients[$clientID][6] );

	//$Server->log( "Usuario $clientID se ha desconectado." );

	//Send a user left notice to everyone in the room
	//foreach ( $Server->wsClients as $id => $client )
	//	$Server->wsSend($id, "Usuario $clientID ha abandonado la sala.");
}

// start the server

$credentials = new db_model();
$credentials = $credentials->get_query("SELECT * FROM config_notificaciones");
$Server = new PHPWebSocket();
$Server->bind('message', 'wsOnMessage');
$Server->bind('open', 'wsOnOpen');
$Server->bind('close', 'wsOnClose');
// for other computers to connect, you will probably need to change this to your LAN IP or external IP,
// alternatively use: gethostbyaddr(gethostbyname($_SERVER['SERVER_NAME']))
$Server->wsStartServer($credentials["0"]["socket_address"], $credentials["0"]["socket_port"]);

?>

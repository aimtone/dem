var langu = function(lang) {
	$http.get("assets/lang/" + lang + ".json").then(function (response) {
	    console.log(response);
	    //Materialize.toast(response.data.statusMessage, 4000);
	}, function(response) {
	    // Aqui va el codigo en caso de error
	});
}
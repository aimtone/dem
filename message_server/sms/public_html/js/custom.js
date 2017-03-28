		var app = angular.module('crud',['ngRoute']);

		// Configuracion de las rutas y sus respectivas plantillas
		app.config(function($routeProvider) {
		  $routeProvider
		            .when('/', {
		                templateUrl : 'assets/templates/mensaje.html',
		                controller  : 'mensaje'
		            })
		            

		          
		    });

		// Controlador de la entidad Usuario donde se incluiran cada una de sus funciones
		app.controller('mensaje', function($scope,$http) {

			$scope.message = 'Servidor de SMS';
	        $scope.subtitle = "Prefijo Internacional + Codigo + Numero de Telefono";


			// Al cargar la pagina, ejecutamos la funcion get() para rellenar la tabla
		    angular.element(document).ready(function () {
		    	$scope.get("");
		    	setInterval(function() {
		    		$scope.get("");
		    	}, 5000);
		    	
		    	
		    });

		    // La funcion get() que hace la solicitud para obtener los datos
		    $scope.get = function(id){
		    	// Si la Id esta en blanco, entonces la solicitud es general
		    	if(id=="") {
		    		$http.get("api/outbox").then(function (response) {
				        $scope.lista = response.data.data;
				        //Materialize.toast(response.data.statusMessage, 4000);
				    }, function(response) {
				    	// Aqui va el codigo en caso de error
				    });
				// Si la Id no esta en blanco, la solicitud se hace a un elemento especifico
		    	} else {
		    		$http.get("api/outbox/" + id).then(function (response) {
				        $scope.nuevo = response.data.data[0];
				        Materialize.toast(response.data.statusMessage, 4000);
				    }, function(response) {
				    	// Aqui va el codigo en caso de error
				    });
		    	}
		    }

		    // La funcion post() que hace la solicitud para publicar un nuevo elemento
		    $scope.post = function() {
		    	$http.post("api/outbox", $scope.nuevo)
			    	.then(function (response){
			            Materialize.toast(response.data.statusMessage, 4000);
			            $scope.nuevo = null;
			            $scope.get("");
			        }, 
			        function(response) {
			        	// Aqui va el codigo en caso de error
			        });
		    }

		    // La funcion put() que hace la solicitud para modificar un elemento especifico
		    $scope.put = function(id) {
		 
		    	$http.put("api/outbox/" + id, $scope.nuevo)
			    	.then(
			    		function (response){
			            Materialize.toast(response.data.statusMessage, 4000);
			            $scope.nuevo = null;
			            $scope.get("");
			        }, 
			        function(response) {
			        	// Aqui va el codigo en caso de error
			        });

		    }

		    // La funcion delete() que hace la solicitud para eliminar un elemeto esepecifico
		    $scope.delete = function(id) {
		    	$http.delete("api/outbox/" + id)
				   .then(
				       function (response){
				         console.log(response);
				         Materialize.toast(response.data.statusMessage, 4000);
				         $scope.nuevo = null;
				         $scope.get("");
				       }, 
				       function (response){
				         // Aqui va el codigo en caso de error
				       }
				    );
		    }

		});






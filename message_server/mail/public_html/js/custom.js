		var app = angular.module('crud',['ngRoute']);

		// Configuracion de las rutas y sus respectivas plantillas
		app.config(function($routeProvider) {
		  $routeProvider
		            .when('/', {
		                templateUrl : 'templates/mensaje.html',
		                controller  : 'mensaje'
		            })
		            

		          
		    });

		// Controlador de la entidad Usuario donde se incluiran cada una de sus funciones
		app.controller('mensaje', function($scope,$http) {

			$scope.message = 'Servidor de Correo';
	        $scope.subtitle = "Envie un mensaje de correo electronico";

	        $scope.get = function(){
		    	// Si la Id esta en blanco, entonces la solicitud es general
		    		var config = {
					 params: $scope.nuevo,
					 headers : {'Accept' : 'application/json'}
					};
		    		$http.get("api", config).then(function (response) {
				        $scope.lista = response.data.data;
				        Materialize.toast(response.data.statusMessage, 4000);
				        $scope.nuevo = null;
				    }, function(response) {
				    	// Aqui va el codigo en caso de error
				    });
				// Si la Id no esta en blanco, la solicitud se hace a un elemento especifico
		    	} 

			

		});






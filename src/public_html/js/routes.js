		// Configuracion de las rutas y sus respectivas plantillas
		app.config(function($routeProvider) {
		  $routeProvider
		            .when('/', {
		                templateUrl : 'assets/templates/home.html',
		                controller  : 'home'
		            })
		            .when('/defensor', {
		                templateUrl : 'assets/templates/defensor.html',
		                controller  : 'defensor'
		            })
		            .otherwise({
			            redirectTo: '/'
			        });



		    });
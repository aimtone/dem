		// Configuracion de las rutas y sus respectivas plantillas
		app.config(function($routeProvider) {
		  $routeProvider
		            .when('/', {
		                templateUrl : 'assets/templates/home.html?ver=1.0',
		                controller  : 'home'
		            })
		            .when('/defensor', {
		                templateUrl : 'assets/templates/defensor.html?ver=1.0',
		                controller  : 'defensor'
		            })
		            .when('/secretaria', {
		                templateUrl : 'assets/templates/secretaria.html?ver=1.0',
		                controller  : 'secretaria'
		            })
		            .when('/alguacil', {
		                templateUrl : 'assets/templates/alguacil.html?ver=1.0',
		                controller  : 'alguacil'
		            })
		            .when('/imputado', {
		                templateUrl : 'assets/templates/imputado.html?ver=1.0',
		                controller  : 'imputado'
		            })
		            .when('/juez', {
		                templateUrl : 'assets/templates/juez.html?ver=1.0',
		                controller  : 'juez'
		            })
		            .when('/victima', {
		                templateUrl : 'assets/templates/victima.html?ver=1.0',
		                controller  : 'victima'
		            })
		            .when('/testigo', {
		                templateUrl : 'assets/templates/testigo.html?ver=1.0',
		                controller  : 'testigo'
		            })
		            .when('/fiscal', {
		                templateUrl : 'assets/templates/fiscal.html?ver=1.0',
		                controller  : 'fiscal'
		            })
		            .when('/sala', {
		                templateUrl : 'assets/templates/sala.html?ver=1.0',
		                controller  : 'sala'
		            })
		            .when('/tribunal', {
		                templateUrl : 'assets/templates/tribunal.html?ver=1.0',
		                controller  : 'tribunal'
		            })
		            .when('/tipo_de_tribunal', {
		                templateUrl : 'assets/templates/tipo_de_tribunal.html?ver=1.0',
		                controller  : 'tipo_de_tribunal'
		            })
		            .otherwise({
			            redirectTo: '/'
			        });



		    });
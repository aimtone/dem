		// Configuracion de las rutas y sus respectivas plantillas
		app.config(function($routeProvider) {
		  $routeProvider
		            .when('/', {
		                templateUrl : 'assets/templates/home.html?ver=1.0',
		                controller  : 'home',
		                data: {
							authorized: [1,2,3,4]
						}
		            })
					.when('/login', {
		                templateUrl : 'assets/templates/login.html?ver=1.0',
		                controller  : 'login'
		            })
					.when('/programador', {
		                templateUrl : 'assets/templates/programador.html?ver=1.0',
		                controller  : 'programador',
		                data: {
							authorized: [1,2,3]
						}
		            })
					.when('/programador/:fecha', {
		                templateUrl : 'assets/templates/programador.html?ver=1.0',
		                controller  : 'programador',
		                data: {
							authorized: [1,2,3]
						}
		            })
					.when('/programador/:fecha/:id', {
		                templateUrl : 'assets/templates/acto.html?ver=1.0',
		                controller  : 'acto',
		                data: {
							authorized: [1,2,3]
						}
		            })

		            .when('/defensor', {
		                templateUrl : 'assets/templates/defensor.html?ver=1.0',
		                controller  : 'defensor',
		                data: {
							authorized: [1,2]
						}
		            })
		            .when('/secretaria', {
		                templateUrl : 'assets/templates/secretaria.html?ver=1.0',
		                controller  : 'secretaria',
		                data: {
							authorized: [1,2]
						}
		            })
		            .when('/alguacil', {
		                templateUrl : 'assets/templates/alguacil.html?ver=1.0',
		                controller  : 'alguacil',
		                data: {
							authorized: [1,2]
						}
		            })
		            .when('/imputado', {
		                templateUrl : 'assets/templates/imputado.html?ver=1.0',
		                controller  : 'imputado',
		                data: {
							authorized: [1,2]
						}
		            })
		            .when('/juez', {
		                templateUrl : 'assets/templates/juez.html?ver=1.0',
		                controller  : 'juez',
		                data: {
							authorized: [1,2]
						}
		            })
		            .when('/victima', {
		                templateUrl : 'assets/templates/victima.html?ver=1.0',
		                controller  : 'victima',
		                data: {
							authorized: [1,2]
						}
		            })
		            .when('/testigo', {
		                templateUrl : 'assets/templates/testigo.html?ver=1.0',
		                controller  : 'testigo',
		                data: {
							authorized: [1,2]
						}
		            })
		            .when('/fiscal', {
		                templateUrl : 'assets/templates/fiscal.html?ver=1.0',
		                controller  : 'fiscal',
		                data: {
							authorized: [1,2]
						}
		            })
		            .when('/usuario', {
		                templateUrl : 'assets/templates/usuario.html?ver=1.0',
		                controller  : 'usuario',
		                data: {
							authorized: [1]
						}
		            })
		            .when('/sala', {
		                templateUrl : 'assets/templates/sala.html?ver=1.0',
		                controller  : 'sala',
		                data: {
							authorized: [1,2]
						}
		            })
		            .when('/tribunal', {
		                templateUrl : 'assets/templates/tribunal.html?ver=1.0',
		                controller  : 'tribunal',
		                data: {
							authorized: [1,2]
						}
		            })
					.when('/acto', {
		                templateUrl : 'assets/templates/acto.html?ver=1.0',
		                controller  : 'acto',
		                data: {
							authorized: [1,2,3]
						}
		            })
					.when('/actos', {
		                templateUrl : 'assets/templates/actos.html?ver=1.0',
		                controller  : 'actos',
		                data: {
							authorized: [1,2,3]
						}
		            })
					.when('/casos', {
		                templateUrl : 'assets/templates/casos.html?ver=1.0',
		                controller  : 'casos',
		                data: {
							authorized: [1,2,3]
						}
		            })
					.when('/respaldo', {
		                templateUrl : 'assets/templates/respaldo.html?ver=1.0',
		                controller  : 'respaldo',
		                data: {
							authorized: [1]
						}
		            })
					.when('/bitacora', {
		                templateUrl : 'assets/templates/bitacora.html?ver=1.0',
		                controller  : 'bitacora',
		                data: {
							authorized: [1]
						}
		            })
					.when('/mensajes', {
		                templateUrl : 'assets/templates/mensajes.html?ver=1.0',
		                controller  : 'mensajes',
		                data: {
							authorized: [1,2]
						}
		            })
					.when('/caso', {
		                templateUrl : 'assets/templates/caso.html?ver=1.0',
		                controller  : 'caso',
		                data: {
							authorized: [1,2,3]
						}
		            })
		            .when('/tipo_de_tribunal', {
		                templateUrl : 'assets/templates/tipo_de_tribunal.html?ver=1.0',
		                controller  : 'tipo_de_tribunal',
		                data: {
							authorized: [1,2]
						}
		            })
					.when('/ajustes', {
		                templateUrl : 'assets/templates/ajustes.html?ver=1.0',
		                controller  : 'ajustes',
		                data: {
							authorized: [1]
						}
		            })
					.when('/404', {
		                templateUrl : 'assets/error/404.html?ver=1.0',
		                controller  : '',
		                data: {
							authorized: [1,2,3,4]
						}
		            })
		            .otherwise({
			            redirectTo: '/404'
			        });



		    });


		app.run(function($rootScope, $location,$window)
			{
				$rootScope.$on('$routeChangeStart', function (event, next) 
				{
					setTimeout(function() {
							console.log("entra en run");


					        if (next.data !== undefined) 
					        {
					        	console.log($rootScope.current_user);
					            if(next.data.authorized.indexOf($rootScope.current_user) !== -1)
								{
									//alert("bienvenido");
								}
								else
								{
									$window.location.href = '#!/';
									
								}
					        }

					        if($rootScope.nuevo_respaldo == false) {
					        	$rootScope.get('api/config_generales').then(function(response) {
									$rootScope.atributos = {
										usuario : response["0"].usuario,
										clave : response["0"].clave,
										basedatos: response["0"].basedatos

									};


									$rootScope.get('back-up?accion=Respaldo&usuario='+$rootScope.atributos.usuario+'&clave='+$rootScope.atributos.clave+'&nombre=backup&basedatos='+$rootScope.atributos.basedatos).then(function(response) {
										console.log("Respaldo automatico creado");
										$rootScope.nuevo_respaldo = true;

									});
								});
					        }

					        

					}, 100);
					
			    });
			});
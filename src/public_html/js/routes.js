		// Configuracion de las rutas y sus respectivas plantillas
		app.config(function($routeProvider) {

		
		  var acceso = {
		  	"/" : [1,2,3,4],
		  	"/perfil": [1,2,3,4],
		  	"/programador" : [1,2,3],
		  	"/programador/:fecha" : [1,2,3],
		  	"/programador/:fecha/:id" : [1,2,3],
		  	"/defensor" : [1,2],
		  	"/secretaria" : [1,2],
		  	"/alguacil" : [1,2],
		  	"/imputado" : [1,2],
		  	"/juez" : [1,2],
		  	"/actividad" : [1,2],
		  	"/victima" : [1,2],
		  	"/testigo" : [1,2],
		  	"/fiscal" : [1,2],
		  	"/sala" : [1,2],
		  	"/tribunal" : [1,2],
		  	"/tipo_de_tribunal" : [1,2],
		  	"/usuario" : [1],
		  	"/acto" : [1,2,3],
		  	"/actos" : [1,2,3],
		  	"/caso" : [1,2,3],
		  	"/casos" : [1,2,3],
		  	"/bitacora" : [1],
		  	"/respaldo" : [1],
		  	"/mensajes" : [1,2],
		  	"/notificaciones" : [1,2,3,4],
		  	"/ajustes" : [1],
		  	"/nivel" : [1],
		  	"/presentacion" : [1,4]
		  };



		  $routeProvider
		            .when('/', {
		                templateUrl : 'assets/templates/home.html?ver=1.0',
		                controller  : 'home',
		                data: {
							authorized: acceso["/"]
						}
		            })
		            .when('/perfil', {
		                templateUrl : 'assets/templates/perfil.html?ver=1.0',
		                controller  : 'perfil',
		                data: {
							authorized: acceso["/perfil"]
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
							authorized: acceso["/programador"]
						}
		            })
					.when('/programador/:fecha', {
		                templateUrl : 'assets/templates/programador.html?ver=1.0',
		                controller  : 'programador',
		                data: {
							authorized: acceso["/programador/:fecha"]
						}
		            })
					.when('/programador/:fecha/:id', {
		                templateUrl : 'assets/templates/acto.html?ver=1.0',
		                controller  : 'acto',
		                data: {
							authorized: acceso["/programador/:fecha/:id"]
						}
		            })

		            .when('/defensor', {
		                templateUrl : 'assets/templates/defensor.html?ver=1.0',
		                controller  : 'defensor',
		                data: {
							authorized: acceso["/defensor"]
						}
		            })
		            .when('/secretaria', {
		                templateUrl : 'assets/templates/secretaria.html?ver=1.0',
		                controller  : 'secretaria',
		                data: {
							authorized: acceso["/secretaria"]
						}
		            })
		            .when('/alguacil', {
		                templateUrl : 'assets/templates/alguacil.html?ver=1.0',
		                controller  : 'alguacil',
		                data: {
							authorized: acceso["/alguacil"]
						}
		            })
		            .when('/imputado', {
		                templateUrl : 'assets/templates/imputado.html?ver=1.0',
		                controller  : 'imputado',
		                data: {
							authorized: acceso["/imputado"]
						}
		            })
		            .when('/juez', {
		                templateUrl : 'assets/templates/juez.html?ver=1.0',
		                controller  : 'juez',
		                data: {
							authorized: acceso["/juez"]
						}
		            })
		            .when('/victima', {
		                templateUrl : 'assets/templates/victima.html?ver=1.0',
		                controller  : 'victima',
		                data: {
							authorized: acceso["/victima"]
						}
		            })
		            .when('/testigo', {
		                templateUrl : 'assets/templates/testigo.html?ver=1.0',
		                controller  : 'testigo',
		                data: {
							authorized: acceso["/testigo"]
						}
		            })
		            .when('/fiscal', {
		                templateUrl : 'assets/templates/fiscal.html?ver=1.0',
		                controller  : 'fiscal',
		                data: {
							authorized: acceso["/fiscal"]
						}
		            })
		            .when('/usuario', {
		                templateUrl : 'assets/templates/usuario.html?ver=1.0',
		                controller  : 'usuario',
		                data: {
							authorized: acceso["/usuario"]
						}
		            })
		            .when('/sala', {
		                templateUrl : 'assets/templates/sala.html?ver=1.0',
		                controller  : 'sala',
		                data: {
							authorized: acceso["/sala"]
						}
		            })
		            .when('/tribunal', {
		                templateUrl : 'assets/templates/tribunal.html?ver=1.0',
		                controller  : 'tribunal',
		                data: {
							authorized: acceso["/tribunal"]
						}
		            })
		            .when('/actividad', {
		                templateUrl : 'assets/templates/actividad.html?ver=1.0',
		                controller  : 'actividad',
		                data: {
							authorized: acceso["/actividad"]
						}
		            })
					.when('/acto', {
		                templateUrl : 'assets/templates/acto.html?ver=1.0',
		                controller  : 'acto',
		                data: {
							authorized: acceso["/acto"]
						}
		            })
					.when('/actos', {
		                templateUrl : 'assets/templates/actos.html?ver=1.0',
		                controller  : 'actos',
		                data: {
							authorized: acceso["/actos"]
						}
		            })
					.when('/casos', {
		                templateUrl : 'assets/templates/casos.html?ver=1.0',
		                controller  : 'casos',
		                data: {
							authorized: acceso["/casos"]
						}
		            })
					.when('/respaldo', {
		                templateUrl : 'assets/templates/respaldo.html?ver=1.0',
		                controller  : 'respaldo',
		                data: {
							authorized: acceso["/respaldo"]
						}
		            })
		            .when('/nivel', {
		                templateUrl : 'assets/templates/nivel.html?ver=1.0',
		                controller  : 'nivel',
		                data: {
							authorized: acceso["/nivel"]
						}
		            })
					.when('/bitacora', {
		                templateUrl : 'assets/templates/bitacora.html?ver=1.0',
		                controller  : 'bitacora',
		                data: {
							authorized: acceso["/bitacora"]
						}
		            })
					.when('/mensajes', {
		                templateUrl : 'assets/templates/mensajes.html?ver=1.0',
		                controller  : 'mensajes',
		                data: {
							authorized: acceso["/mensajes"]
						}
		            })
					.when('/notificaciones', {
		                templateUrl : 'assets/templates/notificaciones.html?ver=1.0',
		                controller  : 'notificaciones',
		                data: {
							authorized: acceso["/notificaciones"]
						}
		            })
					.when('/caso', {
		                templateUrl : 'assets/templates/caso.html?ver=1.0',
		                controller  : 'caso',
		                data: {
							authorized: acceso["/caso"]
						}
		            })
		            .when('/tipo_de_tribunal', {
		                templateUrl : 'assets/templates/tipo_de_tribunal.html?ver=1.0',
		                controller  : 'tipo_de_tribunal',
		                data: {
							authorized: acceso["/tipo_de_tribunal"]
						}
		            })
					.when('/ajustes', {
		                templateUrl : 'assets/templates/ajustes.html?ver=1.0',
		                controller  : 'ajustes',
		                data: {
							authorized: acceso["/ajustes"]
						}
		            })
		            .when('/presentacion', {
		                templateUrl : 'assets/templates/presentacion.html?ver=1.0',
		                controller  : 'presentacion',
		                data: {
							authorized: acceso["/presentacion"]
						}
		            })
		            .otherwise({
			            redirectTo: '/'
			        });



		    });


		app.run(function($rootScope, $location,$window,$websocket)
			{					
				$rootScope.$on('$routeChangeStart', function (event, next) 
				{
					setTimeout(function() {
							//console.log("entra en run");


					        if (next.data !== undefined) 
					        {
					        	//console.log($rootScope.current_user);
					            if(next.data.authorized.indexOf($rootScope.current_user) !== -1)
								{
									//alert("bienvenido");
									$rootScope.conexion = true;
									// CAMBIAR LOS ESTATUS DE LOS ACTOS A FINALIZADO
								    if($rootScope.x!==false) {
						        		var fecha_hoy = moment().format("YYYY-MM-DD");
						        		var filtro = JSON.stringify({
						        			donde: "where inicio LIKE '"+fecha_hoy+"%' AND estatus = 'ASIGNADO'"
						        		});


						        		$rootScope.get('api/acto?filter='+filtro).then(function(response) {
						        			//console.log(response);
						        			var hora_actual = moment().format("HH:mm:ss");
						        			$.each(response, function(index,value) {
						        				var hora_fin_evento = moment(value.fin).format("HH:mm:ss");
						        				if(hora_fin_evento <= hora_actual) {
						        					var data = {
						        						id: null,
						        						estatus : "FINALIZADO"
						        					};
						        					$rootScope.put('api/acto/'+value.id, data).then(function(response) {
							        					//console.log(response);
							        				});
						        					
						        				} else {
						        					var data = {
						        						id: null,
						        						estatus : "ASIGNADO"
						        					};

						        					$rootScope.put('api/acto/'+value.id, data).then(function(response) {
							        					//console.log(response);
							        				});
						        				}

						        				

						        			});
						        		});
						        	}
									

								}
								else
								{
									$rootScope.conexion = false;
									$window.location.href = '#!/';

									
								}
					        }

					        if($rootScope.nuevo_respaldo == false && $rootScope.x !==false) {
					        	$rootScope.get('api/config_generales').then(function(response) {
									$rootScope.atributos = {
										usuario : response["0"].usuario,
										clave : response["0"].clave,
										basedatos: response["0"].basedatos

									};


									$rootScope.get('back-up?accion=Respaldo&usuario='+$rootScope.atributos.usuario+'&clave='+$rootScope.atributos.clave+'&nombre=backup&basedatos='+$rootScope.atributos.basedatos).then(function(response) {
										//console.log("Respaldo automatico creado");
										$rootScope.nuevo_respaldo = true;

									});
								});
					        }

					        

					}, 100);
					
			    });


				
					
				


				
			});
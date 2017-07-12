		app.controller('respaldo', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateToken();
			$rootScope.objeto = "Respaldo y Restauracion";

			angular.element(document).ready(function() {
				$rootScope.get('api/config_generales').then(function(response) {
					$rootScope.atributos = {
						usuario : response["0"].usuario,
						clave : response["0"].clave,
						basedatos: response["0"].basedatos

					};
				});

				

				$rootScope.volverARaiz();

				$.contextMenu({
					// define which elements trigger this menu
					selector: ".fichero",
					// define the elements of the menu
					items: {
						0: {
							name: "Restaurar", 
							callback: function(key, opt) { 
								var nombre_archivo = $('.selected')["0"].innerText;
								var ruta = $rootScope.rutaActual;
								ruta = ruta + "/" + nombre_archivo;
								ruta = ruta.split("=");
								ruta = ruta[1].trim();

								$rootScope.confirm("Esta seguro","mensaje", "info", function() {
									$rootScope.get('back-up?accion=Restauracion&usuario='+$rootScope.atributos.usuario+'&clave='+$rootScope.atributos.clave+'&nombre='+nombre_archivo+'&basedatos='+$rootScope.atributos.basedatos+'&ruta='+ruta).then(function(response) {
										$rootScope.timerAlert("Operacion terminada", response, 1000);

									}, function(response) {
										$rootScope.alert("Error", "La peticion ha sido ignorada", "info");

									});
								});

								
								
							}
						},
						1: {
							name: "Eliminar", 
							callback: function(key, opt, event) { 
								var nombre_archivo = $('.selected')["0"].innerText;
								var ruta = $rootScope.rutaActual;
								ruta = ruta + "/" + nombre_archivo;
								$rootScope.confirm("Desea eliminar el archivo '" + nombre_archivo + "'", "una vez eliminado ya no podra recuperarlo", "info", function() {
									$rootScope.delete(ruta).then(function(response) {
										$rootScope.cargarRuta($rootScope.rutaActual);
										$rootScope.timerAlert("Eliminado", "El archivo ha sido eliminado del servidor", 1000);
									}, function() {
										$rootScope.alert("Error", "La peticion ha sido ignorada", "info");
									});
								});
								
							}
						}
						
					}
					// there's more, have a look at the demos and docs...
				});
			});

			$rootScope.cargarDirectorio = function(ruta) {
				var rutaNueva =$rootScope.rutaActual + "/" + ruta;


				$rootScope.get(rutaNueva).then(function(response) {
					$rootScope.directorio = response;
					$rootScope.rutaActual = rutaNueva;
				}, function(response) {
					// en caso de error
					console.log(response);

				});
			};

			$rootScope.cargarRuta = function(ruta) {
				$rootScope.get(ruta).then(function(response) {
					$rootScope.directorio = response;
					$rootScope.rutaActual = ruta;
				}, function(response) {
					// en caso de error
					console.log(response);

				});
			};

			$rootScope.seleccionarFichero = function(e) {
				$('.fichero').removeClass('selected');
				$(e.currentTarget).addClass('selected');
			};


			$rootScope.crearNuevo = function() {
				$rootScope.prompt("Crear nuevo respaldo","Por favor, introduce un nombre para el archivo","",
				function(response) {
					$rootScope.atributos.nombre = response;

				
					$rootScope.get('back-up?accion=Respaldo&usuario='+$rootScope.atributos.usuario+'&clave='+$rootScope.atributos.clave+'&nombre='+$rootScope.atributos.nombre+'&basedatos='+$rootScope.atributos.basedatos).then(function(response) {
						$rootScope.cargarRuta($rootScope.rutaActual);

						$rootScope.alert("Archivo '"+response.nombre+"' creado","Ruta de Almacenamiento: " + response.ruta.slice(10),"info");

					});
				},
				function() {}, "text"
				);


			};

			$rootScope.volverARaiz = function() {
				$rootScope.rutaActual = 'dir?directorio=../backup';
				$rootScope.cargarRuta($rootScope.rutaActual);
			};

			$rootScope.irAtras = function() {
				
				var rutaSplit = $rootScope.rutaActual.split('/');
				rutaSplit.pop();
				ruta = rutaSplit.join('/');


				if(rutaSplit.length!=1) {
					$rootScope.cargarRuta(ruta);
				}
				
				
			
				

			};
			
			
		});
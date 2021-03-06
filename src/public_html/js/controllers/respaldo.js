		app.controller('respaldo', function($rootScope, $scope, $http, $localStorage, $location) {
		    $rootScope.validateToken();
		    $rootScope.objeto = "Respaldo";

		    angular.element(document).ready(function() {
		        $rootScope.get('api/config_generales').then(function(response) {
		            $rootScope.atributos = {
		                usuario: response["0"].usuario,
		                clave: response["0"].clave,
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

		                        $rootScope.confirm("¿Está seguro que desea restaurar la información de este archivo?", "Al aceptar, se resturará toda la información almacenada hasta esta fecha?", "info", function() {
		                            $rootScope.get('back-up?accion=Restauracion&usuario=' + $rootScope.atributos.usuario + '&clave=' + $rootScope.atributos.clave + '&nombre=' + nombre_archivo + '&basedatos=' + $rootScope.atributos.basedatos + '&ruta=' + ruta).then(function(response) {
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

		                        $rootScope.adminConfirm(
		                            function(response) {

		                                var clave = $rootScope.sha1(md5(response));

		                                var filter = JSON.stringify({
		                                    donde: "where nivel = 'ADMINISTRADOR' AND id_usuario = 0 AND clave = '" + clave + "'"
		                                });

		                                $rootScope.get('api/usuario?filter=' + filter).then(function(response) {
		                                    console.log(response);

		                                    if (typeof response != "undefined") {
		                                        $rootScope.delete(ruta).then(function(response) {
		                                            $rootScope.cargarRuta($rootScope.rutaActual);
		                                            $rootScope.timerAlert("Eliminado", "El archivo ha sido eliminado del servidor", 1000);
		                                        }, function() {
		                                            $rootScope.alert("Error", "La peticion ha sido ignorada", "info");
		                                        });




		                                    } else {
		                                        $rootScope.timerAlert("Clave incorrecta", "Tu clave de administrador no coincide", 2000);
		                                    }
		                                });

		                            },
		                            function() {
		                                // Al cancelar
		                            }
		                        );



		                    }
		                }

		            }
		            // there's more, have a look at the demos and docs...
		        });


		        $('#imgCont').css({
		            height: (innerHeight - 200) + "px"
		        });
		    });

		    $rootScope.cargarDirectorio = function(ruta) {
		        var rutaNueva = $rootScope.rutaActual + "/" + ruta;


		        $rootScope.get(rutaNueva).then(function(response) {

		            $rootScope.directorio = response;
		            $rootScope.rutaActual = rutaNueva;
		        }, function(response) {
		            // en caso de error
		            //console.log(response);

		        });
		    };

		    $rootScope.cargarRuta = function(ruta) {
		        $rootScope.get(ruta).then(function(response) {
		            $rootScope.directorio = response;
		            $rootScope.rutaActual = ruta;
		        }, function(response) {
		            // en caso de error
		            //console.log(response);

		        });
		    };

		    $rootScope.seleccionarFichero = function(e) {
		        $('.fichero').removeClass('selected');
		        $(e.currentTarget).addClass('selected');
		    };


		    $rootScope.crearNuevo = function() {
		        $rootScope.prompt("Crear nuevo respaldo", "Por favor, introduce un nombre para el archivo", "",
		            function(response) {
		                $rootScope.atributos.nombre = response;


		                $rootScope.get('back-up?accion=Respaldo&usuario=' + $rootScope.atributos.usuario + '&clave=' + $rootScope.atributos.clave + '&nombre=' + $rootScope.atributos.nombre + '&basedatos=' + $rootScope.atributos.basedatos).then(function(response) {
		                    $rootScope.cargarRuta($rootScope.rutaActual);

		                    $rootScope.alert("Archivo '" + response.nombre + "' creado", "Ruta de Almacenamiento: " + response.ruta.slice(10), "info");

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


		        if (rutaSplit.length != 1) {
		            $rootScope.cargarRuta(ruta);
		        }





		    };


		});
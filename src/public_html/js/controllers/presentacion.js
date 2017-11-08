		app.controller('presentacion', function($rootScope, $scope, $http, $localStorage, $location) {
		    $rootScope.validateToken();
		    $rootScope.objeto = "Presentación de Acto";
		    $rootScope.personas = [];
		    $scope.caso = "";
		    $scope.status = "";




		    $scope.buscarActo = function() {
		        $scope.actoHallado = {};
		        if (typeof $scope.causa == "undefined") {
		            $rootScope.personas = [];
		            $rootScope.toast("Por favor, rellene el campo");

		        } else {
		            if (isNaN($scope.causa)) {

		                var actoHallado = false;
		                var filter = JSON.stringify({
		                    donde: "WHERE numero = '" + $scope.causa + "'"
		                });

		                $rootScope.get('api/acto_sala?filter=' + filter).then(function(data) {


		                    if (typeof data != "undefined") {
		                        for (var i = 0; i < data.length; i++) {
		                            if (moment(data[i].start).format("YYYYMMDD") == moment(new Date()).format("YYYYMMDD")) {


		                                $scope.actoHallado = data[i];
		                                $scope.actoHallado.fecha = moment($scope.actoHallado.start).format('DD/MM/YYYY');
		                                $scope.actoHallado.start = moment($scope.actoHallado.start).format('h:mm a');
		                                $scope.actoHallado.end = moment($scope.actoHallado.end).format('h:mm a');

		                                $scope.status = $scope.actoHallado.estatus;

		                                actoHallado = true;
		                                break;
		                            } else {
		                                actoHallado = false;
		                                $scope.actoHallado = null;
		                            }
		                        }

		                    } else {
		                        $rootScope.toast("No se ha encontrado ningún acto");
		                        $rootScope.personas = [];
		                        $scope.actoHallado = null;
		                        return;
		                    }



		                    if (actoHallado) {
		                        // Cargar funciones extras

		                        $scope.cargarPersonas($scope.actoHallado.numero);
		                        $rootScope.desdePresentacion = true;
		                        $rootScope.clave_caso = $scope.causa;
		                        $scope.causa = "";
		                    } else {
		                        $rootScope.toast("No se ha encontrado ningún acto");
		                        $rootScope.personas = [];
		                    }
		                });



		            } else {
		                $rootScope.get('api/acto_sala/' + $scope.causa).then(function(data) {
		                    if (data.length == 1) {
		                        if (moment(data["0"].start).format("YYYYMMDD") == moment(new Date()).format("YYYYMMDD")) {
		                            $scope.actoHallado = data["0"];

		                            $scope.actoHallado.fecha = moment($scope.actoHallado.start).format('DD/MM/YYYY');
		                            $scope.actoHallado.start = moment($scope.actoHallado.start).format('h:mm a');
		                            $scope.actoHallado.end = moment($scope.actoHallado.end).format('h:mm a');

		                            $scope.status = $scope.actoHallado.estatus;

		                            // Cargar funciones extras
		                            $rootScope.desdePresentacion = true;
		                            $rootScope.clave_caso = $scope.causa;
		                            $scope.causa = "";
		                            $scope.cargarPersonas($scope.actoHallado.numero);


		                        } else {
		                            $scope.actoHallado = null;
		                            $rootScope.toast("No se ha encontrado ningún acto");
		                            $rootScope.personas = [];
		                        }


		                    } else {
		                        $rootScope.toast("No se ha encontrado ningún acto");
		                        $rootScope.personas = [];
		                    }
		                }, function(data) {
		                    if (data.status == 404) {
		                        $rootScope.toast("No se ha encontrado ningún acto");
		                        $rootScope.personas = [];
		                    } else {
		                        $rootScope.toast("Ha ocurrido un error inesperado");
		                        $rootScope.personas = [];
		                    }
		                });
		            }



		        }
		    };




		    $scope.cargarPersonas = function(numero_caso) {
		        $rootScope.personas = [];
		        var filtro = {
		            donde: "where numero_caso = '" + numero_caso + "'"
		        };

		        var filter = JSON.stringify(filtro).toString();


		        var tipoPersonas = ["imputado", "victima", "fiscal", "alguacil", "secretaria", "juez", "defensor", "testigo"];

		        for (var x = 0; x < tipoPersonas.length; x++) {

		            $rootScope.get("api/caso_" + tipoPersonas[x] + "?filter=" + filter).then(function(response) {
		                if (typeof response != "undefined") {
		                    var cedula = response["0"].cedula;
		                    var tipo_persona = response["0"].tipo_persona;

		                    var filter = JSON.stringify({
		                        donde: "WHERE cedula = '" + cedula + "'"
		                    });

		                    $rootScope.get('api/persona?filter=' + filter).then(function(response) {
		                        var nombres = response["0"].nombres.split(" ");
		                        nombres = nombres["0"];
		                        var apellidos = response["0"].apellidos.split(" ");
		                        apellidos = apellidos["0"];

		                        console.log(nombres);
		                        var persona = {
		                            cedula: response["0"].cedula,
		                            nombres: nombres,
		                            apellidos: apellidos,
		                            tipoPersona: tipo_persona
		                        };

		                        $rootScope.personas.push(persona);
		                    });
		                }
		            }, function(response) {
		                //console.log(response);
		            });

		        }

		    }

		    $scope.finalizarActo = function() {
		        //alert($scope.actoHallado.id);

		        $rootScope.confirm("¿Estás seguro de que quieres finalizar el acto?", "Una vez realizada esta accion, no se podrá revertir de ninguna manera", "info", function() {
		            var data = {
		                id: null,
		                estatus: "FINALIZADO"
		            };
		            $rootScope.put('api/acto/' + $scope.actoHallado.id, data).then(function(response) {
		                $scope.causa = $scope.actoHallado.id;
		                $scope.buscarActo();
		                $rootScope.enviarNotificacion($rootScope.usuario_en_linea.nombres + " " + $rootScope.usuario_en_linea.apellidos + " HA PUESTO UN ACTO EN ESPERA", "EL USUARIO " + $rootScope.usuario_en_linea.nombres + " " + $rootScope.usuario_en_linea.apellidos + " CUYA CEDULA DE IDENTIDAD ES " + $rootScope.usuario_en_linea.cedula + " HA FINALIZADO EL ACTO NUMERO " + response["0"].id + " DE LA CAUSA " + response["0"].numero_caso + " DE FECHA " + moment(response["0"].inicio).format("DD/MM/YYYY"), "ADMINISTRADOR", null);
		            });
		        }, function() {}, "Finalizar acto", "Cancelar", true);
		    }

		    $scope.diferirActo = function() {
		        //alert($scope.actoHallado.id);

		        $rootScope.confirm("¿Estás seguro de que quieres diferir el acto?", "Una vez realizada esta accion, no se podrá revertir de ninguna manera", "info", function() {
		            var data = {
		                id: null,
		                estatus: "DIFERIDA"
		            };
		            $rootScope.put('api/acto/' + $scope.actoHallado.id, data).then(function(response) {
		                $scope.causa = $scope.actoHallado.id;
		                $scope.buscarActo();
		                $rootScope.enviarNotificacion($rootScope.usuario_en_linea.nombres + " " + $rootScope.usuario_en_linea.apellidos + " HA PUESTO UN ACTO EN ESPERA", "EL USUARIO " + $rootScope.usuario_en_linea.nombres + " " + $rootScope.usuario_en_linea.apellidos + " CUYA CEDULA DE IDENTIDAD ES " + $rootScope.usuario_en_linea.cedula + " HA DIFERIDO EL ACTO NUMERO " + response["0"].id + " DE LA CAUSA " + response["0"].numero_caso + " DE FECHA " + moment(response["0"].inicio).format("DD/MM/YYYY"), "ADMINISTRADOR", null);
		            });
		        }, function() {}, "Diferir acto", "Cancelar", true);
		    }


		    angular.element(document).ready(function() {
		        console.log($rootScope.causa_desde_caso);
		        if ($rootScope.causa_desde_caso != null) {
		            $scope.causa = $rootScope.causa_desde_caso;
		            $scope.buscarActo();
		        }
		    });


		});
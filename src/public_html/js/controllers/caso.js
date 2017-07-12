		app.controller('caso', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateToken();
			$rootScope.objeto = "Caso";


            angular.element(document).ready(function() {
               // $("#cedula").mask("l-99999999");
               
               $('.tooltipped').tooltip({delay: 50});
               $rootScope.tipoDePersonasAgregadas = [];


                $rootScope.get('api/tipo_persona').then(function(response) {
                    //console.log(response);
                    $rootScope.JSONTipoPersona = response;
                }, function(response) {
                    console.log(response);
                });



            });

            $('#post').on('click', function() {
                if($scope.datos==undefined) { $rootScope.toast("Rellene los campos"); return; }
			    if($scope.datos.numero==undefined) {  $rootScope.toast("Campo 'numero' vacio"); return; }
                if($scope.datos.descripcion==undefined) {  $rootScope.toast("Campo 'descripcion' vacio"); return; }

                var filtro = {
                    donde : "where numero = " + +$scope.datos.numero
                };

                var filter = JSON.stringify(filtro).toString();
                $scope.existeCaso = false;
                $rootScope.get('api/caso?filter='+filter).then(function(response) {
                    if(typeof response != "undefined") {
                        $rootScope.toast("Ya existe un caso registrado con ese numero");
                         $scope.existeCaso = true;
                    }
                }, function(response) {
                    $scope.existeCaso = false;
                });

                if($scope.existeCaso == true) {
                    return;
                }

                if($rootScope.tipoDePersonasAgregadas.length!=0) {
                    
                    var existe_imputado = false;
                    var existe_victima = false;
                    for(var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {
                        if($rootScope.tipoDePersonasAgregadas[i].tipo=="imputado") {
                            existe_imputado = true;
                        }
                        if($rootScope.tipoDePersonasAgregadas[i].tipo=="victima") {
                            existe_victima = true;
                        }
                    }

                    if(existe_imputado==false) {
                        $rootScope.toast("Debes agregar por lo menos un imputado");
                        return;
                    }

                    if(existe_victima==false) {
                        $rootScope.toast("Debes agregar por lo menos una victima");
                        return;
                    }


                    $rootScope.post('api/caso', $scope.datos).then(function(response) {
                        if(response != null) {
                            if(response.length==1) {
                                for(var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {

                                    var agregarPersona = {
                                        numero_caso : response["0"].numero,
                                        cedula : $rootScope.tipoDePersonasAgregadas[i].cedula
                                    };

                                    $rootScope.post('api/caso_' + $rootScope.tipoDePersonasAgregadas[i].tipo, agregarPersona).then(function(response) {
                                        //console.log(response);
                                        
                                    }, function(response) {
                                        console.log(response);
                                    });
                                }



                                $scope.datos = {};
                                $rootScope.tipoDePersonasAgregadas = {};
                                $rootScope.alert("Éxito", "El caso ha sido registrado", "info");
                                
                            } else {
                                $rootScope.alert("Error", "Ocurrio un error al intentar registrar el caso", "error");
                            }
                        }
                        
                        
                    });

                } else {
                    $rootScope.toast("Por favor, agrega a las personas involucradas en el caso");
                }

                
            });

            $rootScope.sacarElemento = function(e) {

                $rootScope.tipoDePersonasAgregadas.splice(e.currentTarget.id, 1);

                for(var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {
                    $rootScope.tipoDePersonasAgregadas[i].posicion = i;
                }


            }

            

            $rootScope.buscarPersona = function() {
                if($scope.persona.cedula==undefined) { $rootScope.toast("Ingrese la cedula de la persona para agregar"); return; }
                if($scope.selTipoPersona==undefined) { $rootScope.toast("Por favor, escoja un tipo de persona a agregar"); return; }
                
                var filtro_tipoPersona = {
                    donde: "where id = " + $scope.selTipoPersona
                };
                var filter_tipoPersona = JSON.stringify(filtro_tipoPersona).toString();

                $rootScope.get('api/tipo_persona?filter='+filter_tipoPersona).then(function(response) {
                    $scope.str_tipo_persona = response["0"].descripcion;
                });

                var filtro = {
                    donde: "where cedula = '" + $scope.persona.cedula + "' AND id_tipo_persona = " + $scope.selTipoPersona
                };

                var filter = JSON.stringify(filtro).toString();


                $rootScope.get('api/persona?filter=' + filter).then(function(response) {

                    if(typeof response != "undefined") {
                        
                        var primer_nombre = response["0"].nombres.split(" ");
                        var primer_apellido = response["0"].apellidos.split(" ");

                        var JSONPersonas = {
                            tipo : $scope.str_tipo_persona.toLowerCase(),
                            cedula : response["0"].cedula,
                            nombres: primer_nombre[0] + " " + primer_apellido[0].substr(0,1) + ".",
                            telefono: response["0"].telefono,
                            posicion: $rootScope.tipoDePersonasAgregadas.length
                        };
                        
                        //console.log(JSONPersonas);
                        
                        $scope.agregar = true;
                        for(var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {
                            if(response["0"].cedula==$rootScope.tipoDePersonasAgregadas[i].cedula) {
                                $scope.agregar = false;
                                
                            } else {
                                $scope.agregar = true;
                            }
                        }
                        
                        if($scope.agregar==true) {
                            $rootScope.tipoDePersonasAgregadas.push(JSONPersonas);
                            $scope.persona.cedula = "";
                        } else {
                            $rootScope.toast(primer_nombre[0] + " " + primer_apellido[0] + " ya ha sido agregado como " + $scope.str_tipo_persona.toLowerCase());
                        }
                        

                        //console.log($rootScope.tipoDePersonasAgregadas);
                        

                        
                        
                    } else {
                        $rootScope.toast("No existe un registro con la cedula de identidad ingresada para este tipo de persona");
                    }
                }, function(response) {
                    console.log(response);

                });
            };
			
			
		});
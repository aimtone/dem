		app.controller('caso', function($rootScope,$scope,$http,$localStorage,$location,$window) {
			$rootScope.validateToken();
			$rootScope.objeto = "Caso";
            $scope.datos = {};


            angular.element(document).ready(function() {
               // $("#cedula").mask("l-99999999");
               
               $('.tooltipped').tooltip({delay: 50});
               $rootScope.tipoDePersonasAgregadas = [];
                var filter = JSON.stringify({
                    donde : "where descripcion != 'USUARIO'"
                });

                $rootScope.get('api/tipo_persona?filter='+filter).then(function(response) {
                    ////console.log(response);
                    $rootScope.JSONTipoPersona = response;
                }, function(response) {
                    //console.log(response);
                });

                
                if($rootScope.clave_caso!=undefined) {
                    $scope.datos.numero = $rootScope.clave_caso;
                    $rootScope.buscarCaso();
                }


            });
            
            $('#post').on('click', function() {
                if($scope.datos==undefined) { $rootScope.toast("Rellene los campos"); return; }
			    if($scope.datos.numero==undefined) {  $rootScope.toast("Campo 'número' vacio"); return; }
                if($scope.datos.descripcion==undefined) {  $rootScope.toast("Campo 'descripción' vacio"); return; }

                var filtro = {
                    donde : "where numero = '" + $scope.datos.numero + "'"
                };

                var filter = JSON.stringify(filtro).toString();
                $scope.existeCaso = false;

                if($rootScope.accion_caso=="registrar") {
                    $rootScope.get('api/caso?filter='+filter).then(function(response) {
                        if(typeof response != "undefined") {
                            $rootScope.toast("Ya existe un caso registrado con ese número");
                            $scope.existeCaso = true;
                        }
                    }, function(response) {
                        $scope.existeCaso = false;
                    });
                }
                
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
                        $rootScope.toast("Debes agregar por lo menos una víctima");
                        return;
                    }   


                    if($scope.existe_caso==false) {
                        $rootScope.post('api/caso', $scope.datos).then(function(response) {
                            //console.log(response);
                            if(response != null) {
                                //console.log("llega a diferent nul");
                                if(response.length==1) {
                                    for(var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {

                                        var agregarPersona = {
                                            numero_caso : response["0"].numero,
                                            cedula : $rootScope.tipoDePersonasAgregadas[i].cedula
                                        };

                                        $rootScope.post('api/caso_' + $rootScope.tipoDePersonasAgregadas[i].tipo, agregarPersona).then(function(response) {
                                            ////console.log(response);
                                            
                                        }, function(response) {
                                            //console.log(response);
                                        });
                                    }



                                    $scope.datos = {};
                                    $rootScope.tipoDePersonasAgregadas = {};
                                    $rootScope.alert("Éxito", "El caso ha sido registrado", "info");
                                    $window.location.href= "#!/casos";
                                    
                                } else {
                                    $rootScope.alert("Error", "Ocurrio un error al intentar registrar el caso", "error");
                                }
                            }
                            
                            
                        });

                    }

                    if($scope.existe_caso==true) {
                        $rootScope.put('api/caso/'+$scope.datos.id, $scope.datos).then(function(response) {
                            if(response != null) {


                                if(response.length==1) {

                                    
                                    var tipoPersonas = ["imputado", "victima", "fiscal", "alguacil", "secretaria", "juez", "defensor", "testigo"];

                                    for(var x = 0;x < tipoPersonas.length;x++) {
                                        $rootScope.delete('api/caso_'+tipoPersonas[x]+"?data=numero_caso="+$scope.datos.numero).then(function(response) {

                                        });
                                    }





                                    for(var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {

                                        var agregarPersona = {
                                            numero_caso : response["0"].numero,
                                            cedula : $rootScope.tipoDePersonasAgregadas[i].cedula
                                        };

                                        $rootScope.post('api/caso_' + $rootScope.tipoDePersonasAgregadas[i].tipo, agregarPersona).then(function(response) {
                                            ////console.log(response);
                                            
                                        }, function(response) {
                                            //console.log(response);
                                        });
                                    }



                                    $scope.datos = {};
                                    $rootScope.tipoDePersonasAgregadas = {};
                                    $rootScope.alert("Éxito", "El caso ha sido modificado", "info");
                                    $window.location.href= "#!/casos";
                                    
                                } else {
                                    $rootScope.alert("Error", "Ocurrió un error al intentar modificar el caso", "error");
                                }
                            }
                            
                            
                        });

                    }
                    

                } else {
                    $rootScope.toast("Por favor, agrega a las personas involucradas en el caso");
                }

                
            });

            $rootScope.sacarElemento = function(e) {
                

                $rootScope.confirm("Mensaje de Confirmación", "¿Estás seguro que deseas eliminar esta persona?", "info", function() {
                    
                    $rootScope.tipoDePersonasAgregadas.splice(e.currentTarget.id, 1);

                    for(var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {
                        $rootScope.tipoDePersonasAgregadas[i].posicion = i;
                    }

                    $rootScope.timerAlert("Éxito", "", 1);

                }, function() {
                    $rootScope.buscarCaso();
                });

                


            }

            $rootScope.buscarCaso = function() {
                if(typeof $scope.datos.numero == "undefined" || $scope.datos.numero == null || $scope.datos.numero == "") {
                    $rootScope.toast("Introduce un número de caso");
                }

                $rootScope.tipoDePersonasAgregadas = [];
                var filtro = {
                    donde: "where numero = '" + $scope.datos.numero + "'"
                };

                var filter = JSON.stringify(filtro).toString();

                $rootScope.get('api/caso?filter=' + filter).then(function(response) {

                    if(typeof response != "undefined") {
                        $("#post").attr("disabled", false);
                        $("#post").html("Modificar");
                        $("#post").css("display","block");
                        $scope.existe_caso = true;
                        $scope.datos = response["0"];

                        var filter = JSON.stringify({
                            donde: "where numero_caso = '" + $scope.datos.numero + "'"
                        });

                        var tipoPersonas = ["imputado", "victima", "fiscal", "alguacil", "secretaria", "juez", "defensor", "testigo"];

                        for(var x = 0; x < tipoPersonas.length; x++) {
                            $rootScope.get("api/caso_"+tipoPersonas[x]+"?filter=" + filter).then(function(response) {
                                if(typeof response != "undefined") {
                                    //console.log(response);
                                    
                                    
                                    
                                    for(var i = 0; i < response.length; i++) {
                                        ////console.log(response[i].cedula);

                                        var filtro2 = {
                                            donde : "where cedula = '"+response[i].cedula+"' AND id_tipo_persona = '" + response[i].id_tipo_persona + "'"
                                        };


                                        var filter2 = JSON.stringify(filtro2).toString();
                                        
                                        $rootScope.get('api/persona_tipo_persona?filter=' + filter2).then(function(response) {



                                            var primer_nombre = response["0"].nombres.split(" ");
                                            var primer_apellido = response["0"].apellidos.split(" ");

                                            for (var z = 0; z < $rootScope.JSONTipoPersona.length; z++) {
                                                if($rootScope.JSONTipoPersona[z].id == response["0"].id_tipo_persona) {
                                                    var JSONPersonas = {
                                                        tipo : $rootScope.JSONTipoPersona[z].descripcion.toLowerCase(),
                                                        cedula : response["0"].cedula,
                                                        nombres: primer_nombre[0] + " " + primer_apellido[0].substr(0,1) + ".",
                                                        telefono: response["0"].telefono,
                                                        posicion: 0
                                                    };

                                                    $rootScope.tipoDePersonasAgregadas.push(JSONPersonas);

                                                }
                                            }

                                            for(var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {
                                                $rootScope.tipoDePersonasAgregadas[i].posicion = i;
                                            }
                                            
                                            
                                            


                                        },function(response) {

                                        });
                                    }
                                } else {
                                   // //console.log("No hay imputados agregados");
                                }
                            }, function(response) {
                                //console.log(response);
                            });

                        }
                    } else {
                        $("#post").attr("disabled", false);
                        $("#post").html("Registrar");
                        $("#post").css("display","block");
                        $scope.existe_caso = false;
                        $rootScope.tipoDePersonasAgregadas = [];
                        $scope.datos.descripcion = "";
                        $rootScope.toast("No existe ningún caso registrado con ese número");
                    }
                });
            }

          


            

            $rootScope.buscarPersona = function() {
                if($scope.persona.cedula==undefined) { $rootScope.toast("Ingrese la cédula de la persona para agregar"); return; }
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


                $rootScope.get('api/persona_tipo_persona?filter=' + filter).then(function(response) {

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
                        
                        ////console.log(JSONPersonas);
                        
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
                            $rootScope.toast(primer_nombre[0] + " " + primer_apellido[0] + " ya ha sido agregado");
                        }
                        

                        ////console.log($rootScope.tipoDePersonasAgregadas);
                        

                        
                        
                    } else {
                        $rootScope.toast("No existe un registro con la cédula de identidad ingresada para este tipo de persona");
                    }
                }, function(response) {
                    //console.log(response);

                });
            };
			
			
		});
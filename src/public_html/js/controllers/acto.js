        app.controller('acto', function($rootScope, $scope, $http, $localStorage, $location, $window, $routeParams) {
            $rootScope.validateToken();
            $rootScope.objeto = "Programador de Actos";





            $('#post').on('click', function() {
                if ($scope.data == undefined) { $rootScope.toast("Rellene los campos"); return; }
                if ($scope.data.numero_caso == undefined) { $rootScope.toast("Ingresa un número de caso"); return; }
                if ($scope.selTipoTribunal == undefined) { $rootScope.toast("Selecciona un tipo de Tribunal"); return; }
                if ($scope.data.id_tribunal == undefined) { $rootScope.toast("Selecciona un tribunal"); return; }
                if ($scope.data.id_actividad == undefined) { $rootScope.toast("Selecciona una actividad"); return; }

                // if ($scope.data.descripcion == undefined || $scope.data.descripcion == "") { $rootScope.toast("Campo 'Descripcion' vacio"); return; }

                ////console.log(JSON.stringify($scope.data));

                if ($rootScope.origenProgramador == true) {
                    $scope.data.estatus = "ASIGNADO";
                    if ($scope.data.inicio == undefined || $scope.data.inicio == "") { $rootScope.toast("Campo 'Inicio' vacio"); return; }
                    if ($scope.data.fin == undefined || $scope.data.fin == "") { $rootScope.toast("Campo 'Fin' vacio"); return; }
                } else {
                    $scope.data.estatus = "ESPERA";
                }



                $scope.data.id_usuario = $rootScope.id_usuario;

                //console.log(JSON.stringify($scope.data));
                $rootScope.post('api/acto', $scope.data).then(function(response) {
                    var date = $rootScope.formatDate($scope.data.inicio, "yyyy-MM-dd");
                    var fecha2 = $rootScope.formatDate($scope.data.inicio, "dd/MM/yyyy");
                    var m = moment($scope.data.inicio);
                    var hora = m.format("h:mm a");
                    var id_acto = response["0"].id;



                    for (var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {
                        var JSONmensaje = {
                            number: $rootScope.tipoDePersonasAgregadas[i].telefono,
                            text: "[Mensaje automatico de Circuito Judicial de San Felipe para " + $rootScope.tipoDePersonasAgregadas[i].nombres + "] Recordatorio de audiencia numero " + id_acto + " programada para el dia " + fecha2 + " a las " + hora + " donde funges como " + $rootScope.tipoDePersonasAgregadas[i].tipo

                        };

                        var JSONmensaje2 = {
                            number: $rootScope.tipoDePersonasAgregadas[i].telefono,
                            text: "[Mensaje automatico de Circuito Judicial de San Felipe para " + $rootScope.tipoDePersonasAgregadas[i].nombres + "] Se ha creado una nuevo acto con el numero " + id_acto + " programada para el dia " + fecha2 + " a las " + hora + " donde funges como " + $rootScope.tipoDePersonasAgregadas[i].tipo

                        };


                        $rootScope.get('api/config_notificaciones').then(function(response) {
                            $rootScope.data_notificaciones = response["0"];

                            $rootScope.post($rootScope.data_notificaciones.servSMSinst, JSONmensaje2).then(function(response) {


                            });




                            $rootScope.post($rootScope.data_notificaciones.servSMSprog + "/" + date + "/1 DAY", JSONmensaje).then(function(response) {
                                //console.log(response);

                            });

                        });




                    }





                    localStorage.removeItem("ngStorage-evento");
                    $scope.data = {};

                    //console.log($rootScope.origenProgramador);
                    if ($rootScope.origenProgramador == true) {
                        $window.location.href = '#!/programador/' + date;
                    } else {
                        $window.location.href = '#!/programador';
                    }

                }, function() {
                    $rootScope.alert("Ocurrio un Error interno");
                });
            });

            $('#put').on('click', function() {
                if ($scope.data == undefined) { $rootScope.toast("Rellene los campos"); return; }
                if ($scope.data.numero_caso == undefined) { $rootScope.toast("Ingresa un número de caso"); return; }
                if ($scope.selTipoTribunal == undefined) { $rootScope.toast("Selecciona un tipo de Tribunal"); return; }
                if ($scope.data.id_tribunal == undefined) { $rootScope.toast("Selecciona un tribunal"); return; }
                if ($scope.data.id_actividad == undefined) { $rootScope.toast("Selecciona una actividad"); return; }

                //if ($scope.data.descripcion == undefined || $scope.data.descripcion == "") { $rootScope.toast("Campo 'Descripcion' vacio"); return; }

                $rootScope.put('api/acto/' + $routeParams.id, $scope.data).then(function(response) {
                    if (response != null) {
                        var date = $rootScope.formatDate($scope.data.inicio, "yyyy-MM-dd");
                        $window.location.href = '#!/programador/' + date;
                    } else {
                        $rootScope.alert("Ocurrio un error al intentar almacenar la informacion");
                    }
                });
            });



            $scope.buscarCaso = function() {
                if ($scope.data.numero_caso == undefined) {
                    $('select').prop("disabled", true);
                    $('textarea').prop("disabled", true);
                    $('input').prop("disabled", true);
                    $('#post').prop("disabled", true);
                    $('#numero').prop("disabled", false);
                    $scope.selActividad = {};
                    $scope.selTipoTribunal = {};
                    $scope.selTribunal = {};
                    $rootScope.tipoDePersonasAgregadas = [];
                    $rootScope.descripcion_caso = "";
                    $rootScope.toast("Ingrese un número de caso");
                    return;
                }

                $rootScope.tipoDePersonasAgregadas = [];

                var date = moment($scope.data.inicio).format("YYYY-MM-DD");
                var filter = JSON.stringify({
                    donde: "WHERE numero_caso = '" + $scope.data.numero_caso + "' AND DATE(inicio) = '" + date + "'"
                });

                $rootScope.get('api/acto?filter=' + filter).then(function(info) {
                    if (typeof info == "undefined") {
                        var filtro = {
                            donde: "where numero = '" + $scope.data.numero_caso + "'"
                        };

                        var filter = JSON.stringify(filtro).toString();




                        $rootScope.get('api/caso?filter=' + filter).then(function(response) {





                            if (typeof response != "undefined") {


                                $rootScope.descripcion_caso = response["0"].descripcion;
                                $('#numero').prop("disabled", false);
                                obtenerTipoTribunal($http, $scope);
                                $('select').prop("disabled", false);
                                $('textarea').prop("disabled", false);
                                $('input').prop("disabled", false);
                                $('#post').prop("disabled", false);
                                $('#actividad').prop("disabled", true);
                                $('#tribunal').prop("disabled", true);


                                $rootScope.get('api/tribunal/' + $scope.data.id_tribunal).then(function(response) {
                                    var id_tribunal = $scope.data.id_tribunal;

                                    $rootScope.get('api/tipo_de_tribunal/' + response["0"].id_tipo_tribunal).then(function(response) {
                                        $scope.selTipoTribunal = response["0"].id;
                                        console.log($scope.selTipoTribunal);
                                        $('#actividad').prop("disabled", false);
                                        $('#tribunal').prop("disabled", false);

                                        var filter = JSON.stringify({
                                            donde: "where id_tipo_tribunal = '" + $scope.selTipoTribunal + "'"
                                        });

                                        $rootScope.get('api/tribunal?filter=' + filter).then(function(response) {
                                            $scope.JSONTribunal = response;
                                        });

                                        $rootScope.get('api/actividad?filter=' + filter).then(function(response) {
                                            $scope.JSONActividad = response;
                                        });
                                    });

                                });


                                var filtro = {
                                    donde: "where numero_caso = '" + $scope.data.numero_caso + "'"
                                };

                                var filter = JSON.stringify(filtro).toString();

                                var tipoPersonas = ["imputado", "victima", "fiscal", "alguacil", "juez", "defensor", "testigo"];

                                for (var x = 0; x < tipoPersonas.length; x++) {
                                    $rootScope.get("api/caso_" + tipoPersonas[x] + "?filter=" + filter).then(function(response) {
                                        if (typeof response != "undefined") {
                                            for (var i = 0; i < response.length; i++) {
                                                ////console.log(response[i].cedula);

                                                var filtro2 = {
                                                    donde: "where cedula = '" + response[i].cedula + "' AND id_tipo_persona = '" + response[i].id_tipo_persona + "'"
                                                };


                                                var filter2 = JSON.stringify(filtro2).toString();

                                                $rootScope.get('api/persona_tipo_persona?filter=' + filter2).then(function(response) {



                                                    var primer_nombre = response["0"].nombres.split(" ");
                                                    var primer_apellido = response["0"].apellidos.split(" ");

                                                    for (var z = 0; z < $rootScope.JSONTipoPersona.length; z++) {
                                                        if ($rootScope.JSONTipoPersona[z].id == response["0"].id_tipo_persona) {
                                                            var JSONPersonas = {
                                                                tipo: $rootScope.JSONTipoPersona[z].descripcion.toLowerCase(),
                                                                cedula: response["0"].cedula,
                                                                nombres: primer_nombre[0] + " " + primer_apellido[0].substr(0, 1) + ".",
                                                                telefono: response["0"].telefono,
                                                                posicion: 0
                                                            };

                                                            $rootScope.tipoDePersonasAgregadas.push(JSONPersonas);

                                                        }
                                                    }

                                                    for (var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {
                                                        $rootScope.tipoDePersonasAgregadas[i].posicion = i;
                                                    }





                                                }, function(response) {

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
                                $('select').prop("disabled", true);
                                $('textarea').prop("disabled", true);
                                $('input').prop("disabled", true);
                                $('#post').prop("disabled", true);
                                $('#numero').prop("disabled", false);
                                $rootScope.toast("No existe ningún caso con el número ingresado");
                                $scope.selActividad = {};
                                $scope.selTipoTribunal = {};
                                $scope.selTribunal = {};
                                $scope.data.descripcion = "";
                                $scope.data.numero_caso = "";
                                $rootScope.tipoDePersonasAgregadas = [];
                                $rootScope.descripcion_caso = "";

                            }

                        }, function(response) {
                            $rootScope.descripcion_caso = "";
                            //console.log(response);
                        });
                    } else {

                        if (typeof $routeParams.id !== 'undefined') {

                            var filtro = {
                                donde: "where numero = '" + $scope.data.numero_caso + "'"
                            };

                            var filter = JSON.stringify(filtro).toString();




                            $rootScope.get('api/caso?filter=' + filter).then(function(response) {





                                if (typeof response != "undefined") {


                                    $rootScope.descripcion_caso = response["0"].descripcion;
                                    $('#numero').prop("disabled", true);
                                    obtenerTipoTribunal($http, $scope);
                                    $('select').prop("disabled", false);
                                    $('textarea').prop("disabled", false);
                                    $('input').prop("disabled", false);
                                    $('#post').prop("disabled", false);
                                    $('#actividad').prop("disabled", true);
                                    $('#tribunal').prop("disabled", true);
                                    $('#numero').prop("disabled", true);



                                    $rootScope.get('api/tribunal/' + $scope.data.id_tribunal).then(function(response) {
                                        var id_tribunal = $scope.data.id_tribunal;

                                        $rootScope.get('api/tipo_de_tribunal/' + response["0"].id_tipo_tribunal).then(function(response) {
                                            $scope.selTipoTribunal = response["0"].id;
                                            console.log($scope.selTipoTribunal);
                                            $('#actividad').prop("disabled", false);
                                            $('#tribunal').prop("disabled", false);

                                            var filter = JSON.stringify({
                                                donde: "where id_tipo_tribunal = '" + $scope.selTipoTribunal + "'"
                                            });

                                            $rootScope.get('api/tribunal?filter=' + filter).then(function(response) {
                                                $scope.JSONTribunal = response;
                                            });

                                            $rootScope.get('api/actividad?filter=' + filter).then(function(response) {
                                                $scope.JSONActividad = response;
                                            });
                                        });

                                    });


                                    var filtro = {
                                        donde: "where numero_caso = '" + $scope.data.numero_caso + "'"
                                    };

                                    var filter = JSON.stringify(filtro).toString();

                                    var tipoPersonas = ["imputado", "victima", "fiscal", "alguacil", "juez", "defensor", "testigo"];

                                    for (var x = 0; x < tipoPersonas.length; x++) {
                                        $rootScope.get("api/caso_" + tipoPersonas[x] + "?filter=" + filter).then(function(response) {
                                            if (typeof response != "undefined") {
                                                for (var i = 0; i < response.length; i++) {
                                                    ////console.log(response[i].cedula);

                                                    var filtro2 = {
                                                        donde: "where cedula = '" + response[i].cedula + "' AND id_tipo_persona = '" + response[i].id_tipo_persona + "'"
                                                    };


                                                    var filter2 = JSON.stringify(filtro2).toString();

                                                    $rootScope.get('api/persona_tipo_persona?filter=' + filter2).then(function(response) {



                                                        var primer_nombre = response["0"].nombres.split(" ");
                                                        var primer_apellido = response["0"].apellidos.split(" ");

                                                        for (var z = 0; z < $rootScope.JSONTipoPersona.length; z++) {
                                                            if ($rootScope.JSONTipoPersona[z].id == response["0"].id_tipo_persona) {
                                                                var JSONPersonas = {
                                                                    tipo: $rootScope.JSONTipoPersona[z].descripcion.toLowerCase(),
                                                                    cedula: response["0"].cedula,
                                                                    nombres: primer_nombre[0] + " " + primer_apellido[0].substr(0, 1) + ".",
                                                                    telefono: response["0"].telefono,
                                                                    posicion: 0
                                                                };

                                                                $rootScope.tipoDePersonasAgregadas.push(JSONPersonas);

                                                            }
                                                        }

                                                        for (var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {
                                                            $rootScope.tipoDePersonasAgregadas[i].posicion = i;
                                                        }





                                                    }, function(response) {

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
                                    $('select').prop("disabled", true);
                                    $('textarea').prop("disabled", true);
                                    $('input').prop("disabled", true);
                                    $('#post').prop("disabled", true);
                                    $('#numero').prop("disabled", false);
                                    $rootScope.toast("No existe ningún caso con el número ingresado");
                                    $scope.selActividad = {};
                                    $scope.selTipoTribunal = {};
                                    $scope.selTribunal = {};
                                    $scope.data.descripcion = "";
                                    $scope.data.numero_caso = "";
                                    $rootScope.tipoDePersonasAgregadas = [];
                                    $rootScope.descripcion_caso = "";

                                }

                            }, function(response) {
                                $rootScope.descripcion_caso = "";
                                //console.log(response);
                            });
                            return;
                        } else {

                            if($rootScope.desdeBotonEnProgramador==false) {
                                $rootScope.toast("Ya existe un acto registrado para este dia para la causa " + $scope.data.numero_caso);
                                $('select').prop("disabled", true);
                                $('textarea').prop("disabled", true);
                                $('input').prop("disabled", true);
                                $('#post').prop("disabled", true);
                                $('#numero').prop("disabled", false);
                                $scope.selActividad = {};
                                $scope.selTipoTribunal = {};
                                $scope.selTribunal = {};
                                $scope.data.descripcion = "";
                                $scope.data.numero_caso = "";
                                $rootScope.tipoDePersonasAgregadas = [];
                                $rootScope.descripcion_caso = "";

                                return;
                            } else {
                                

                            var filtro = {
                                donde: "where numero = '" + $scope.data.numero_caso + "'"
                            };

                            var filter = JSON.stringify(filtro).toString();




                            $rootScope.get('api/caso?filter=' + filter).then(function(response) {





                                if (typeof response != "undefined") {


                                    $rootScope.descripcion_caso = response["0"].descripcion;
                                    $('#numero').prop("disabled", true);
                                    obtenerTipoTribunal($http, $scope);
                                    $('select').prop("disabled", false);
                                    $('textarea').prop("disabled", false);
                                    $('input').prop("disabled", false);
                                    $('#post').prop("disabled", false);
                                    $('#actividad').prop("disabled", true);
                                    $('#tribunal').prop("disabled", true);
                                    $('#numero').prop("disabled", true);



                                    $rootScope.get('api/tribunal/' + $scope.data.id_tribunal).then(function(response) {
                                        var id_tribunal = $scope.data.id_tribunal;

                                        $rootScope.get('api/tipo_de_tribunal/' + response["0"].id_tipo_tribunal).then(function(response) {
                                            $scope.selTipoTribunal = response["0"].id;
                                            console.log($scope.selTipoTribunal);
                                            $('#actividad').prop("disabled", false);
                                            $('#tribunal').prop("disabled", false);

                                            var filter = JSON.stringify({
                                                donde: "where id_tipo_tribunal = '" + $scope.selTipoTribunal + "'"
                                            });

                                            $rootScope.get('api/tribunal?filter=' + filter).then(function(response) {
                                                $scope.JSONTribunal = response;
                                            });

                                            $rootScope.get('api/actividad?filter=' + filter).then(function(response) {
                                                $scope.JSONActividad = response;
                                            });
                                        });

                                    });


                                    var filtro = {
                                        donde: "where numero_caso = '" + $scope.data.numero_caso + "'"
                                    };

                                    var filter = JSON.stringify(filtro).toString();

                                    var tipoPersonas = ["imputado", "victima", "fiscal", "alguacil", "juez", "defensor", "testigo"];

                                    for (var x = 0; x < tipoPersonas.length; x++) {
                                        $rootScope.get("api/caso_" + tipoPersonas[x] + "?filter=" + filter).then(function(response) {
                                            if (typeof response != "undefined") {
                                                for (var i = 0; i < response.length; i++) {
                                                    ////console.log(response[i].cedula);

                                                    var filtro2 = {
                                                        donde: "where cedula = '" + response[i].cedula + "' AND id_tipo_persona = '" + response[i].id_tipo_persona + "'"
                                                    };


                                                    var filter2 = JSON.stringify(filtro2).toString();

                                                    $rootScope.get('api/persona_tipo_persona?filter=' + filter2).then(function(response) {



                                                        var primer_nombre = response["0"].nombres.split(" ");
                                                        var primer_apellido = response["0"].apellidos.split(" ");

                                                        for (var z = 0; z < $rootScope.JSONTipoPersona.length; z++) {
                                                            if ($rootScope.JSONTipoPersona[z].id == response["0"].id_tipo_persona) {
                                                                var JSONPersonas = {
                                                                    tipo: $rootScope.JSONTipoPersona[z].descripcion.toLowerCase(),
                                                                    cedula: response["0"].cedula,
                                                                    nombres: primer_nombre[0] + " " + primer_apellido[0].substr(0, 1) + ".",
                                                                    telefono: response["0"].telefono,
                                                                    posicion: 0
                                                                };

                                                                $rootScope.tipoDePersonasAgregadas.push(JSONPersonas);

                                                            }
                                                        }

                                                        for (var i = 0; i < $rootScope.tipoDePersonasAgregadas.length; i++) {
                                                            $rootScope.tipoDePersonasAgregadas[i].posicion = i;
                                                        }





                                                    }, function(response) {

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
                                    $('select').prop("disabled", true);
                                    $('textarea').prop("disabled", true);
                                    $('input').prop("disabled", true);
                                    $('#post').prop("disabled", true);
                                    $('#numero').prop("disabled", false);
                                    $rootScope.toast("No existe ningún caso con el número ingresado");
                                    $scope.selActividad = {};
                                    $scope.selTipoTribunal = {};
                                    $scope.selTribunal = {};
                                    $scope.data.descripcion = "";
                                    $scope.data.numero_caso = "";
                                    $rootScope.tipoDePersonasAgregadas = [];
                                    $rootScope.descripcion_caso = "";

                                }

                            }, function(response) {
                                $rootScope.descripcion_caso = "";
                                //console.log(response);
                            });
                            return;
                            }


                            
                        }


                    }

                }, function(info) {

                });



            }

            function obtenerTipoTribunal($http, $scope) {
                $http.get('api/tipo_de_tribunal', {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        'Authorization': $localStorage.token
                    }
                }).then(function(data) {
                    // //console.log(data);
                    var array = data == null ? [] : (data.data.data instanceof Array ? data.data.data : [data.data.data]);
                    $scope.JSONtipoTribunal = array;
                    $scope.selTipoTribunal = $scope.JSONtipoTribunal;

                    ////console.log($scope.selTipoTribunal);
                }, function(response) {
                    //console.log('Error: ' + response);
                });


            }

            function obtenerTribunal($http, $scope, idCategoria) {
                console.log("LAS CATEFORIA ES" + idCategoria);
                var filtro = {
                    donde: "where id_tipo_tribunal = " + idCategoria
                };

                var filter = JSON.stringify(filtro).toString();
                $http.get('api/tribunal?filter=' + filter, {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        'Authorization': $localStorage.token
                    }
                }).then(function(data) {
                    var array = data == null ? [] : (data.data.data instanceof Array ? data.data.data : [data.data.data]);

                    $scope.JSONTribunal = array;
                    //$scope.data.id_tribunal   = 0;
                    $('#tribunal').prop('disabled', false);

                }, function(response) {
                    //console.log('Error: ' + response);
                    $('#tribunal').prop('disabled', false);
                });
            }


            function obtenerActividad($http, $scope, idCategoria) {
                console.log(idCategoria);
                var filtro = {
                    donde: "where id_tipo_tribunal = " + idCategoria
                };

                var filter = JSON.stringify(filtro).toString();
                $http.get('api/actividad?filter=' + filter, {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        'Authorization': $localStorage.token
                    }
                }).then(function(data) {
                    var array = data == null ? [] : (data.data.data instanceof Array ? data.data.data : [data.data.data]);

                    $scope.JSONActividad = array;
                    //$scope.data.id_actividad  = 0;

                    $('#actividad').prop('disabled', false);

                }, function(response) {
                    //console.log('Error: ' + response);
                    $('#actividad').prop('disabled', true);
                });
            }


            $scope.mostrarTribunal = function() {
                // $scope.selCategorias NOS TRAE EL VALOR DEL SELECT DE CATEGORIAS


                obtenerTribunal($http, $scope, $scope.selTipoTribunal);
            };
            $scope.mostrarActividad = function() {
                // $scope.selCategorias NOS TRAE EL VALOR DEL SELECT DE CATEGORIAS
                obtenerActividad($http, $scope, $scope.selTipoTribunal);
            };

            angular.element(document).ready(function() {


                $rootScope.get('api/tipo_persona').then(function(response) {
                    $rootScope.JSONTipoPersona = response;
                }, function(response) {
                    //console.log(response);
                });



                if (typeof $routeParams.id !== 'undefined') {
                    $rootScope.existeParam = true;
                    $rootScope.get('api/acto/' + $routeParams.id).then(function(response) {
                        $scope.data = response["0"];

                        $scope.buscarCaso();
                    });


                } else {
                    $rootScope.tipoDePersonasAgregadas = [];
                    $rootScope.tribunal = [];
                    $rootScope.tipo_de_tribunal = []
                    $rootScope.existeParam = false;
                    if (typeof $localStorage.evento == "undefined") {
                        $rootScope.origenProgramador = false;
                        $scope.data = undefined;


                    } else {
                        $rootScope.origenProgramador = true;
                        $scope.data = $localStorage.evento;

                        var filtro = {
                            donde: "where id = " + $scope.data.id_sala
                        };

                        var filter = JSON.stringify(filtro).toString();

                        $rootScope.get('api/sala?filter=' + filter).then(function(response) {
                            $rootScope.sala = response["0"].descripcion;
                            $(".chip_sala").css({
                                background: response["0"].color,
                                color: "#ffffff"
                            });
                        });
                    }
                }















            });






        });
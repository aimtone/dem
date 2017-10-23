        app.controller('notificaciones', function($rootScope, $scope, $http, $localStorage, $location) {

            $rootScope.validateToken();
            $rootScope.objeto = "Notificaciones";
            $rootScope.data_not = {
                id: "",
                asunto: "",
                mensaje: "",
                fecha: ""

            };
            $rootScope.existe_mensaje = false;


            $rootScope.eliminarNotificacion = function() {

                
                $rootScope.delete('api/notificaciones_usuario/'+$rootScope.id_not_actual).then(function(response) {
                        $rootScope.existe_mensaje = false;
                        $rootScope.cargarNotificacionesCompletas();

                    

                });
            };
            $rootScope.cargarMensaje = function(id) {
                $('.collection-item').css({
                    background: "#FFFFFF",
                    color: "black"
                });

                var data = JSON.stringify({
                    id: id,
                    status: 0
                });

                $rootScope.put('api/notificaciones_usuario/' + id, data).then(function(response) {

                    if (response != null) {
                        $rootScope.id_not_actual = id;
                        $rootScope.cargarBadget();

                        $('#' + id).css({
                            background: "rgba(0, 123, 177, 0.6)",
                            color: "white"
                        });


                        $('#' + id + ' span.title').css({

                            fontWeight: "normal"
                        });
                    }

                    $rootScope.get('api/notificaciones/' + response["0"].id_notificacion).then(function(response) {

                        if(response!=null) {
                            $rootScope.data_not = {
                            id: response["0"].id,
                            asunto: response["0"].title,
                            mensaje: response["0"].body,
                            fecha: moment(response["0"].time).format("dddd, DD MMMM  YYYY h:mm:ss a")

                        };
                        $rootScope.existe_mensaje = true;
                        } else {
                            $rootScope.existe_mensaje = false;
                        }
                        
                        
                    });






                });

         
            };

            $scope.openModal = function(tipo) {
                if (tipo == "difusion") {
                    $scope.ventana_titulo = "Nuevo mensaje de difusion"
                    $scope.tipo = 1;
                    $scope.datos = {};
                }
                if (tipo == "grupal") {
                    $scope.ventana_titulo = "Nuevo mensaje grupal"
                    $scope.tipo = 2;
                    $scope.datos = {

                        rol: ""
                    };
                }
                if (tipo == "directo") {

                    $rootScope.get('api/vista_usuario').then(function(response) {
                        $rootScope.usuarios = response;
                    }, function() {});


                    $scope.ventana_titulo = "Nuevo mensaje directo"
                    $scope.tipo = 3;
                    $scope.datos = {

                        user: ""
                    };
                }



                $("#modal1").modal('open');
            }


            $scope.closeModal = function(div, button) {
                if (button == 'ok') {

                    if ($scope.datos.title == "" || typeof $scope.datos.title == "undefined") {
                        $rootScope.toast("Rellena el campo Asunto");
                        return;
                    }
                    if ($scope.datos.body == "" || typeof $scope.datos.body == "undefined") {
                        $rootScope.toast("Rellena el campo Mensaje");
                        return;
                    }

                    if ($scope.tipo == 1) {
                        $rootScope.enviarNotificacion($scope.datos.title, $scope.datos.body, null, null);
                    }
                    if ($scope.tipo == 2) {
                        if ($scope.datos.rol == "" || typeof $scope.datos.rol == "undefined") {
                            $rootScope.toast("Selecciona un grupo");
                            return;
                        }
                        $rootScope.enviarNotificacion($scope.datos.title, $scope.datos.body, $scope.datos.rol, null);
                    }
                    if ($scope.tipo == 3) {
                        if ($scope.datos.user == "" || typeof $scope.datos.user == "undefined") {
                            $rootScope.toast("Selecciona un usuario");
                            return;
                        }
                        $rootScope.enviarNotificacion($scope.datos.title, $scope.datos.body, null, $scope.datos.user);

                    }






                    $(div).modal('close');
                    $rootScope.toast("Mensaje enviado");

                }

                if (button == 'cancelar') {
                    $(div).modal('close');
                }



            }




            angular.element(document).ready(function() {
                $('.tooltipped').tooltip({ delay: 50 });
                $('#modal1').modal();




                if (typeof $rootScope.id_not != "undefined") {
                    $rootScope.cargarMensaje($rootScope.id_not);
                }



            });

        });
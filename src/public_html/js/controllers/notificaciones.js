		app.controller('notificaciones', function($rootScope,$scope,$http,$localStorage,$location) {

			$rootScope.validateToken();
			$rootScope.objeto = "Notificaciones";
            $rootScope.data_not = {
                id: "",
                asunto: "",
                mensaje: "",
                fecha: ""

            };
            $rootScope.existe_mensaje = false;

            $rootScope.cargarMensaje = function(id) {
                $('.collection-item').css({
                    background: "#FFFFFF",
                    color:"black"
                });

                

                $rootScope.get('api/notificaciones/'+id).then(function(response) {

                    if(response!=null) {
                        var data = {
                            id: id,
                            status: 0
                        };

                        $rootScope.put('api/notificaciones/'+response["0"].id, data).then(function(response) {
                            //console.log(response);
                            $rootScope.cargarBadget();

                            $('#'+id).css({
                                background: "rgba(0, 123, 177, 0.6)",
                                color: "white"
                            });


                            $('#'+id+' span.title').css({
                                
                                fontWeight: "normal"
                            });

                            

                            
                        });

                        $rootScope.data_not = {
                            id: response["0"].id,
                            asunto: response["0"].title,
                            mensaje: response["0"].body,
                            fecha: response["0"].time

                        };
                        $rootScope.existe_mensaje = true;

                        

                    } else {
                        $rootScope.existe_mensaje = false;
                    }
                });
            };

            

			
            angular.element(document).ready(function() {

                

                if(typeof $rootScope.id_not!= "undefined") {
                    $rootScope.cargarMensaje($rootScope.id_not);
                }

               
                
            });
			
		});
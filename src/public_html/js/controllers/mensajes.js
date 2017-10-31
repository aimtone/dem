		app.controller('mensajes', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateToken();
			$rootScope.objeto = "Mensajería";

			$rootScope.enviarSMS = function() {

				var JSONmensaje = {
                            number: $scope.mens.number,
                            text : $scope.mens.text

                        };

                        $rootScope.get('api/config_notificaciones').then(function(response) {
                            $rootScope.data_notificaciones = response["0"];

                            console.log($rootScope.data_notificaciones);

                            //console.log($rootScope.data_notificaciones.servSMSprog + "/"+date+"/1 DAY");

                            //console.log(JSON.stringify(JSONmensaje));

                            $rootScope.post($rootScope.data_notificaciones.servSMSinst, JSONmensaje).then(function(response) {
                                if(typeof response != undefined) {
                                	$rootScope.toast("Mensaje enviado");
                                	$scope.mens = null;
                                	$rootScope.get($rootScope.data_notificaciones.servSMSinst).then(function(response) {
			                    $scope.mensajes = response;
			                });

                                } else {
                                	$rootScope.toast("Mensaje no enviado");
                                }

                            });
                            
                        });

			};

            angular.element(document).ready(function() {
            	$("#icon_telephone").mask("+589999999999",{placeholder:"+580000000000"});

            	$rootScope.get('api/config_notificaciones').then(function(response) {
                            $rootScope.data_notificaciones = response["0"];

                            $rootScope.get($rootScope.data_notificaciones.servSMSinst).then(function(response) {
			                    $scope.mensajes = response;
			                });
                            
                        });

                
            });
			
			
		});
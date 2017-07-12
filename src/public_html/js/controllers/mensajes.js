		app.controller('mensajes', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateToken();
			$rootScope.objeto = "Gestion de Mensajeria";

            angular.element(document).ready(function() {
                $rootScope.get('../message_server/sms/api/outbox').then(function(response) {
                    $scope.mensajes = response;
                });
            });
			
			
		});
		app.controller('login', function($rootScope,$scope,$http,$localStorage,$location) {
		
		angular.element(document).ready(function() {
			$("#cedula").mask("l-99999999");
		});

	

		$('#login').on('click',function() {
			if($scope.datos==undefined) { $rootScope.toast("Rellene los campos"); return; }
			if($scope.datos.cedula==undefined) {  $rootScope.toast("Campo 'cedula' vacio"); return; }
			if($scope.datos.clave==undefined) { $rootScope.toast("Campo 'clave' vacio");  return;}

			$rootScope.token = {
				cedula: $scope.datos.cedula,
				clave : $scope.datos.clave
			};

			$rootScope.token = JSON.stringify($rootScope.token);
			$rootScope.token = $rootScope.Base64.encode($rootScope.token);

			$http.get($rootScope.sprintf('api/v1/login/%s',$rootScope.token)).then(function(response) {
				if(response.status == 200) {
					$rootScope.x = true;
					var data = response.data.data[0];
					
					$rootScope.token = {
						cedula: data.cedula,
						clave : data.clave
					};

					$rootScope.token = JSON.stringify($rootScope.token);
					$rootScope.token = $rootScope.Base64.encode($rootScope.token);
					$localStorage.token = $rootScope.token;

					$rootScope.toast(response.statusText);
					console.log(data);
					
					$location.url('/');
				}
				if(response.status == 201) {
					$localStorage.token = "";
					$rootScope.toast(response.statusText);
				}
				

				
			}, function(response) {
				if(response.status == 404) {
					$rootScope.toast(response.statusText);
				}
				if(response.status == 500) {
					$rootScope.toast(response.statusText);
				}
			});
		});

		
			
			
		});
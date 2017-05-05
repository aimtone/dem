		app.controller('acto', function($rootScope,$scope,$http,$localStorage,$location,$window) {
			$rootScope.validateToken();
			$rootScope.objeto = "Programador de Actos";

            if (typeof $localStorage.evento !== 'undefined') {
                    if($localStorage.evento !== "") {

                        $scope.data = $localStorage.evento;
                    } 
                } 

            $('#post').on('click', function() {
                if($scope.data==undefined) { $rootScope.toast("Rellene los campos"); return; }
                if($scope.data.titulo==undefined || $scope.data.titulo == "") {  $rootScope.toast("Campo 'Titulo' vacio"); return; }
                if($scope.data.inicio==undefined || $scope.data.inicio == "") { $rootScope.toast("Campo 'Inicio' vacio");  return;}
                if($scope.data.fin==undefined || $scope.data.fin == "") { $rootScope.toast("Campo 'Fin' vacio");  return;}
                if($scope.data.descripcion==undefined || $scope.data.descripcion == "") { $rootScope.toast("Campo 'Descripcion' vacio");  return;}

                $rootScope.post('api/acto',$scope.data).then(function(response) {
                    var date = $rootScope.formatDate($scope.data.inicio, "yyyy-MM-dd");
                    localStorage.removeItem("ngStorage-evento");
                    $scope.data = {};
                    $window.location.href = '#!/programador/' + date;
                }, function() {
                    $rootScope.alert("Ocurrio un Error interno");
                });
            });

            
            angular.element(document).ready(function() {

        
        
                
            });
           

           
            
			
		});
		app.controller('ajustes', function($rootScope, $scope, $http, $localStorage, $location, $window) {
		    $rootScope.validateToken();
		    $rootScope.objeto = "Ajustes";
		    $scope.data_programador = {};
		    $scope.data_datatable = {};
		    $scope.data_notificaciones = {};
		    $scope.data_generales = {};

		    angular.element(document).ready(function() {
		        $rootScope.get('api/config_programador').then(function(response) {

		            $scope.data_programador = response["0"];

		            if ($scope.data_programador.weekends == "1") {
		                $scope.data_programador.weekends = true;
		            } else {
		                $scope.data_programador.weekends = false;
		            }

		            if ($scope.data_programador.weekNumbers == "1") {
		                $scope.data_programador.weekNumbers = true;
		            } else {
		                $scope.data_programador.weekNumbers = false;
		            }

		            if ($scope.data_programador.weekNumbersWithinDays == "1") {
		                $scope.data_programador.weekNumbersWithinDays = true;
		            } else {
		                $scope.data_programador.weekNumbersWithinDays = false;
		            }

		            if ($scope.data_programador.droppable == "1") {
		                $scope.data_programador.droppable = true;
		            } else {
		                $scope.data_programador.droppable = false;
		            }

		            if ($scope.data_programador.selectable == "1") {
		                $scope.data_programador.selectable = true;
		            } else {
		                $scope.data_programador.selectable = false;
		            }

		            if ($scope.data_programador.eventOverlap == "1") {
		                $scope.data_programador.eventOverlap = true;
		            } else {
		                $scope.data_programador.eventOverlap = false;
		            }

		            if ($scope.data_programador.nowIndicator == "1") {
		                $scope.data_programador.nowIndicator = true;
		            } else {
		                $scope.data_programador.nowIndicator = false;
		            }

		            if ($scope.data_programador.allDaySlot == "1") {
		                $scope.data_programador.allDaySlot = true;
		            } else {
		                $scope.data_programador.allDaySlot = false;
		            }



		            $scope.data_programador.hiddenDays = response["0"].hiddenDays.split(",");
		        });

		        $rootScope.get('api/config_datatables').then(function(response) {

		            $scope.data_datatable = response["0"];

		            if ($scope.data_datatable._keys == "1") {
		                $scope.data_datatable._keys = true;
		            } else {
		                $scope.data_datatable._keys = false;
		            }

		            if ($scope.data_datatable.info == "1") {
		                $scope.data_datatable.info = true;
		            } else {
		                $scope.data_datatable.info = false;
		            }

		            if ($scope.data_datatable.colReorder == "1") {
		                $scope.data_datatable.colReorder = true;
		            } else {
		                $scope.data_datatable.colReorder = false;
		            }

		            if ($scope.data_datatable.scrollCollapse == "1") {
		                $scope.data_datatable.scrollCollapse = true;
		            } else {
		                $scope.data_datatable.scrollCollapse = false;
		            }

		            if ($scope.data_datatable.responsive == "1") {
		                $scope.data_datatable.responsive = true;
		            } else {
		                $scope.data_datatable.responsive = false;
		            }

		            if ($scope.data_datatable.paging == "1") {
		                $scope.data_datatable.paging = true;
		            } else {
		                $scope.data_datatable.paging = false;
		            }

		            if ($scope.data_datatable.stateSave == "1") {
		                $scope.data_datatable.stateSave = true;
		            } else {
		                $scope.data_datatable.stateSave = false;
		            }


		        });

		        $rootScope.get('api/config_notificaciones').then(function(response) {

		            $scope.data_notificaciones = response["0"];


		        });

		        $rootScope.get('api/config_generales').then(function(response) {

		            $scope.data_generales = response["0"];


		        });
		    });


		    $("#post").on("click", function() {
		        $scope.data_programador.hiddenDays = $scope.data_programador.hiddenDays.join(",");
		        //delete $scope.data_datatable.id;
		        $rootScope.put('api/config_programador/1', $scope.data_programador).then(function(response) {
		            //console.log(response);
		        });

		        //console.log($scope.data_datatable);

		        $rootScope.put('api/config_datatables/1', $scope.data_datatable).then(function(response) {

		            //console.log(response);

		        });

		        $rootScope.put('api/config_notificaciones/1', $scope.data_notificaciones).then(function(response) {

		            //console.log(response);

		        });

		        $rootScope.put('api/config_generales/1', $scope.data_generales).then(function(response) {

		            //console.log(response);

		        });

		        $rootScope.toast("Cambios almacenados");
		        $window.location.href = "#!/programador";
		    });


		});
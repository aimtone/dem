		app.controller('register', function($rootScope, $scope, $http, $localStorage, $location, $window) {
		    $rootScope.get('register').then(function(response) {
		        if (response.existe_bd == 1) {
		            $window.location = "#!/login";

		        }
		    });

		    $rootScope.validateSession();
		    $rootScope.objeto = "";

		    angular.element(document).ready(function() {
		        $("#cedula").mask("l-99999999");
		        $("#fecha_de_nacimiento").mask("99/99/9999", { placeholder: "DD/MM/AAAA" });
		        $("#fecha_de_nacimiento").datepicker($.datepicker.regional["es"]);
		        $("#telefono").mask("+589999999999", { placeholder: "+580000000000" });
		        $('body').css({
		            background: "#14385f",
		            transition: "all ease-out 0.1s"
		        });




		    });



		    $('#login').on('click', function() {

		        if ($scope.datos == undefined) { $rootScope.toast("Rellene los campos"); return; }
		        if ($scope.datos.cedula == undefined) { $rootScope.toast("Campo 'cédula' vacio"); return; }
		        if ($scope.datos.nombres == undefined) { $rootScope.toast("Campo 'nombres' vacio"); return; }
		        if ($scope.datos.apellidos == undefined) { $rootScope.toast("Campo 'apellidos' vacio"); return; }
		        if ($scope.datos.fecha_de_nacimiento == undefined) { $rootScope.toast("Campo 'fecha de nacimiento' vacio"); return; }
		        if ($scope.datos.email == undefined) { $rootScope.toast("Campo 'email' vacio"); return; }
		        if ($scope.datos.telefono == undefined) { $rootScope.toast("Campo 'telefono' vacio"); return; }
		        if ($scope.datos.clave == undefined) { $rootScope.toast("Campo 'clave' vacio"); return; }
		        if ($scope.datos.confirmar_clave == undefined) { $rootScope.toast("Campo 'confirmar clave' vacio"); return; }
		        $scope.datos.id_usuario = 0;
		        $scope.datos.nivel = "ADMINISTRADOR";

		        if ($scope.datos.clave != $scope.datos.confirmar_clave) {

		            $rootScope.toast("Las claves escritas no coinciden");
		            return;
		        }
		        $scope.datos.clave = $rootScope.Base64.encode(md5($scope.datos.clave));

		        $('#login').prop("disabled", true);
		        $rootScope.toast("Espera un momento, esto tomará unos cuantos segundos...", 6000);

		        $http.post('register', $scope.datos).then(function(response) {
		            if (response.data.statusCode == 200) {
		                $rootScope.toast("Te has registrado exitosamente, es hora de iniciar sesión");
		                $('#login').prop("disabled", true);
		                $window.location = "#!/login";
		            }
		            if (response.data.statusCode == 201) {
		                $('#login').prop("disabled", false);
		                $rootScope.toast("Ha ocurrido un error, por favor, consulte con el personal de Infomática para resolver esto");
		            }
		        });



		    });




		});
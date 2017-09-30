		app.controller('perfil', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateToken();
			$rootScope.objeto = "Perfil de Usuario";
			
			$rootScope.cambiarClave = function() {

				if($scope.clave_anterior=="" || typeof $scope.clave_anterior == "undefined" ) {
					$rootScope.toast("Por favor, introduza su clave actual");
					return;
				}
				if($scope.clave_nueva=="" || typeof $scope.clave_nueva == "undefined" ) {
					$rootScope.toast("Por favor, introduza su clave nueva");
					return;
				}
				if($scope.clave_repetida=="" || typeof $scope.clave_repetida == "undefined" ) {
					$rootScope.toast("Por favor, confirme su clave nueva");
					return;
				}

				$rootScope.token = {
							cedula: $rootScope.cedula,
							clave : $rootScope.Base64.encode(md5($scope.clave_anterior))
						};

						$rootScope.token = JSON.stringify($rootScope.token);
						$rootScope.token = $rootScope.Base64.encode($rootScope.token);

						$http.get($rootScope.sprintf('api/v1/login/%s',$rootScope.token)).then(function(response) {

							if(response.status==200) {
								if($scope.clave_repetida==$scope.clave_nueva) {
									if($scope.clave_nueva!=$scope.clave_anterior) {
										var data = {
											id: null,
											clave: $rootScope.sha1(md5($scope.clave_nueva))
										};

										$rootScope.put("api/usuario/"+$rootScope.id_usuario, data).then(function(response) {

											if(response!=null) {

												$rootScope.token = {
													cedula: $rootScope.usuario_en_linea.cedula,
													clave : $rootScope.Base64.encode(md5($scope.clave_nueva))
												};


												$rootScope.token = JSON.stringify($rootScope.token);
												$rootScope.token = $rootScope.Base64.encode($rootScope.token);

												$localStorage.token = $rootScope.token;
												$rootScope.alert("Éxito","La clave se ha actualizado","success");
												$scope.clave_nueva = "";
												$scope.clave_anterior = "";
												$scope.clave_repetida ="";



											} else {
												$rootScope.toast("Ocurrio un error al intentar cambiar la clave");
											}
											
										});
									} else {
										$rootScope.toast("Su clave nueva no puede ser igual a la clave actual");
									}

									

								} else {
									$rootScope.toast("Las claves nuevas ingresadas no coinciden entre si");
								}
							} else {
								$rootScope.toast("La clave anterior no coincide con la actual");
							}

							

						});
			};

			$scope.post = function(data) {
				$rootScope.usuario_en_linea.imagen = "loading.gif"
				
				$rootScope.data = {
					encodedImage : data
				};
				$http.post("controller/image.php", $rootScope.data).then(function (response){
			       
			       if(response.data.data!=null) {
			       	var nombre_imagen = response.data.data.split("/").pop();

			       	var data = {
							id: null,
							imagen: nombre_imagen
					};

					$rootScope.put("api/usuario/"+$rootScope.id_usuario, data).then(function(response) {

						$rootScope.usuario_en_linea.imagen = response["0"].imagen;

					});

			       	
			       } else {
			       	//console.log(response);
			       }
			       
			    }, function(response) {
			        	// Aqui va el codigo en caso de error
			    });
			};

			$scope.cargarImagen = function(ruta) {


		    	var container = document.getElementById('imgTest');
		    	var newImage = document.getElementById('imagen');
		        newImage.src = ruta;
		        container.style.width = 'auto';
		        container.style.height = 'auto'

		        container.innerHTML = newImage.outerHTML;

		      	$scope.enlaces.link = $scope.dominio + ruta;
		      	$scope.enlaces.html = "<a href='"+ $scope.dominio + ruta +"'>"+$scope.dominio + ruta+"</a>";
		      	$scope.enlaces.foros = "[IMG]"+$scope.dominio + ruta+"[/IMG]"
		    };

			$scope.encodeImageFileAsURL = function() {
			    var filesSelected = document.getElementById("inputFileToLoad").files;

			    if (filesSelected.length > 0) {
			      var fileToLoad = filesSelected[0];

			      var fileReader = new FileReader();

			      fileReader.onload = function(fileLoadedEvent) {

			      	
			        var data = fileLoadedEvent.target.result; // <--- data: base64
			 		$scope.post(data);
			      }
			      fileReader.readAsDataURL(fileToLoad);
			    }
			  }
		});
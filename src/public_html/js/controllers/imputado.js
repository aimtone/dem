app.controller('imputado', function($rootScope,$scope,$http,$q,$localStorage) {
	$rootScope.validateToken();
	$rootScope.objeto = "Imputado";
	// Variables predefinidas
	$scope.obj_padre = 'persona'; // Siempre terminar URL Con Simbolo "/"
	$scope.obj_hijo = 'imputado'; // Siempre terminar URL Con Simbolo "/"
	// Document Ready Function | Inicio
	// -----------------------------------------------------------------
	// SE EJECUTA DE MANERA AUTOMATICA AL TERMINAR LA CARGA DE LA PAGINA
	// -----------------------------------------------------------------
	angular.element(document).ready(function() {
		$rootScope.get('api/config_datatables').then(function(response) {
			console.log(response);
			if(response["0"]._keys=="1") {
                $scope.tConfig.keys = true;
            } else {
                $scope.tConfig.keys = false;
            }

            if(response["0"].colReorder=="1") {
                $scope.tConfig.colReorder = true;
            } else {
                $scope.tConfig.colReorder = false;
            }
            if(response["0"].info=="1") {
                $scope.tConfig.info = true;
            } else {
                $scope.tConfig.info = false;
            }

            if(response["0"].stateSave=="1") {
                $scope.tConfig.stateSave = true;
            } else {
                $scope.tConfig.stateSave = false;
            }

            if(response["0"].scrollCollapse=="1") {
                $scope.tConfig.scrollCollapse = true;
            } else {
                $scope.tConfig.scrollCollapse = false;
            }

            if(response["0"].paging=="1") {
                $scope.tConfig.paging = true;
            } else {
                $scope.tConfig.paging = false;
            }

            if(response["0"].responsive=="1") {
                $scope.tConfig.responsive = true;
            } else {
                $scope.tConfig.responsive = false;
            }
		});

		$("#example").html("<center id='preload'><div class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle'></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div><p>Cargando...</p></center>");

		setTimeout(function() {
			$('#preload').fadeOut("fast");
			$('#example').html("<thead><tr><th>Cedula</th><th>Nombres</th><th>Apellidos</th><th>Email</th><th>Telefono</th><th>Fecha de Nacimiento</th><th>Condicion</th></tr></thead>");
			// Configuracion de la Datatable
			$scope.config();
			// Configuracion de los eventos de la Datatable
			$scope.tEvents();

        }, 1000);

		// Mascaras de los campos
		$("#fecha_de_nacimiento").mask("99/99/9999",{placeholder:"DD/MM/AAAA"});
		$( "#fecha_de_nacimiento" ).datepicker($.datepicker.regional["es"]);
		$("#telefono").mask("+58 999 999 99 99",{placeholder:"+58 000 000 00 00"});
		//$("#cedula").mask("l-99999999");



		// $rootScope.modal() | Inicio
		// -------------------------------------------------------------
		// Activa la accion de la venta modal dependiendo de cual sea el
		// boton pulsado 
		$scope.modal('.modal',false, null, function() { 
			// Si el boton de la ventana modal pulsado es TRUE (OK)
			if($rootScope.actionButton=="ok") {

				$scope.persona = {
					cedula : $scope.datos.cedula.toUpperCase(),
					nombres : $scope.datos.nombres.toUpperCase(),
					apellidos : $scope.datos.apellidos.toUpperCase(),
					email : $scope.datos.email.toUpperCase(),
					telefono : $scope.datos.telefono,
					fecha_de_nacimiento : $scope.datos.fecha_de_nacimiento,
					id_tipo_persona: 4
				};

				$scope.obj = {
					id: null,
					cedula : $scope.datos.cedula.toUpperCase(),
					condicion : $scope.datos.condicion.toUpperCase()
				};

				// Si la accion del boton es registrar
				if($rootScope.button == "registrar") {
					
					
					$rootScope.post('api/' + $scope.obj_padre, $scope.persona).then(function(response) {
						if(response!=null) {
							var id = response[0].id;
							
							$rootScope.post('api/' + $scope.obj_hijo, $scope.obj).then(function(response) {
								if(response!=null) {
									$scope.table.ajax.reload();
									$rootScope.alert("Exito", "Se ha completado el proceso de manera exitosa", "success");
									$scope.datos = {};
									
								} else {
									$rootScope.alert("Error", "No se ha registrado los datos, por favor, verifique e intente de nuevo", "warning");
								}
								
							}, function(response) {
								$rootScope.alert("Error", "Ha ocurrido un error interno del sistema", "warning");
							});
						} else {
							$rootScope.alert("Error", "No se ha registrado los datos, por favor, verifique e intente de nuevo", "warning");
						}
					}, function(response) {
						$rootScope.alert("Error", "Ha ocurrido un error interno del sistema", "warning");
					});
				}


				// Si la accion del boton es modificar
				if($rootScope.button == "modificar") {
				
					$rootScope.put('api/' + $scope.obj_padre + '/' + $scope.datos.id, $scope.persona).then(function(response) {

						var filter = {
							donde : "where cedula = '" + response[0].cedula + "'" 
						};

						$rootScope.get('api/' + $scope.obj_hijo + '?filter=' + JSON.stringify(filter)).then(function(response) {
							$rootScope.put('api/' + $scope.obj_hijo +'/' + response[0].id, $scope.obj).then(function(response) {
								$scope.table.ajax.reload();
								$rootScope.alert("Exito", "Se ha completado el proceso de manera exitosa", "success");
								$scope.datos = {};
							}, function(response) {
								$rootScope.alert("Error", "Ha ocurrido un error interno del sistema", "warning");
							});


						}, function(response) {
							$rootScope.alert("Error", "Ha ocurrido un error interno del sistema", "warning");
						});




					}, function(response) {
						$rootScope.alert("Error", "Ha ocurrido un error interno del sistema", "warning");
					});

					
				}
			// Si el boton de la ventana modal pulsado es FALSE (Cancelar)
			} else {
				$scope.datos = {};
			}
		});
		// $rootScope.modal() | Fin

		
	});	
	// Document Ready Function | Fin


	$scope.rowDelete = function() {
		$rootScope.confirm("¿Estás seguro?", "Se procedera a eliminar los registros seleccionados", "warning", function() {

			var cantidad = $scope.table.rows('.selected').data().length;
			var i = null;
			var contador = 0;
			for (i = 0; i < cantidad; i++) {
				$rootScope.delete('api/' + $scope.obj_padre + '/' + $scope.table.rows('.selected').data()[i].id).then(function(response) {
					var filter = {
						donde : "where cedula = '" + response[0].cedula + "'" 
					};

					
					$rootScope.get('api/' + $scope.obj_hijo + '?filter=' + JSON.stringify(filter)).then(function(response) {
						$rootScope.delete('api/' + $scope.obj_hijo + '/' + response[0].id).then(function(response) {

							

							if(cantidad == 1 ) {
								$rootScope.alert("Exito", "Se ha eliminado " + contador + " de " + cantidad + " registro", "success");

							} else {
								$rootScope.alert("Exito", "Se ha eliminado " + contador + " de " + cantidad + " registros", "success");

							}

							$scope.table.ajax.reload();
						

						}, function(response) {
							$rootScope.alert("Error", "Ha ocurrido un error interno del sistema", "warning");
						});
					}, function(response) {
						$rootScope.alert("Error", "Ha ocurrido un error interno del sistema", "warning");
					});
				});
				contador++;
			};
				
				
		}, function() { 
			// codigo del boton cancelar

		});

		

	};

	// Funcion para autocompletar
	$rootScope.getPersona = function(cedula) {
		$('.autocomplete').fadeOut('fast','linear');
		
		var filter = {
			donde : "where cedula = '" + cedula + "'"
		};

		$rootScope.get('api/' + $scope.obj_padre + '?filter=' + JSON.stringify(filter)).then(function(response) {
			if(response!=undefined) {
				$scope.datos = response[0];
			} else {
				$scope.datos = {
					"cedula" : cedula
				};
			}
	        
	    }, function(response) {
	       	console.log(response);
	   	});

		
    }

	// -----------------------------------------------------------------
	// FUNCIONES DE LA DATATABLE | INICIO
	// -----------------------------------------------------------------

	$scope.tConfig = {
			language: {
			    "url": "public_html/lang/datatables/" + $localStorage.locale + ".json"
			},
			processing: false,
			ordering: true,
			keys: false,
			info: false,
			stateSave: true,
			autoFill: false,
			scrollY: '50vh',
			scrollX: false,
			scrollCollapse: true,
			responsive: true,
			paging: true,
			colReorder: true,
			dom: 'Bfrtip',
	        select: true,
	        buttons: [
	            {
	                text: "<i title='Marcar todo' class='fa fa-check-square'></i>",
	                className: 'toolbar check_all',
	                action: function () {
	                    $scope.table.rows().select();
	                }
	            },
	            {
	                text: "<i title='Desmarcar todo' class='fa fa-square'></i>",
	                className: 'toolbar uncheck_all',
	                action: function () {
	                    $scope.table.rows().deselect();
	                }

	            },
	            {
	            	extend: 'copy',
	            	text: "<i title='Copiar' class='fa fa-clipboard'></i>",
	            	className: 'toolbar copy'
	            },
	            {
	            	extend: 'excel',
	            	text: "<i title='Exportar a Excel' class='fa fa-file-excel-o'></i>",
	            	className: 'toolbar excel'
	            },
	            {
	            	extend: 'csv',
	            	text: "<i title='Exportar a CSV' class='fa fa-file-text'></i>",
	            	className: 'toolbar csv'
	            },
	            {
	            	extend: 'pdf',
	            	text: "<i title='Exportar a PDF' class='fa fa-file-pdf-o'></i>",
	            	className: 'toolbar pdf'
	            }

	        ],
			ajax: {
				url: 'api/vista_' + $scope.obj_hijo,
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded',
					'Authorization' : $localStorage.token
				}
			},
			columns: 
				[
				    
				    { "data": "null", render: function ( data, type, row ) {
				        return row.cedula;
				    } },
				    { "data": "nombres" },
				    { "data": "apellidos" },
				    { "data": "email" },
				    { "data": "telefono" },
				    { "data": "fecha_de_nacimiento" },
				    { "data": "condicion" }
				]
	};

	$scope.config = function() {
		$scope.dataFilter = {
			donde : "where id_tipo_persona = 2"
		}

		$scope.table = $('#example').DataTable($scope.tConfig);


		new $.fn.dataTable.ColReorder( $scope.table, {
			// options
		} );

		// new $.fn.dataTable.KeyTable( $scope.table, {
		// 	// options
		// } );

		
	}

	setInterval( function () {
	    $scope.table.ajax.reload();
	}, 60000 );

	$scope.tEvents = function() {
		$scope.table.on( 'select', function ( e, dt, type, indexes ) {
            var rowData = $scope.table.rows( indexes ).data().toArray();
            $scope.clave_primaria = rowData[0].id;

        }).on( 'deselect', function ( e, dt, type, indexes ) {
            var rowData = $scope.table.rows( indexes ).data().toArray();
        }); 
	}


	// -----------------------------------------------------------------
	// FUNCIONES DE LA DATATABLE | FIN
	// -----------------------------------------------------------------

	// -----------------------------------------------------------------
	// FUNCIONES DE LA VENTANA MODAL | INICIO
	// -----------------------------------------------------------------	

	$scope.modal = function(div, dismissible, ready, complete) {
		// Asigma la configuracion de ventana modal al div enviado
		$scope.modalWindow(div);
		// Establece las funciones del modal
		$(div).modal({
			dismissible: dismissible,
			// Cuando el modal se carga por completo
			ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
				if(ready!=null) {
					ready(this);
				}	
			},
			// Cuando el modal se cierra
			complete: function() { 
				complete(this);
			} 
		});
	}

	$scope.openModal = function(div,button) {

		// Asigno el nombre de la accion seleccionada (registrar o modificar)
		$rootScope.button = button;

		// Hacer esto si la accion seleccionada es registrar
	    if(button == "registrar") {
	    	// Desmarca cualquier elemento en la datatable
	        $scope.table.rows().deselect();
	        // Abre la ventana modal
	        $(div).modal('open');	
	        
	    }

	    // Hacer esto si la accion seleccionada es modificar
	    if(button == "modificar") {
	    	// Si la cantidad de filas seleccionadas es mayor que 1
	        if($scope.table.rows('.selected').data().length > 1) {
	        	$rootScope.alert("Error", "Solo puedes modificar un fila a la vez", "warning");
	        // Si la cantidad de filas seleccionada es ninguna
			} else if ($scope.table.rows('.selected').data().length <= 0) {
				$rootScope.alert("Error", "Debes seleccionar un registro a modificar", "warning");
			// Si la cantidad de filas seleccionada es solo 1 (Solo se puede modificar una fila a la vez)
	        } else {
	        	$(div).modal('open');


	        	$rootScope.get('api/vista_' + $scope.obj_hijo + '/' + $scope.clave_primaria).then(function(response) {
	        		$scope.datos = response[0];
	        	}, function(response) {
	        		console.log(response);
	        	});


	        }
	    }
	}
	
	$scope.closeModal = function(div,button) {
		if(button=='ok') {
			if($scope.datos==undefined) { $rootScope.toast("Rellene los campos"); return; }
			if($scope.datos.cedula==undefined) {  $rootScope.toast("Campo 'cedula' vacio"); return; }
			if($scope.datos.nombres==undefined) { $rootScope.toast("Campo 'nombres' vacio");  return;}
			if($scope.datos.apellidos==undefined) { $rootScope.toast("Campo 'apellidos' vacio");  return;}
			if($scope.datos.fecha_de_nacimiento==undefined) { $rootScope.toast("Campo 'fecha de nacimiento' vacio");  return;}
			if($scope.datos.email==undefined) {  $rootScope.toast("Campo 'email' vacio");  return;}
			if($scope.datos.telefono==undefined) {  $rootScope.toast("Campo 'telefono' vacio");  return;}
			if($scope.datos.condicion==undefined) {  $rootScope.toast("Campo 'condicion' vacio");  return;}

			$(div).modal('close');
		}

		if(button=='cancelar') {
			$(div).modal('close');
		}

		

	}
	$scope.modalAction = function(button) {

		$rootScope.actionButton = button;
		$('.autocomplete').fadeOut('fast','linear');
	}
	// -----------------------------------------------------------------
	// FUNCIONES DE LA VENTANA MODAL | FIN
	// -----------------------------------------------------------------	
});
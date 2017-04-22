app.controller('sala', function($rootScope,$scope,$http,$q,$localStorage) {
	$rootScope.validateToken();
	$rootScope.objeto = "Sala";
	// Variables predefinidas
	$scope.obj_padre = 'sala'; // Siempre terminar URL Con Simbolo "/"
	// Document Ready Function | Inicio
	// -----------------------------------------------------------------
	// SE EJECUTA DE MANERA AUTOMATICA AL TERMINAR LA CARGA DE LA PAGINA
	// -----------------------------------------------------------------
	angular.element(document).ready(function() {

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

				$scope.sala = {
					id: null,
					descripcion : $scope.datos.descripcion.toUpperCase(),
					color : $scope.datos.color.toUpperCase(),
				};


				// Si la accion del boton es registrar
				if($rootScope.button == "registrar") {
					
					
					$rootScope.post('api/' + $scope.obj_padre, $scope.sala).then(function(response) {

						if(response!=null) {
							$scope.table.ajax.reload();
							$scope.datos = {};
							$rootScope.alert("Exito", "Se ha completado el proceso de manera exitosa", "success");
							
						} else {
							$rootScope.alert("Error", "No se ha registrado los datos, por favor, verifique e intente de nuevo", "warning");
						}
					}, function(response) {
						$rootScope.alert("Error", "Ha ocurrido un error interno del sistema", "warning");
					});
				}


				// Si la accion del boton es modificar
				if($rootScope.button == "modificar") {

				
					$rootScope.put('api/' + $scope.obj_padre + '/' + $scope.datos.id, $scope.sala).then(function(response) {
						if(response!=null) {
							$scope.table.ajax.reload();
							$scope.datos = {};
							$rootScope.alert("Exito", "Se ha completado el proceso de manera exitosa", "success");
							
						} else {
							$rootScope.alert("Error", "No se ha modificado los datos, por favor, verifique e intente de nuevo", "warning");
						}



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

		// Configuracion de la Datatable
		$scope.tConfig();
		// Configuracion de los eventos de la Datatable
		$scope.tEvents();
	});	
	// Document Ready Function | Fin


	$scope.rowDelete = function() {
		$rootScope.confirm("¿Estás seguro?", "Se procedera a eliminar los registros seleccionados", "warning", function() {

			var cantidad = $scope.table.rows('.selected').data().length;
			var i = null;
			var contador = 0;
			for (i = 0; i < cantidad; i++) {
				$rootScope.delete('api/' + $scope.obj_padre + '/' + $scope.table.rows('.selected').data()[i].id).then(function(response) {
				

					
		
							if(cantidad == 1 ) {
								$rootScope.alert("Exito", "Se ha eliminado " + contador + " de " + cantidad + " registro", "success");

							} else {
								$rootScope.alert("Exito", "Se ha eliminado " + contador + " de " + cantidad + " registros", "success");

							}

							$scope.table.ajax.reload();
						



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

	$scope.tConfig = function() {
		$scope.dataFilter = {
			donde : "where id_tipo_persona = 2"
		}

		$scope.table = $('#example').DataTable( {
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
				url: 'api/' + $scope.obj_padre,
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded',
					'Authorization' : $localStorage.token
				}
			},
			columns: 
				[
				    
				    //{ "data": "null", render: function ( data, type, row ) {
				      //  return row.id;
				    //} },
				    { "data": "descripcion" },
				    { "data": "null", render: function ( data, type, row ) {
				    	var text = "<center><input disabled type='color' value='"+row.color+"' style='width:20px;height:22px;'></center>";
				        return text;
				    } }
				]
		} );


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


	        	$rootScope.get('api/' + $scope.obj_padre + '/' + $scope.clave_primaria).then(function(response) {
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
			 if($scope.datos.descripcion==undefined) {  $rootScope.toast("Campo 'descripcion' vacio"); return; }
			 if($scope.datos.color==undefined) { $rootScope.toast("Seleccione un color");  return;}
			

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
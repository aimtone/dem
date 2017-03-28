app.controller('defensor', function($rootScope,$scope,$http,$q,$localStorage) {

	


	$rootScope.objeto = "Defensor";
	// Variables predefinidas
	$scope.url = 'api/persona/'; // Siempre terminar URL Con Simbolo "/"
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
				// Si la accion del boton es registrar
				if($rootScope.button == "registrar") {
					$scope.usuario.id_tipo_persona = 1;
					$scope.post($scope.url, $scope.usuario);
				}
				// Si la accion del boton es modificar
				if($rootScope.button == "modificar") {
					$scope.put($scope.url, $scope.usuario, $scope.usuario.id);
				}
			// Si el boton de la ventana modal pulsado es FALSE (Cancelar)
			} else {
				$scope.usuario = {};
			}
		});
		// $rootScope.modal() | Fin

		// Funcion que activa la eliminacion de registros segun el numero de filas seleccionada
		$scope.rowDelete = function() {
			$rootScope.confirm("Seguro", "se eliminara", "warning", function() {
				
				var cantidad = $scope.table.rows('.selected').data().length;
				var i = null;
				for (i = 0; i < cantidad; i++) {
					$scope.delete($scope.url, $scope.table.rows('.selected').data()[i].id).then(function(response) {
						if(response == true) {
							$scope.table.row('.selected').remove().draw();
						}
					});
				};

				$rootScope.alert("Eliminado", "Se han eliminado " + i + " de " + cantidad + " registros seleccionados", "success");

			}, function() { 
				// codigo del boton cancelar
			});
		}

		// Configuracion de la Datatable
		$scope.tConfig();
		// Configuracion de los eventos de la Datatable
		$scope.tEvents();
	});	
	// Document Ready Function | Fin

	// -----------------------------------------------------------------
	// FUNCIONES PRINCIPALES | INICIO
	// -----------------------------------------------------------------

	$scope.get = function(cedula) {
		var filtro = {
			donde: "where cedula = '" + cedula + "'"
		}
		if(cedula!="") {
			$http.get('api/persona?filter=' + JSON.stringify(filtro)).then(function(response) {
				var data = response.data.data[0];

				if(data != undefined) {
					$scope.usuario = data;
					$('.autocomplete').fadeOut('fast','linear');
				}

			}, function(response) {

			});
		}
	}

	// Funcion para insertar un nuevo registro
	$scope.post = function(url, data) {

		console.log(data);

		$http.post(url, data).then(function (response) {
			var data = response.data.data;

			// Si la respuesta de la solicitud trae algo
			if(data != null) {
				$rootScope.alert("Registro Completado", "Se ha registrado su solicitud de manera exitosa", "success");
				$scope.table.row.add(data[0]).draw();
				$scope.usuario = {};
			// Si la respuesta de la solicitud no trae nada
			} else {
				$rootScope.alert("Error de Registro", "No se ha registrado su solicitud, por favor, verifique los datos e intente nuevamente", "error");
			}		
		}, function(response) {
			// Codigo en caso de error de solicitud
			$rootScope.alert("Error de Registro", "Ocurrio un error al intentar procesar la solicitud", "error");
		});
	}

	// Funcion para modificar un registro
	$scope.put = function(url, data, id) {
		$http.put(url + id, data).then(function (response) {
			var data = response.data.data;

			// Si la respuesta de la solicitud trae algo
			if(data!=null) {
				$rootScope.alert("Registro Actualizado", "Se ha modificado su solicitud de manera exitosa", "success");
				$scope.usuario = {};
				
				$scope.table.ajax.reload();
			// Si la respuesta de la solicitud no trae nada
			} else {
				$rootScope.alert("Error de Registro", "No se ha registrado su solicitud, por favor, verifique los datos e intente nuevamente", "error");
			}

		}, function(response) {
			// Codigo en caso de error
			$rootScope.alert("Error de Registro", "Ocurrio un error al intentar procesar la solicitud", "error");
		});
	}

	// Funcion para modificar un registro
	$scope.delete = function(url, id) {
		var defered = $q.defer();
        var promise = defered.promise;
		$http.delete(url + id).then( function (response) {
			var data = response.data.data;

			if(data != null) {
				defered.resolve(true);

			} else {
				defered.reject(false);
			}

		    }, function (response){
			    defered.reject(false);
			}
		);
		return promise;
	}



	// -----------------------------------------------------------------
	// FUNCIONES PRINCIPALES | FIN
	// -----------------------------------------------------------------


	// -----------------------------------------------------------------
	// FUNCIONES DE LA DATATABLE | INICIO
	// -----------------------------------------------------------------

	$scope.tConfig = function() {
		$scope.dataFilter = {
			donde : "where id_tipo_persona = 1"
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
			ajax: $scope.url + "?filter=" + JSON.stringify($scope.dataFilter),
			columns: 
				[
				    
				    { "data": "null", render: function ( data, type, row ) {
				        return row.cedula;
				    } },
				    { "data": "nombres" },
				    { "data": "apellidos" },
				    { "data": "email" },
				    { "data": "telefono" },
				    { "data": "fecha_de_nacimiento" }
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
            $scope.usuario = rowData[0];

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
	        // Limpiar el modelo
	        $scope.usuario = {};
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
	        }
	    }
	}
	
	$scope.closeModal = function(div,button) {
		$(div).modal('close');
	}
	$scope.modalAction = function(button) {

		$rootScope.actionButton = button;
		$('.autocomplete').fadeOut('fast','linear');
	}
	// -----------------------------------------------------------------
	// FUNCIONES DE LA VENTANA MODAL | FIN
	// -----------------------------------------------------------------	
});
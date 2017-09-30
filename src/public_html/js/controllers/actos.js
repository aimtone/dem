		app.controller('actos', function($rootScope,$scope,$http,$localStorage,$location,$window) {
			$rootScope.validateToken();
			$rootScope.objeto = "Actos";
            $scope.obj_padre = 'acto_sala'; // Siempre terminar URL Con Simbolo "/"
            

            angular.element(document).ready(function() {
                $("#example").html("<center id='preload'><div class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle'></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div><p>Cargando...</p></center>");
                setTimeout(function() {
                    $('#preload').fadeOut("fast");
                    $('#example').html("<thead><tr><th>Inicio</th><th>Fin</th><th>Sala</th><th>Estatus</th><th>Titulo</th><th>Numero</th><th>Descripcion</th><th>Tribunal</th></tr></thead>");

                    // Configuracion de la Datatable
                    $scope.config();
                    // Configuracion de los eventos de la Datatable
                    $scope.tEvents();

                }, 1000);
            });

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
                            { "data": "start" },
                            { "data": "end" },
                            { "data": "sala" },
                            { "data": "estatus" },
                            { "data": "title" },
                            { "data": "numero" },
                            { "data": "descripcion" },
                            { "data": "tribunal" }




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
                    $scope.clave_primaria = rowData[0].numero;

                }).on( 'deselect', function ( e, dt, type, indexes ) {
                    var rowData = $scope.table.rows( indexes ).data().toArray();
                }); 
            }


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
                            //console.log(response);
                        });


                    }
                }
            }
            
            $scope.closeModal = function(div,button) {
                if(button=='ok') {
                    if($scope.datos==undefined) { $rootScope.toast("Rellene los campos"); return; }
                    if($scope.datos.descripcion==undefined) {  $rootScope.toast("Campo 'descripción' vacio"); return; }
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

            $scope.vistaCaso = function(accion) {
                
                $rootScope.accion_caso = accion;
                if(accion=="registrar") {
                    $rootScope.clave_caso = undefined;
                    $window.location.href= "#!/caso";

                } else {
                    if(typeof $scope.clave_primaria != "undefined") {
                        $rootScope.clave_caso = $scope.clave_primaria;
                        $window.location.href= "#!/caso";
                        
                    } else {
                        $rootScope.alert("Error", "Debes seleccionar un registro para modificar","info");
                    }
                }
                
            };
			
			
		});
		app.controller('bitacora', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateToken();
			$rootScope.objeto = "Bitacora";

            $(document).ready(function() {
                // Setup - add a text input to each footer cell
                $('#example tfoot th').each( function () {
                    var title = $(this).text();
                    $(this).html( '<input type="text" placeholder="'+title+'" />' );
                } );
            
                // DataTable
                $scope.table = $('#example').DataTable( {
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
                        url: 'api/bitacora',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                            'Authorization' : $localStorage.token
                        }
                    },
                    columns: 
                        [
                            
                           
                            { "data": "fecha" },
                            { "data": "operacion" },
                            { "data": "null", render: function ( data, type, row ) {
                                var jsonString = row.registro_anterior;
                                var jsonPretty = JSON.stringify(JSON.parse(jsonString),null,2);  
                                return "<pre class='minus'>"+jsonPretty+"</pre>";
                            } },
                            { "data": "null", render: function ( data, type, row ) {
                                var jsonString = row.registro_nuevo;
                                var jsonPretty = JSON.stringify(JSON.parse(jsonString),null,2);  
                                return "<pre class='minus'>"+jsonPretty+"</pre>";
                            } }
                        ]
                } );
            
                // Apply the search
                $scope.table.columns().every( function () {
                    var that = this;
            
                    $( 'input', this.footer() ).on( 'keyup change', function () {
                        if ( that.search() !== this.value ) {
                            that
                                .search( this.value )
                                .draw();
                        }
                    } );
                } );
            } );
			
		});
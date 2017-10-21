		app.controller('bitacora', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateToken();
			$rootScope.objeto = "Bitácora";

            $(document).ready(function() {

                $rootScope.get('api/bitacora').then(function(response) {
                    //console.log(response);
                });
                // Setup - add a text input to each footer cell
                $('#example tfoot th').each( function () {
                    var title = $(this).text();
                    $(this).html( '<input type="text" placeholder="'+title+'" />' );
                } );
            
                // DataTable
                var filter = JSON.stringify({
                    ordenarPor : "ORDER BY id DESC"
                });
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
                        url: 'api/vista_bitacora?filter='+filter,
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                            'Authorization' : $localStorage.token
                        }
                    },
                    columns: 
                        [
                            
                           
                            { "data": "null", render: function ( data, type, row ) {
                            	var fecha = moment(row.fecha).format("DD/MM/YYYY h:m a");
						    	return fecha;
						    } },
                            { "data": "operacion" },
                            { "data": "tabla" },
                            { "data": "accion" },
                            
                            { "data" : "usuario"}
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
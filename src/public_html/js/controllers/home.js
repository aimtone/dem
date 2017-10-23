		app.controller('home', function($rootScope, $scope, $http, $localStorage, $location) {
		    $rootScope.validateToken();
		    $rootScope.objeto = "Página Principal";	
		    $scope.today = moment().format("YYYY-MM-DD");
		    $scope.chart = [];
		    $scope.ejeX = [];

		    $scope.grafico = {
		    	tabla: "acto_sala",
		    	label : "estatus",
		    	data : "COUNT(*)",
		    	titulo : "Cantidad de Actos por su estatus",
		    	tipo : "bar",
		    	agrupar: ["estatus"],
		    	representacion: "porcentaje"
		    };

		    

		    $scope.tablas = [
		    {
		    		nombre: "TABLAS",
		    		tablas: [
		    			{
		    				nombre: "Actividad",
		    				nombre_real: "actividad",
		    				campos: 
		    					[
			    					{
				    					nombre: "ID",
				    					nombre_real: "ID"
				    				},
				   					{
				   						nombre: "Actividad",
				   						nombre_real: "actividad"
				   					},
				   					{
			    						nombre: "ID del tipo de tribunal",
			    						nombre_real: "id_tipo_tribunal"
			    					}
		    					]
		    			}
		    		]
		    	},
		    	{
		    		nombre: "VISTAS",
		    		tablas: [
		    			{
		    				nombre: "Acto",
		    				nombre_real: "acto_sala",
		    				campos: 
		    					[
			    					{
				    					nombre: "Estatus",
				    					nombre_real: "estatus"
				    				},
				    				{
				    					nombre: "Causa",
				   						nombre_real: "numero"
				   					},
			    					{
			    						nombre: "Tribunal",
			    						nombre_real: "tribunal"
			    					},
				    				{
				   						nombre: "Tipo de Tribunal",
				   						nombre_real: "tipo_de_tribunal"
				    				}
		    					]
		    			}
		    		]
		    	}


		    ];


		   /*
		   @params
		   titulo : 	titulo del grafico
		   pocision: 	pocision de la variable donde desea almacenar el grafico
		   tabla: 		tabla de la BD usada para buscar los datos
		   etiquetas: 	etiquetas de los datos
		   datos: 		datos del grafico,
		   agrupar: 	agrupar
		   */

		    $rootScope.cargarChart = function(titulo, pocision, tabla, etiquetas, datos, agrupar, representacion) {
	            var labels = [];
	            var data = [];

	            var filter1 = JSON.stringify({
			    	campos: datos + " AS cantidad"
	            });

	            var join_agrupar = agrupar.join();

	            

	           
	            $rootScope.get('api/'+tabla+'?filter=' + filter1).then(function(response) {

	            	var cantidad = response["0"].cantidad;
	            	var filter = JSON.stringify({
				    	campos: etiquetas + " AS labels, " + datos + " AS data",
		                agruparPor: "GROUP BY " + join_agrupar
		            });

		            $rootScope.get('api/'+tabla+'?filter=' + filter).then(function(response) {

		            	console.log(response);
		                for (var i = response.length - 1; i >= 0; i--) {
		                	labels.push(response[i].labels);

		                	if(representacion=="porcentaje") {
		                		data.push($rootScope.redondear((100 * response[i].data)/cantidad, 2));
		                	} else {
		                		data.push(response[i].data);
		                	}
		                	
		                	
		                }

		                var object = {
		                	title : titulo,
		                	labels : labels,
		                	data: data
		                };

		                $scope.chart[pocision] = object; 
		            });
	            
	            });


	            
		    };



		    $rootScope.cargarEventos = function(fecha) {

		    	var filter = JSON.stringify({
				   	donde : "WHERE start LIKE '"+fecha+"%'"
		        });

		        $rootScope.get('api/acto_sala?filter=' + filter).then(function(response) {
		        	$rootScope.eventos_hoy = response;
		        });

		    }


		    $rootScope.cargarChart($scope.grafico.titulo, 0, $scope.grafico.tabla, $scope.grafico.label, $scope.grafico.data, $scope.grafico.agrupar, $scope.grafico.representacion);

		    var date = moment().format("YYYY-MM-DD");
		    $rootScope.cargarEventos(date);
		    
		    $rootScope.cargarEjeX = function(array) {
		    	if(array=="actividad") {
		    		$scope.data_field = $scope.tablas["0"].tablas["0"].campos;

		    	}
		    	if(array=="acto_sala") {
		    		$scope.data_field = $scope.tablas["1"].tablas["0"].campos;

		    	}
		    	
		    }

		    $rootScope.cargarFiltro = function() {
		        console.log("entra aca");
		        alert($scope.filtroSeleccionado);
		    };

		    $rootScope.b64toBlob = function(b64Data, contentType, sliceSize) {
		        contentType = contentType || '';
		        sliceSize = sliceSize || 512;

		        var byteCharacters = atob(b64Data);
		        var byteArrays = [];

		        for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
		            var slice = byteCharacters.slice(offset, offset + sliceSize);

		            var byteNumbers = new Array(slice.length);
		            for (var i = 0; i < slice.length; i++) {
		                byteNumbers[i] = slice.charCodeAt(i);
		            }

		            var byteArray = new Uint8Array(byteNumbers);

		            byteArrays.push(byteArray);
		        }

		        var blob = new Blob(byteArrays, {
		            type: contentType
		        });
		        return blob;
		    }

		    $rootScope.canvasToPDF = function() {
		    	html2canvas($('div.grafico:not(.ng-hide) canvas'), {
	            onrendered: function (canvas) {
	                var data = canvas.toDataURL();
	                var docDefinition = {
	                    content: [
	                    	{
			                    text: 'AGENDA UNICA DE ACTOS',
			                    alignment: 'center'
			                },
			                {
			                    text: 'CIRCUITO JUDICIAL PENAL DEL ESTADO YARACUY',
			                    alignment: 'center'
			                },
			                {
			                    text: moment().format("DD/MM/YYYY"),
			                    alignment: 'center',
			                    margin: [5, 2, 10, 20]
			                },
		                    {
		                    	text: $scope.grafico.titulo,
		                    	alignment: "center",
		                    	style: "bold"
		                    },
		                    {
		                        image: data,
		                        width: 400,
		                        alignment:"center",
		                        margin: [20, 20, 20, 20]
		                    }
	                    ]
	                };
	                pdfMake.createPdf(docDefinition).download($scope.grafico.titulo + ".pdf");
	            }
	        });
		    }

		    $rootScope.generarPDF = function() {

		    	var filter = JSON.stringify({
		    		donde: "WHERE HORA LIKE '"+moment().format("YYYY-MM-DD")+"%'"
		    	});

		    	$rootScope.get('api/vista_acto?filter='+filter).then(function(response) {

		    		var table_body = [['ID','CAUSA','IMPUTADO','TRIBUNAL','ACTO','HORA','SALA']];

		    		for (var i = response.length - 1; i >= 0; i--) {
		    			var data = [response[i].ID, response[i].CAUSA, response[i].IMPUTADO, response[i].TRIBUNAL, response[i].ACTO, moment(response[i].HORA).format("LT"), response[i].SALA];
		    			table_body.push(data);
		    		}


		    		var docDefinition = {
			            //header:"",
			            footer: function(currentPage, pageCount) {
			                return {
			                    text: 'Página ' + currentPage.toString() + ' de ' + pageCount,
			                    alignment: 'right'
			                };
			            },
			            pageSize: 'A4',
			            pageOrientation: 'landscape',
			            pageMargins: [40, 60, 40, 60],
			            content: [
			            	{
			                    text: 'AGENDA UNICA DE ACTOS',
			                    alignment: 'center'
			                },
			                {
			                    text: 'CIRCUITO JUDICIAL PENAL DEL ESTADO YARACUY',
			                    alignment: 'center'
			                },
			                {
			                    text: moment().format("DD/MM/YYYY"),
			                    alignment: 'center',
			                    margin: [5, 2, 10, 20]
			                },
			            	{
			                    table: {
			                        headerRows: 1,
			                        alignment: "center",
			                        //widths: ['*', 'auto', 100, '*'],

			                        body: table_body
			                    }
			                }
			            ],
			            styles: {
			                header: {
			                    fontSize: 16,
			                    bold: true
			                },
			                anotherStyle: {
			                    italic: true,
			                    alignment: 'center'
			                }
			            }
			        };

			        var pdf = pdfMake.createPdf(docDefinition);
			        pdf.getBase64((data) => {
			            var contentType = 'application/pdf';
			            var blob = $rootScope.b64toBlob(data, contentType);
			            var filename = docDefinition.content["0"].text;
			            var result = saveAs(blob, filename);
			        });

		    	});



		        

		       /* {
		                    text: 'This is a header',
		                    style: 'header'
		                },
		                'No styling here, this is a standard paragraph', {
		                    text: 'Another text',
		                    style: 'anotherStyle'
		                }, {
		                    text: 'Multiple styles applied',
		                    style: ['header', 'anotherStyle']
		                }, {
		                    columns: [{
		                        // auto-sized columns have their widths based on their content
		                        width: 'auto',
		                        text: 'First column'
		                    }, {
		                        // star-sized columns fill the remaining space
		                        // if there's more than one star-column, available width is divided equally
		                        width: '*',
		                        text: 'Second column'
		                    }, {
		                        // fixed width
		                        width: 100,
		                        text: 'Third column'
		                    }, {
		                        // percentage width
		                        width: '10%',
		                        text: 'Last column'
		                    }],
		                    // optional space between columns
		                    columnGap: 10
		                },

		                {
		                    table: {
		                        // headers are automatically repeated if the table spans over multiple pages
		                        // you can declare how many rows should be treated as headers
		                        headerRows: 1,
		                        widths: ['*', 'auto', 100, '*'],

		                        body: [
		                            ['First', 'Second', 'Third', 'The last one'],
		                            ['Value 1', 'Value 2', 'Value 3', 'Value 4'],
		                            [{
		                                text: 'Bold value',
		                                bold: true
		                            }, 'Val 2', 'Val 3', 'Val 4']
		                        ]
		                    }
		                }, {
		                    ul: [
		                        'Item 1',
		                        'Item 2',
		                        'Item 3', {
		                            text: 'Item 4',
		                            bold: true
		                        },
		                    ]
		                }, {
		                    // for numbered lists set the ol key
		                    ol: [
		                        'Item 1',
		                        'Item 2',
		                        'Item 3'
		                    ]
		                }, {
		                    text: 'sample',
		                    margin: [5, 2, 10, 20]
		                },
		                'paragraph 1',
		                'paragraph 2', {
		                    columns: [
		                        'first column is a simple text', [
		                            // second column consists of paragraphs
		                            'paragraph A',
		                            'paragraph B',
		                            'these paragraphs will be rendered one below another inside the column'
		                        ]
		                    ]
		                }*/

		        

		    };



		});
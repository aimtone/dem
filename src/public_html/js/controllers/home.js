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
	                	header: [
	                	{
			            		image: 'data:image/jpeg;base64,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',
			            		width: 80,
      							height: 80,
      							margin: [ 10, 10, 10, 20 ]
			            	}
	                	],
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

		    		var table_body = [['ID','CAUSA','IMPUTADO','TRIBUNAL','FISCAL','DEFENSOR','ACTO','HORA','ALGUACIL','SALA','OBSERVACION']];

		    		for (var i = 0; i < response.length; i++) {
		    			var data = [response[i].ID, response[i].CAUSA, response[i].IMPUTADO, response[i].TRIBUNAL,response[i].FISCAL,response[i].DEFENSOR, response[i].ACTO, moment(response[i].HORA).format("hh:mm a"), response[i].ALGUACIL,response[i].SALA, response[i].OBSERVACION];
		    			table_body.push(data);
		    		}


		    		var docDefinition = {

			            header: [
		                	{
				            		image: 'data:image/jpeg;base64,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',
				            		width: 80,
	      							height: 80,
	      							margin: [ 30, 30, 10, 20 ]
				            }
	                	],
			            footer: function(currentPage, pageCount) {
			                return {
			                    text: 'Página ' + currentPage.toString() + ' de ' + pageCount,
			                    alignment: 'right'
			                };
			            },
			            pageSize: 'LEGAL',
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

			                        body: table_body,
			                        fontSize: 12,
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
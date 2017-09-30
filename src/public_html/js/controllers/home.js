		app.controller('home', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateToken();
			$rootScope.objeto = "Pagina Principal";

			$scope.chart = [
				{
					labels : ['2006', '2007', '2008', '2009', '2010', '2011', '2012'],
					data : [
						[65, 59, 80, 81, 56, 55, 40],
						[65, 59, 80, 81, 56, 55, 40]
					],
					series: ['Serie 1', 'Serie 2']
				},
				{
					labels : ['2006', '2007', '2008', '2009', '2010', '2011', '2012'],
					data : [65, 59, 80, 81, 56, 55, 40]
				},
				{
					labels : ['2006', '2007', '2008', '2009', '2010', '2011', '2012'],
					data : [65, 59, 80, 81, 56, 55, 40]
				},
				{
					labels : ['2006', '2007', '2008', '2009', '2010', '2011', '2012'],
					data : [65, 59, 80, 81, 56, 55, 40]
				}
			];

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
				    
				  var blob = new Blob(byteArrays, {type: contentType});
				  return blob;
				}

			$rootScope.generarPDF = function() {

					

				 var docDefinition = {
				  header: "Direccion Ejecutiva de la Magistratura",
				  footer: function(currentPage, pageCount) { 
				  	return { text: 'Página ' + currentPage.toString() + ' de ' + pageCount, alignment: 'right'}; 
				  },
				  pageSize: 'A4',
				  pageOrientation: 'portrait',
				  pageMargins: [ 40, 60, 40, 60 ],
				  content: [
				  	{ text: 'This is a header', style: 'header' },
				    'No styling here, this is a standard paragraph',
				    { text: 'Another text', style: 'anotherStyle' },
				    { text: 'Multiple styles applied', style: [ 'header', 'anotherStyle' ] },
				    {
				      columns: [
				        {
				          // auto-sized columns have their widths based on their content
				          width: 'auto',
				          text: 'First column'
				        },
				        {
				          // star-sized columns fill the remaining space
				          // if there's more than one star-column, available width is divided equally
				          width: '*',
				          text: 'Second column'
				        },
				        {
				          // fixed width
				          width: 100,
				          text: 'Third column'
				        },
				        {
				          // percentage width
				          width: '10%',
				          text: 'Last column'
				        }
				      ],
				      // optional space between columns
				      columnGap: 10
				    },

				    {
				      table: {
				        // headers are automatically repeated if the table spans over multiple pages
				        // you can declare how many rows should be treated as headers
				        headerRows: 1,
				        widths: [ '*', 'auto', 100, '*' ],

				        body: [
				          [ 'First', 'Second', 'Third', 'The last one' ],
				          [ 'Value 1', 'Value 2', 'Value 3', 'Value 4' ],
				          [ { text: 'Bold value', bold: true }, 'Val 2', 'Val 3', 'Val 4' ]
				        ]
				      }
    				},
    				{
				      ul: [
				        'Item 1',
				        'Item 2',
				        'Item 3',
				        { text: 'Item 4', bold: true },
				      ]
				    },
				    {
				      // for numbered lists set the ol key
				      ol: [
				        'Item 1',
				        'Item 2',
				        'Item 3'
				      ]
				    },
				    { text: 'sample', margin: [ 5, 2, 10, 20 ] },
				    'paragraph 1',
				    'paragraph 2',
				    {
				      columns: [
				        'first column is a simple text',
				        [
				          // second column consists of paragraphs
				          'paragraph A',
				          'paragraph B',
				          'these paragraphs will be rendered one below another inside the column'
				        ]
				      ]
				    }
				  ],
				  styles: {
				     header: {
				       fontSize: 22,
				       bold: true
				     },
				     anotherStyle: {
				       italic: true,
				       alignment: 'right'
				     }
				   }
				};

				var pdf = pdfMake.createPdf(docDefinition);
				pdf.getBase64((data) => {
					var contentType = 'application/pdf';
					var blob = $rootScope.b64toBlob(data, contentType);
					$('#txtcopy').val(URL.createObjectURL(blob));

					$rootScope.confirm("Archivo generado", "El archivo generado en la direccion '" + $('#txtcopy').val() + "'. Para visualizar el archivo, copia y pega la direccion en el navegador de tu preferencia o guarda el archivo en tu directorio", "info", function() {
							var filename = "doc.pdf"
							var result = saveAs(blob, filename);
							$rootScope.alert("Éxito","El archivo se ha almacenado en tu directorio","success");

					}, function() {
							
							var texto = document.getElementById('txtcopy');
							texto.select();
							var successful = document.execCommand('copy');
							$rootScope.timerAlert("Copiado", $('#txtcopy').val(), 2000);
							

							



					}, "Guardar","Copiar");


					
				});

			};
			
		});
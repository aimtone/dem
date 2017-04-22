		var app = angular.module('crud',[]);


		// Controlador principal de nuestra pagina
		app.controller('mainCtrl', function($scope,$http) {
			$scope.dominio = window.location;
	        $scope.message = 'Ejemplo';
	        $scope.subtitle = "Subir una imagen haciendo uso de API REST";

	        $scope.imageJSON = {};

	        $scope.enlaces = {};

	        angular.element(document).ready(function () {
	        	setInterval(function() {
	        		$scope.get(); 	
	        	}, 1000);
		   		
		    });

	        // La funcion post() que hace la solicitud para publicar un nuevo elemento
		    $scope.post = function() {
		    	$http.post("api", $scope.imageJSON)
			    	.then(function (response){
			            console.log(response);
			            Materialize.toast(response.data.statusMessage, 4000);


			            if(response.data.data != null) {
			            	$scope.cargarImagen(response.data.data);
			            } 

			            $scope.get();
			        }, 
			        function(response) {
			        	// Aqui va el codigo en caso de error
			        });
		    }

		    $scope.get = function() {
		    	$http.get("api")
			    	.then(function (response){
			            console.log(response);
			            $scope.imagenes = response.data.data;

			            
			        }, 
			        function(response) {
			        	// Aqui va el codigo en caso de error
			        });
		    }

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
		    }


	        $scope.encodeImageFileAsURL = function() {

			    var filesSelected = document.getElementById("inputFileToLoad").files;

			    if (filesSelected.length > 0) {
			      var fileToLoad = filesSelected[0];

			      var fileReader = new FileReader();

			      fileReader.onload = function(fileLoadedEvent) {
			      	
			        var srcData = fileLoadedEvent.target.result; // <--- data: base64
			 		$scope.imageJSON.encodedImage = srcData;


			 		$scope.post();
			      }
			      fileReader.readAsDataURL(fileToLoad);
			    }
			  }



	    });

	




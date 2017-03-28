		var app = angular.module('dem',['ngRoute','ngStorage','datatables','angucomplete-alt']);

		app.controller('main', function($rootScope,$scope,$http,$q,$localStorage) {

			

        	// FUNCIONES QUE SE EJECUTAN AL CARGAR LA PAGINA (INICIO)
        	angular.element(document).ready(function() {


        		// Establecer y cargar el lenguaje seleccionado para la pagina
        		$rootScope.setLang($localStorage.locale);
        	});

        	 
        	// FUNCIONES QUE SE EJECUTAN AL CARGAR LA PAGINA (FIN)
        	// ----------------------------------------------------------------------- //
        	// FUNCIONES DE CONFIGURACION (INICIO)

			$rootScope.config = {
				// Funcion para establacer el lenguage de la pagina
				locale: $localStorage.locale,
				lang: function(lang) {
					var defered = $q.defer();
          			var promise = defered.promise;
					$http.get("assets/lang/" + lang + ".json").then(function (response) {
					    defered.resolve(response);
					}, function(response) {
					    defered.reject(response);
					});
					return promise;
				}
			};
			$rootScope.modalWindow = function() {
	        	$('.modal').modal({
			      opacity: .5, // Opacity of modal background
			      inDuration: 300, // Transition in duration
			      outDuration: 200, // Transition out duration
			      startingTop: '10%', // Starting top style attribute
			      endingTop: '10%'
			    }
			  );
	        }

        	$rootScope.setLang = function(idioma) {
        		$localStorage.locale = idioma;

	        	$rootScope.config.lang($localStorage.locale).then(function(response) {
	           		$rootScope.lang = response.data;
	        	});
	        	
        	}

        	$rootScope.alert = function(title, text, type) {
        		swal({
					title: title,
					text: text,
					type: type,  
					confirmButtonColor: "#0D47A1",   
					confirmButtonText: "Aceptar",   
					closeOnConfirm: true 
				});
        	}

        	$rootScope.confirm = function(title, text, type, confirmFunction, cancelFunction) {
	        	swal({   
					title: title,   
					text: text,   
					type: type,   
					showCancelButton: true,   
					confirmButtonColor: "#0D47A1",   
					confirmButtonText: "Confirmar",   
					cancelButtonText: "Cancelar",   
					closeOnConfirm: false,   
					closeOnCancel: true 
				}, function(isConfirm) { 
					if (isConfirm) {
						confirmFunction(this);
					} else {     
						if(cancelFunction != null ) {
							cancelFunction(this);
						}
					} 
				});
        	}


        	// FUNCIONES PARA EL AUTOCOMPLETADO DE PERSONA - INICIO
        	$rootScope.localSearch = function(str, personas) {
		      var matches = [];
		      personas.forEach(function(person) {
		        var fullName = person.cedula;
		        if ((person.cedula.toLowerCase().indexOf(str.toString().toLowerCase()) >= 0) ||
		            (fullName.toLowerCase().indexOf(str.toString().toLowerCase()) >= 0)) {
		          matches.push(person);
		        }
		      });
		      return matches;
		    };

		   	


		    $rootScope.getPersonas = function(cedula) {

		    	if(cedula == undefined) {
		    		var filtro = {
			    		campos: "cedula, concat(nombre_completo,' (',descripcion, ')') AS descripcion"			    	};
		    	} else {
		    		console.log(cedula);
		    		var filtro = {
			    		campos: "cedula, concat(nombre_completo,' (',descripcion, ')') AS descripcion",
			    		donde: "where cedula like '" + cedula.cedula + "%'" 
			    	};
		    	}
		    	

		    	$http.get("api/persona_tipo_persona?filter=" + JSON.stringify(filtro)).then(function(response){

		    		if(response.data.data != undefined) {
		    			$rootScope.personas = response.data.data;
		    			$('.autocomplete').fadeIn('fast','linear');
		    			

		    		} else {
		    			$('.autocomplete').fadeOut('fast','linear');
		    			
		    		}

		    		
		    	}), function(response) {

		    	}
		    }
		    // FUNCIONES PARA EL AUTOCOMPLETADO DE PERSONA - FIN

		    

        	// FUNCIONE DE CONFIGURACION (FIN)
        	// ----------------------------------------------------------------------- //
        	// SCRIPT DE EJECUCION PRINCIPAL (INICIO)
        	if ($localStorage.locale === undefined) {
        		$localStorage.locale = "es-VE";
        	}
        	// SCRIPT DE EJECUCION PRINCIPAL (FIN)
        	// ----------------------------------------------------------------------- //

        	
			
		});

		






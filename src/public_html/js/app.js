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

        	$rootScope.toast = function(message) {
        		Materialize.toast(message, 2000, "toasts");
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
		    		var filtro = {
			    		campos: "cedula, concat(nombre_completo,' (',descripcion, ')') AS descripcion",
			    		donde: "where cedula like '" + cedula.cedula + "%'" 
			    	};
		    	}

		    	var filter = JSON.stringify(filtro).toString();

		    	$rootScope.get("api/persona_tipo_persona?filter=" + filter).then(function(response) {
		    		if(response!=undefined) {
		    			$rootScope.personas = response;
		    			$('.autocomplete').fadeIn('fast','linear');
		    		} else {
		    			$('.autocomplete').fadeOut('fast','linear');
		    		}
		    		
		    	}, function(response) {
		    		console.log(response);
		    	});
		    	
		    }


		    // FUNCIONES PARA EL AUTOCOMPLETADO DE PERSONA - FIN

		    

        	// FUNCIONE DE CONFIGURACION (FIN)
        	// ----------------------------------------------------------------------- //
        	// SCRIPT DE EJECUCION PRINCIPAL (INICIO)
        	if ($localStorage.locale === undefined) {
        		$localStorage.locale = "es-VE";
        	}

        	var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(e){var t="";var n,r,i,s,o,u,a;var f=0;e=Base64._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9\+\/\=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Base64._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/\r\n/g,"\n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t}}

        	// SCRIPT DE EJECUCION PRINCIPAL (FIN)
        	// ----------------------------------------------------------------------- //


        		// -----------------------------------------------------------------
				// FUNCIONES PRINCIPALES | INICIO
				// -----------------------------------------------------------------

				$rootScope.get = function(url) {
					var data = {
					  	cedula: 'V-21301059',
					  	clave : '21301059'
					};

					data = JSON.stringify(data);
					data = Base64.encode(data);

					var defered = $q.defer();
			        var promise = defered.promise;
					$http.get(url, {        
					  headers: {
					  	'Content-Type': 'application/x-www-form-urlencoded',
					  	'Authorization': data
					  }
					}).then(function(response) {
						defered.resolve(response.data.data);
					}, function(response) {
						 defered.reject(response);
					});
					return promise;
				};

				$rootScope.post = function(url, data) {
					var defered = $q.defer();
			        var promise = defered.promise;
					$http.post(url, data).then(function(response) {


						defered.resolve(response.data.data);


					}, function(response) {
						 defered.reject(response);
					});
					return promise;
				};

				$rootScope.put = function(url, data) {
					var defered = $q.defer();
			        var promise = defered.promise;
					$http.put(url, data).then(function(response) {
						defered.resolve(response.data.data);
					}, function(response) {
						 defered.reject(response);
					});
					return promise;
				};

				$rootScope.delete = function(url) {
					var defered = $q.defer();
			        var promise = defered.promise;
					$http.delete(url).then(function(response) {
						defered.resolve(response.data.data);
					}, function(response) {
						 defered.reject(response);
					});
					return promise;
				};

			    // -----------------------------------------------------------------
				// FUNCIONES PRINCIPALES | FIN
				// -----------------------------------------------------------------


				// -----------------------------------------------------------------
				// INICIO | FIN
				// -----------------------------------------------------------------

				$rootScope.aMayusculas = function(e) {
					var x = angular.element("input[name=" + e.currentTarget.name + "]").val();

					var cadena = new String(x);
					cadena = cadena.toUpperCase();
					
					angular.element("input[name=" + e.currentTarget.name + "]").val(cadena);
					


				};

		

				// ----------------------------------------------------------------- 
				// VALIDACIONES | FIN
				// -----------------------------------------------------------------

        	
			
		});

		






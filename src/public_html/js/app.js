		var app = angular.module('dem',['ngRoute','ngStorage','datatables','angucomplete-alt','tabs','ngWebsocket']);
		


		app.directive('ngRightClick', function($parse) {
			return function(scope, element, attrs) {
				var fn = $parse(attrs.ngRightClick);
				element.bind('contextmenu', function(event) {
					scope.$apply(function() {
						event.preventDefault();
						fn(scope, {$event:event});
					});
				});
			};
		});

		app.directive('ngEnter', function() {
        return function(scope, element, attrs) {
            element.bind("keydown keypress", function(event) {
                if(event.which === 13) {
                        scope.$apply(function(){
                                scope.$eval(attrs.ngEnter);
                        });
                        
                        event.preventDefault();
                }
            });
        };
		});
		

		app.controller('main', function($rootScope,$scope,$http,$q,$localStorage,$location,$window) {

			

			$rootScope.nuevo_respaldo = false;
			$rootScope.Base64 = {
				_keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
				encode: function(e) {
					var t = "";
					var n, r, i, s, o, u, a;
					var f = 0;
					e = $rootScope.Base64._utf8_encode(e);
					while (f < e.length) {
						n = e.charCodeAt(f++);
						r = e.charCodeAt(f++);
						i = e.charCodeAt(f++);
						s = n >> 2;
						o = (n & 3) << 4 | r >> 4;
						u = (r & 15) << 2 | i >> 6;
						a = i & 63;
						if (isNaN(r)) {
							u = a = 64
						} else if (isNaN(i)) {
							a = 64
						}
						t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a)
					}
					return t
				},
				decode: function(e) {
					var t = "";
					var n, r, i;
					var s, o, u, a;
					var f = 0;
					e = e.replace(/[^A-Za-z0-9\+\/\=]/g, "");
					while (f < e.length) {
						s = this._keyStr.indexOf(e.charAt(f++));
						o = this._keyStr.indexOf(e.charAt(f++));
						u = this._keyStr.indexOf(e.charAt(f++));
						a = this._keyStr.indexOf(e.charAt(f++));
						n = s << 2 | o >> 4;
						r = (o & 15) << 4 | u >> 2;
						i = (u & 3) << 6 | a;
						t = t + String.fromCharCode(n);
						if (u != 64) {
							t = t + String.fromCharCode(r)
						}
						if (a != 64) {
							t = t + String.fromCharCode(i)
						}
					}
					t = $rootScope.Base64._utf8_decode(t);
					return t
				},
				_utf8_encode: function(e) {
					e = e.replace(/\r\n/g, "\n");
					var t = "";
					for (var n = 0; n < e.length; n++) {
						var r = e.charCodeAt(n);
						if (r < 128) {
							t += String.fromCharCode(r)
						} else if (r > 127 && r < 2048) {
							t += String.fromCharCode(r >> 6 | 192);
							t += String.fromCharCode(r & 63 | 128)
						} else {
							t += String.fromCharCode(r >> 12 | 224);
							t += String.fromCharCode(r >> 6 & 63 | 128);
							t += String.fromCharCode(r & 63 | 128)
						}
					}
					return t
				},
				_utf8_decode: function(e) {
					var t = "";
					var n = 0;
					var r = c1 = c2 = 0;
					while (n < e.length) {
						r = e.charCodeAt(n);
						if (r < 128) {
							t += String.fromCharCode(r);
							n++
						} else if (r > 191 && r < 224) {
							c2 = e.charCodeAt(n + 1);
							t += String.fromCharCode((r & 31) << 6 | c2 & 63);
							n += 2
						} else {
							c2 = e.charCodeAt(n + 1);
							c3 = e.charCodeAt(n + 2);
							t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63);
							n += 3
						}
					}
					return t
				}
			}

			console.log($localStorage.token);

			if(typeof $localStorage.token != "undefined") {
				if($localStorage.token!="") {
					var JSON_cedula = JSON.parse($rootScope.Base64.decode($localStorage.token));

					var filter = JSON.stringify({
						donde : "where cedula = '" + JSON_cedula.cedula + "'"
					});
					

					$http.get('api/usuario?filter='+filter,{        
							  headers: {
							  	'Content-Type': 'application/x-www-form-urlencoded',
							  	'Authorization': $localStorage.token
							  }
							}).then(function(response) {
								if(response.data.data["0"].nivel=="ADMINISTRADOR") {
									$rootScope.current_user = 1;
								}

								if(response.data.data["0"].nivel=="USUARIO ESPECIAL") {
									$rootScope.current_user = 2;
								}

								if(response.data.data["0"].nivel=="USUARIO COMUN") {
									$rootScope.current_user = 3;
								}

								if(response.data.data["0"].nivel=="SECRETARIA") {
									$rootScope.current_user = 4;
								}

					});


				} else {
					$rootScope.current_user = 1;
				}

			} else {
				$rootScope.current_user = 1;
			}

			
			
						
			$rootScope.app_name = "NOMBRE-DE-SISTEMA";
			$rootScope.token = "";

			$rootScope.x = false;
        	// FUNCIONES QUE SE EJECUTAN AL CARGAR LA PAGINA (INICIO)
        	angular.element(document).ready(function() {




        		// Establecer y cargar el lenguaje seleccionado para la pagina
        		$rootScope.setLang($localStorage.locale);

        		var fecha_hoy = moment().format("YYYY-MM-DD");
        		var filtro = JSON.stringify({
        			donde: "where inicio LIKE '"+fecha_hoy+"%' AND estatus = 'ASIGNADO'"
        		});

        		$rootScope.get('api/acto?filter='+filtro).then(function(response) {
        			console.log(response);
        			var hora_actual = moment().format("HH:mm:ss");
        			$.each(response, function(index,value) {
        				var hora_fin_evento = moment(value.fin).format("HH:mm:ss");
        				if(hora_fin_evento <= hora_actual) {
        					var data = {
        						id: null,
        						estatus : "FINALIZADO"
        					};
        					$rootScope.put('api/acto/'+value.id, data).then(function(response) {
	        					console.log(response);
	        				});
        					
        				} else {
        					var data = {
        						id: null,
        						estatus : "ASIGNADO"
        					};

        					$rootScope.put('api/acto/'+value.id, data).then(function(response) {
	        					console.log(response);
	        				});
        				}

        				

        			});
        		});

        		


				

				setTimeout(function() {
								var loaderDiv = document.getElementById("loader-wrapper");

								// When the transition ends remove loader's div from display
								// so that we can access the map with gestures or clicks
								loaderDiv.addEventListener("transitionend",function(){
										loaderDiv.style.display = "none";
								}, true);

								// Kick off the CSS transition
								loaderDiv.style.opacity = 0.0;

								cargarScripts();
								$('#mobile-demo').perfectScrollbar();
								$('.events').perfectScrollbar();
								$('#main').smoothState();
								$('.sticky').pushpin({
									top: 30,
									bottom: 1500,
									offset: 0
								});


								





						}, 1000);
				
				
				
				

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

			$rootScope.prompt = function(title,text,placeholder, okButton, cancelButton, inputType = "password") {
				swal({   
					title: title,   
					text: text,   
					type: "input",   
					confirmButtonColor: "#0D47A1",   
					confirmButtonText: "Confirmar",   
					cancelButtonText: "Cancelar",
					showCancelButton: true,   
					closeOnConfirm: false,
					inputType : inputType,
					inputPlaceholder: placeholder 
				}, function(inputValue) {   
					if (inputValue === false)  {
						cancelButton(this);
						return false;
					}
						  
					if (inputValue === "") {     
						swal.showInputError("Campo Vacio");     
						return false;
					}      
					okButton(inputValue);
					
				});
			};

			$rootScope.timerAlert = function(title, text, timer, showConfirmButton = false) {
				swal({   
					title: title,   
					text: text,   
					timer: timer,   
					showConfirmButton: showConfirmButton 
				});
			}

        	$rootScope.confirm = function(title, text, type, confirmFunction, cancelFunction, closeOnConfirm = false) {
	        	swal({   
					title: title,   
					text: text,   
					type: type,   
					showCancelButton: true,   
					confirmButtonColor: "#0D47A1",   
					confirmButtonText: "Confirmar",   
					cancelButtonText: "Cancelar",   
					closeOnConfirm: closeOnConfirm,   
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

        	$rootScope.toast = function(message, time = 2000) {
        		Materialize.toast(message, time, "toasts");
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

			$rootScope.formatDate = function(fecha, format) {
				var date = new Date(fecha);
				var dia = renderize(date.getDate().toString());
				var mes = renderize((date.getMonth() + 1).toString());
				var anio = date.getFullYear();
				var horas = renderize(date.getHours().toString());
				var minutos = renderize(date.getMinutes().toString());
				var segundos = renderize(date.getSeconds().toString());

				format = str_replace('yyyy', anio, format.toString());
				format = str_replace('MM', mes, format.toString());
				format = str_replace('dd', dia, format.toString());
				format = str_replace('hh', horas, format.toString());
				format = str_replace('mm', minutos, format.toString());
				format = str_replace('ss', segundos, format.toString());

				return format.toString();
				}

				var renderize = function(str) {
				if(str.length == 1) {
					str = "0" + str;
				}
				return str;
				}

				var str_replace = function(search, replace, subject, countObj) { // eslint-disable-line camelcase

				var i = 0
				var j = 0
				var temp = ''
				var repl = ''
				var sl = 0
				var fl = 0
				var f = [].concat(search)
				var r = [].concat(replace)
				var s = subject
				var ra = Object.prototype.toString.call(r) === '[object Array]'
				var sa = Object.prototype.toString.call(s) === '[object Array]'
				s = [].concat(s)
				var $global = (typeof window !== 'undefined' ? window : global)
				$global.$locutus = $global.$locutus || {}
				var $locutus = $global.$locutus
				$locutus.php = $locutus.php || {}
				if (typeof (search) === 'object' && typeof (replace) === 'string') {
					temp = replace
					replace = []
					for (i = 0; i < search.length; i += 1) {
					replace[i] = temp
					}
					temp = ''
					r = [].concat(replace)
					ra = Object.prototype.toString.call(r) === '[object Array]'
				}
				if (typeof countObj !== 'undefined') {
					countObj.value = 0
				}
				for (i = 0, sl = s.length; i < sl; i++) {
					if (s[i] === '') {
					continue
					}
					for (j = 0, fl = f.length; j < fl; j++) {
					temp = s[i] + ''
					repl = ra ? (r[j] !== undefined ? r[j] : '') : r[0]
					s[i] = (temp).split(f[j]).join(repl)
					if (typeof countObj !== 'undefined') {
						countObj.value += ((temp.split(f[j])).length - 1)
					}
					}
				}
				return sa ? s : s[0]
				}

			$rootScope.hexToRGBA = function(hex){
				var c;
				if(/^#([A-Fa-f0-9]{3}){1,2}$/.test(hex)){
					c= hex.substring(1).split('');
					if(c.length== 3){
						c= [c[0], c[0], c[1], c[1], c[2], c[2]];
					}
					c= '0x'+c.join('');
					return 'rgba('+[(c>>16)&255, (c>>8)&255, c&255].join(',')+',0.7)';
				}
				throw new Error('Bad Hex');
			}

			$rootScope.sprintf = function() {
				var args = arguments,
				string = args[0],
				i = 1;
				return string.replace(/%((%)|s|d)/g, function (m) {
					// m is the matched format, e.g. %s, %d
					var val = null;
					if (m[2]) {
						val = m[2];
					} else {
						val = args[i];
						// A switch statement so that the formatter can be extended. Default is %s
						switch (m) {
							case '%d':
								val = parseFloat(val);
								if (isNaN(val)) {
									val = 0;
								}
								break;
						}
						i++;
					}
					return val;
				});
			}

			$rootScope.sha1 = function(str) {
				  //  discuss at: http://locutus.io/php/sha1/
				  // original by: Webtoolkit.info (http://www.webtoolkit.info/)
				  // improved by: Michael White (http://getsprink.com)
				  // improved by: Kevin van Zonneveld (http://kvz.io)
				  //    input by: Brett Zamir (http://brett-zamir.me)
				  //      note 1: Keep in mind that in accordance with PHP, the whole string is buffered and then
				  //      note 1: hashed. If available, we'd recommend using Node's native crypto modules directly
				  //      note 1: in a steaming fashion for faster and more efficient hashing
				  //   example 1: sha1('Kevin van Zonneveld')
				  //   returns 1: '54916d2e62f65b3afa6e192e6a601cdbe5cb5897'
				  var hash
				  try {
				    var crypto = require('crypto')
				    var sha1sum = crypto.createHash('sha1')
				    sha1sum.update(str)
				    hash = sha1sum.digest('hex')
				  } catch (e) {
				    hash = undefined
				  }
				  if (hash !== undefined) {
				    return hash
				  }
				  var _rotLeft = function (n, s) {
				    var t4 = (n << s) | (n >>> (32 - s))
				    return t4
				  }
				  var _cvtHex = function (val) {
				    var str = ''
				    var i
				    var v
				    for (i = 7; i >= 0; i--) {
				      v = (val >>> (i * 4)) & 0x0f
				      str += v.toString(16)
				    }
				    return str
				  }
				  var blockstart
				  var i, j
				  var W = new Array(80)
				  var H0 = 0x67452301
				  var H1 = 0xEFCDAB89
				  var H2 = 0x98BADCFE
				  var H3 = 0x10325476
				  var H4 = 0xC3D2E1F0
				  var A, B, C, D, E
				  var temp
				  // utf8_encode
				  str = unescape(encodeURIComponent(str))
				  var strLen = str.length
				  var wordArray = []
				  for (i = 0; i < strLen - 3; i += 4) {
				    j = str.charCodeAt(i) << 24 |
				      str.charCodeAt(i + 1) << 16 |
				      str.charCodeAt(i + 2) << 8 |
				      str.charCodeAt(i + 3)
				    wordArray.push(j)
				  }
				  switch (strLen % 4) {
				    case 0:
				      i = 0x080000000
				      break
				    case 1:
				      i = str.charCodeAt(strLen - 1) << 24 | 0x0800000
				      break
				    case 2:
				      i = str.charCodeAt(strLen - 2) << 24 | str.charCodeAt(strLen - 1) << 16 | 0x08000
				      break
				    case 3:
				      i = str.charCodeAt(strLen - 3) << 24 |
				        str.charCodeAt(strLen - 2) << 16 |
				        str.charCodeAt(strLen - 1) <<
				      8 | 0x80
				      break
				  }
				  wordArray.push(i)
				  while ((wordArray.length % 16) !== 14) {
				    wordArray.push(0)
				  }
				  wordArray.push(strLen >>> 29)
				  wordArray.push((strLen << 3) & 0x0ffffffff)
				  for (blockstart = 0; blockstart < wordArray.length; blockstart += 16) {
				    for (i = 0; i < 16; i++) {
				      W[i] = wordArray[blockstart + i]
				    }
				    for (i = 16; i <= 79; i++) {
				      W[i] = _rotLeft(W[i - 3] ^ W[i - 8] ^ W[i - 14] ^ W[i - 16], 1)
				    }
				    A = H0
				    B = H1
				    C = H2
				    D = H3
				    E = H4
				    for (i = 0; i <= 19; i++) {
				      temp = (_rotLeft(A, 5) + ((B & C) | (~B & D)) + E + W[i] + 0x5A827999) & 0x0ffffffff
				      E = D
				      D = C
				      C = _rotLeft(B, 30)
				      B = A
				      A = temp
				    }
				    for (i = 20; i <= 39; i++) {
				      temp = (_rotLeft(A, 5) + (B ^ C ^ D) + E + W[i] + 0x6ED9EBA1) & 0x0ffffffff
				      E = D
				      D = C
				      C = _rotLeft(B, 30)
				      B = A
				      A = temp
				    }
				    for (i = 40; i <= 59; i++) {
				      temp = (_rotLeft(A, 5) + ((B & C) | (B & D) | (C & D)) + E + W[i] + 0x8F1BBCDC) & 0x0ffffffff
				      E = D
				      D = C
				      C = _rotLeft(B, 30)
				      B = A
				      A = temp
				    }
				    for (i = 60; i <= 79; i++) {
				      temp = (_rotLeft(A, 5) + (B ^ C ^ D) + E + W[i] + 0xCA62C1D6) & 0x0ffffffff
				      E = D
				      D = C
				      C = _rotLeft(B, 30)
				      B = A
				      A = temp
				    }
				    H0 = (H0 + A) & 0x0ffffffff
				    H1 = (H1 + B) & 0x0ffffffff
				    H2 = (H2 + C) & 0x0ffffffff
				    H3 = (H3 + D) & 0x0ffffffff
				    H4 = (H4 + E) & 0x0ffffffff
				  }
				  temp = _cvtHex(H0) + _cvtHex(H1) + _cvtHex(H2) + _cvtHex(H3) + _cvtHex(H4)
				  return temp.toLowerCase()
				};

        	 

				
				

				

				var cargarScripts = function() {

					


					$('#sidenav-left').sideNav({
						menuWidth: 300, // Default is 300
						edge: 'left', // Choose the horizontal origin
						closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
						draggable: true // Choose whether you can drag to open on touch screens
						}
					);

					$('#sidenav-right').sideNav({
						menuWidth: 300, // Default is 300
						edge: 'right', // Choose the horizontal origin
						closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
						draggable: true // Choose whether you can drag to open on touch screens
						}
					);


					setTimeout(function() {
						$('select').material_select();
						$('.dropdown-button').dropdown({
						inDuration: 300,
						outDuration: 225,
						constrainWidth: false, // Does not change width of dropdown to that of the activator
						hover: false, // Activate on hover
						gutter: 0, // Spacing from edge
						belowOrigin: true, // Displays dropdown below the button
						alignment: 'right', // Displays dropdown with edge aligned to the left of button
						stopPropagation: true // Stops event propagation
						}
					);
			
					},100);
				}

        	// SCRIPT DE EJECUCION PRINCIPAL (FIN)
        	// ----------------------------------------------------------------------- //


        		// -----------------------------------------------------------------
				// FUNCIONES PRINCIPALES | INICIO
				// -----------------------------------------------------------------

				$rootScope.get = function(url) {
					var defered = $q.defer();
			        var promise = defered.promise;
					$http.get(url, {        
					  headers: {
					  	'Content-Type': 'application/x-www-form-urlencoded',
					  	'Authorization': $localStorage.token
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
					$http.post(url, data, {        
					  headers: {
					  	'Content-Type': 'application/x-www-form-urlencoded',
					  	'Authorization': $localStorage.token
					  }
					}).then(function(response) {


						defered.resolve(response.data.data);


					}, function(response) {
						 defered.reject(response);
					});
					return promise;
				};

				$rootScope.put = function(url, data) {
					var defered = $q.defer();
			        var promise = defered.promise;
					$http.put(url, data, {        
					  headers: {
					  	'Content-Type': 'application/x-www-form-urlencoded',
					  	'Authorization': $localStorage.token
					  }
					}).then(function(response) {
						defered.resolve(response.data.data);
					}, function(response) {
						 defered.reject(response);
					});
					return promise;
				};

				$rootScope.delete = function(url) {
					var defered = $q.defer();
			        var promise = defered.promise;
					$http.delete(url, {        
					  headers: {
					  	'Content-Type': 'application/x-www-form-urlencoded',
					  	'Authorization': $localStorage.token
					  }
					}).then(function(response) {
						defered.resolve(response.data.data);
					}, function(response) {
						 defered.reject(response);
					});
					return promise;
				};

				$rootScope.validateToken = function() {
					if (typeof $localStorage.token !== 'undefined') {
						if($localStorage.token!='') {
							$rootScope.get($rootScope.sprintf('api/v1/login/%s',$localStorage.token)).then(function(response) {
								//console.log(response);
								if(response==null) {
									$location.url('/login');
									$rootScope.x = false;
									return;
								} else {
									if($localStorage.token!="") {
										var JSON_cedula = JSON.parse($rootScope.Base64.decode($localStorage.token));

										var filter = JSON.stringify({
											donde : "where cedula = '" + JSON_cedula.cedula + "'"
										});
										

										$http.get('api/usuario?filter='+filter,{        
												  headers: {
												  	'Content-Type': 'application/x-www-form-urlencoded',
												  	'Authorization': $localStorage.token
												  }
												}).then(function(response) {
													if(response.data.data["0"].nivel=="ADMINISTRADOR") {
														$rootScope.current_user = 1;
													}

													if(response.data.data["0"].nivel=="USUARIO ESPECIAL") {
														$rootScope.current_user = 2;
													}

													if(response.data.data["0"].nivel=="USUARIO COMUN") {
														$rootScope.current_user = 3;
													}

													if(response.data.data["0"].nivel=="SECRETARIA") {
														$rootScope.current_user = 4;
													}

										});


									} else {
										$rootScope.current_user = 1;
									}
			
									$rootScope.x = true;
									console.log(response);
									$rootScope.id_usuario = response["0"].id;
									console.log(response["0"].id);
									$rootScope.nivel = response["0"].nivel;
									$rootScope.cedula = response["0"].cedula;

									var filter = JSON.stringify({
										donde : "where cedula = '" + $rootScope.cedula + "'"
									});

									$rootScope.get('api/persona?filter='+filter).then(function(response) {
										
										$rootScope.usuario_en_linea = {
											cedula : response["0"].cedula,
											nombres : response["0"].nombres,
											apellidos : response["0"].apellidos,
											email: response["0"].email,
											fecha_de_nacimiento : response["0"].fecha_de_nacimiento,
											telefono: response["0"].telefono,
											nivel: $rootScope.nivel 
										};
										
										

									});
								}
							});
						} else {
							$location.url('/login');
							return;
						}
					} else {
						$location.url('/login');
						return;
					}
				};

				$rootScope.validateSession = function() {
					if (typeof $localStorage.token !== 'undefined') {
						if($localStorage.token!='') {
							if (typeof $localStorage.token !== 'undefined') {
								if($localStorage.token!='') {
									$rootScope.get($rootScope.sprintf('api/v1/login/%s',$localStorage.token)).then(function(response) {
										//console.log(response);
										if(response!=null) {
											$location.url('/');
											return;
										}
									});

								}

							}
						}

					} 
				}

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



					$('#logout').on('click', function() {
						$rootScope.x = false;
						$rootScope.token = {};
						$localStorage.token = "";
						$rootScope.usuario_en_linea = undefined;
						$localStorage.eventClick = undefined;
						$location.url('/login');

					});

		

				// ----------------------------------------------------------------- 
				// VALIDACIONES | FIN
				// -----------------------------------------------------------------
				$rootScope.cargarNotificaciones = function() {
					var filter = JSON.stringify({
						ordenarPor: "order by id DESC LIMIT 5"
					});
					$rootScope.get('api/notificaciones?filter='+filter).then(function(response) {
						$rootScope.notificacion = response;
					});
				};

				$rootScope.notificacionVista = function(id) {
					var data = {
						id: id,
						status: 0
					};

					$rootScope.put('api/notificaciones/'+id, data).then(function(response) {
						console.log(response);
						$rootScope.cargarNotificaciones();
						$rootScope.cargarBadget();
					});
				};

				$rootScope.cargarBadget = function() {
					var filter = JSON.stringify({
						donde: "where status = 1"
					});
					$rootScope.get('api/notificaciones?filter='+filter).then(function(response) {
						if(typeof response != "undefined") {
							$rootScope.badget = response.length;
						} else {
							$rootScope.badget = 0;
						}
						
					});
				};

				var contador = 0;
				var inactividad = false;
				
				$(document).ready(function() {
					console.log("consultar notificaciones");
					
					$rootScope.cargarNotificaciones();
					$rootScope.cargarBadget();

					setInterval(function() {
						if($rootScope.x === true) {
							console.log(contador);
							if(contador==180) {
								inactividad = true;
								$localStorage.token = undefined;
								$rootScope.prompt("Hemos detectado inactividad","Tu sesion finalizara en 60 segundos. Si deseas continuar la sesion, ingresa tu clave","",
								function(response) {
									// al presionar ok
									$rootScope.token = {
										cedula: $rootScope.cedula,
										clave : $rootScope.Base64.encode(md5(response))
									};

									console.log($rootScope.token);
									$rootScope.token = JSON.stringify($rootScope.token);
									$rootScope.token = $rootScope.Base64.encode($rootScope.token);

									$http.get($rootScope.sprintf('api/v1/login/%s',$rootScope.token)).then(function(response) {										
										if(response.status === 200) {
											contador = 0;
											$rootScope.x = true;
											$localStorage.token = $rootScope.token;
											$rootScope.timerAlert("Verificado","Has verificado tu sesion",1000);
										}

										if(response.status === 201) {
											$rootScope.x = false;
											$localStorage.token = undefined;
											window.location.href="#!/login";
											$rootScope.alert("Hemos detectado inactividad", "La clave introducida no coincide, tu sesion se ha cerrado por tu seguridad", "error");

										}

										

										
									}, function(response) {
										if(response.status == 404) {
											$rootScope.toast(response.statusText);
										}
										if(response.status == 500) {
											$rootScope.toast(response.statusText);
										}
									});
								}, function() {
									// al presionar cancelar
									$rootScope.x = false;
									$localStorage.token = undefined;
									window.location.href="#!/login";
								});
										
							}


							if(contador==240) {
								$rootScope.x = false;
								$localStorage.token = undefined;
								window.location.href="#!/login";
								$rootScope.alert("Hemos detectado inactividad", "Tu sesión ha sido finalizada por inactividad", "error");
									
							}
							contador = contador + 60;

						}
				}, 60000);
						
			});
			

				$( "body" ).mousemove(function( event ) {
					if(inactividad != true) {
						contador = 0;
					}
					
				});
				$( "body" ).click(function( event ) {
					contador = 0;
				});

				$( "body" ).keypress(function( event ) {
					if(inactividad != true) {
						contador = 0;
					}
				});

        	
			
		});

		






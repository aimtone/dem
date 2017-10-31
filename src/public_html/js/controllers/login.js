		app.controller('login', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateSession();
			$rootScope.objeto = "";
		
		angular.element(document).ready(function() {
			$("#cedula").mask("l-99999999");
			DrawCaptcha();
			$('body').css({
				background: "#14385f",
				transition: "all ease-out 0.1s"
			});
			
					
			
		});

		$("#btnrefresh").on('click',function() {
			DrawCaptcha();
		});

		
		//Created / Generates the captcha function    
		function DrawCaptcha()
		{

			var imagenes = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"];
			var colores = ["white", "red", "yellow", "blue", "black", "orange", "brown", "pink", "green"];
			var fuentes = ["Barrio", "Times New Roman", "Arial", "Ubuntu", "Verdana", "Gothic"];
			var tamanoFuente = ["25px", "26px","27px","28px","29px","30px","31px","32px","33px","34px","35px","36px","37px"];
			var primera_position = ["right","top","left","bottom","center"];
			var segunda_position = ["right","top","left","bottom","center"];

			console.log(Math.floor(Math.random() * colores.length + 1));

			var color = colores[Math.floor(Math.random() * colores.length)];

			if(color=="white") {
				$('#txtCaptcha').css({
					background: "#ffffff url('assets/images/captcha"+Math.floor(Math.random() * imagenes.length + 1)+".JPG') no-repeat "+primera_position[Math.floor(Math.random() * primera_position.length)]+" " + segunda_position[Math.floor(Math.random() * segunda_position.length)],
					color: color ,
					fontFamily: fuentes[Math.floor(Math.random() * fuentes.length)],
					textShadow : "1px 1px 1px black",
					fontSize: tamanoFuente[Math.floor(Math.random() * tamanoFuente.length)]
				});
			} else {
				$('#txtCaptcha').css({
					background: "#ffffff url('assets/images/captcha"+Math.floor(Math.random() * imagenes.length + 1)+".JPG') no-repeat right top",
					color: color ,
					fontFamily: fuentes[Math.floor(Math.random() * fuentes.length)],
					textShadow : "1px 1px 1px " + color,
					fontSize: tamanoFuente[Math.floor(Math.random() * tamanoFuente.length)]
				});
			}
			


			var claves;
			claves=Array("A","B","C","D","E","F","G","H","I"," J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i"," j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7"," 8","9","0");
			
			var a = claves[Math.floor(Math.random() * claves.length)];
			var b = claves[Math.floor(Math.random() * claves.length)];       
			var c = claves[Math.floor(Math.random() * claves.length)];  
			var d = claves[Math.floor(Math.random() * claves.length)];  
			var e = claves[Math.floor(Math.random() * claves.length)];  
			var f = claves[Math.floor(Math.random() * claves.length)];  
			var g = claves[Math.floor(Math.random() * claves.length)]; 
			 
			var code = a +  b + c + d  + e + f +  g;
			document.getElementById("txtCaptcha").value = code
		}

		// Validate the Entered input aganist the generated security code function   
		function ValidCaptcha(){
			var str1 = (document.getElementById('txtCaptcha').value);
			var str2 = (document.getElementById('txtInput').value);
			if (str1 == str2) { 
				return true; 
			} else {       
				return false; 
			}
			
		}

		function removeSpaces(string)
            {
                return string.split(' ').join('');
            }

	

		$('#login').on('click',function() {
			if($scope.datos==undefined) { $rootScope.toast("Rellene los campos"); return; }
			if($scope.datos.cedula==undefined) {  $rootScope.toast("Campo 'cédula' vacio"); return; }
			if($scope.datos.clave==undefined) { $rootScope.toast("Campo 'clave' vacio");  return;}

			if(ValidCaptcha()==true) {
				$rootScope.token = {
					cedula: $scope.datos.cedula,
					clave : $rootScope.Base64.encode(md5($scope.datos.clave))
				};

				//console.log($rootScope.Base64.encode(md5($scope.datos.clave)));

				$rootScope.token = JSON.stringify($rootScope.token);
				$rootScope.token = $rootScope.Base64.encode($rootScope.token);

				$http.get($rootScope.sprintf('api/v1/login/%s',$rootScope.token)).then(function(response) {
					if(response.status == 200) {

						$('body').css({
							background: "white",
							transition: "all ease-in 0.1s"
						});
						$('.login-box').css({
							border: "none",
							boxShadow: "none",
							background :"white"
						});
						$('.login-box').html("<center id='preload'><div class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle'></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div><p>Iniciando sesión...</p></center>");
						

						setTimeout(function() {
							$('.login-box').fadeOut('fast');
							$rootScope.x = true;
						
							$rootScope.server.connect();
							setTimeout(function() {
								$rootScope.cargarNotificacionesCompletas();
								$rootScope.cargarBadget();	
							}, 5000);
							
							$rootScope.cedula = response.data.data[0].cedula;
							$rootScope.nivel = response.data.data[0].nivel;
							$rootScope.id_usuario = response.data.data[0].id_usuario;
							$localStorage.token = $rootScope.token;

							$rootScope.toast(response.statusText);
							

							var fecha_hoy = moment().format("YYYY-MM-DD");
			        		var filtro = JSON.stringify({
			        			donde: "where inicio LIKE '"+fecha_hoy+"%' AND estatus = 'ASIGNADO'"
			        		});


			        		$rootScope.get('api/acto?filter='+filtro).then(function(response) {
			        			//console.log(response);
			        			var hora_actual = moment().format("HH:mm:ss");
			        			$.each(response, function(index,value) {
			        				var hora_fin_evento = moment(value.fin).format("HH:mm:ss");
			        				if(hora_fin_evento <= hora_actual) {
			        					var data = {
			        						id: null,
			        						estatus : "FINALIZADO"
			        					};
			        					$rootScope.put('api/acto/'+value.id, data).then(function(response) {
				        					//console.log(response);
				        				});
			        					
			        				} else {
			        					var data = {
			        						id: null,
			        						estatus : "ASIGNADO"
			        					};

			        					$rootScope.put('api/acto/'+value.id, data).then(function(response) {
				        					//console.log(response);
				        				});
			        				}

			        				

			        			});
			        		});

			        		$rootScope.get('api/config_generales').then(function(response) {
										$rootScope.atributos = {
											usuario : response["0"].usuario,
											clave : response["0"].clave,
											basedatos: response["0"].basedatos

										};


										$rootScope.get('back-up?accion=Respaldo&usuario='+$rootScope.atributos.usuario+'&clave='+$rootScope.atributos.clave+'&nombre=backup&basedatos='+$rootScope.atributos.basedatos).then(function(response) {
											//console.log("Respaldo automatico creado");
											$rootScope.nuevo_respaldo = true;

										});
									});


							
							

							var filter = JSON.stringify({
								donde : "where cedula = '" + $rootScope.cedula + "'"
							});

							$rootScope.get('api/persona?filter='+filter).then(function(response) {
								
								$rootScope.usuario_en_linea = {
									id: response["0"].id,
									cedula : response["0"].cedula,
									nombres : response["0"].nombres,
									apellidos : response["0"].apellidos,
									email: response["0"].email,
									fecha_de_nacimiento : response["0"].fecha_de_nacimiento,
									telefono: response["0"].telefono,
									nivel: $rootScope.nivel 
								};


								if($rootScope.usuario_en_linea.nivel=="ADMINISTRADOR") {
									$location.url('/');
								}
								if($rootScope.usuario_en_linea.nivel=="USUARIO ESPECIAL") {
									$location.url('/programador');
								}
								if($rootScope.usuario_en_linea.nivel=="USUARIO_COMUN") {
									$location.url('/programador');
								}
								if($rootScope.usuario_en_linea.nivel=="SECRETARIA") {
									$location.url('/presentacion');
								}

								

							});
						},1000);


						
					}
					if(response.status == 201) {
						$localStorage.token = "";
						$rootScope.toast(response.statusText);
					}
					

					
				}, function(response) {
					if(response.status == 404) {
						$rootScope.toast(response.statusText);
					}
					if(response.status == 500) {
						$rootScope.toast(response.statusText);
					}
				});
			} else {
				$rootScope.toast("El código introducido no coincide con el de la imagen");
			}
		});

		
			
			
		});
		app.controller('login', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateSession();
		
		angular.element(document).ready(function() {
			$("#cedula").mask("l-99999999");
			DrawCaptcha();
			
		});

		$("#btnrefresh").on('click',function() {
			DrawCaptcha();
		});

		
		//Created / Generates the captcha function    
		function DrawCaptcha()
		{
			var claves;
			claves=Array("A","B","C","D","E","F","G","H","I"," J","K","L","M","N","O","P","Q","R","S","T","U","V" ,"W","X","Y","Z","0","1","2","3","4","5","6","7"," 8","9","0"," ");
			
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
			var str1 = document.getElementById('txtCaptcha').value;
			var str2 = document.getElementById('txtInput').value;
			if (str1 == str2) { 
				return true; 
			} else {       
				return false; 
			}
			
		}

		// Remove the spaces from the entered and generated code
		function removeSpaces(string)
		{
			return string.split(' ').join('');
		}

	

		$('#login').on('click',function() {
			if($scope.datos==undefined) { $rootScope.toast("Rellene los campos"); return; }
			if($scope.datos.cedula==undefined) {  $rootScope.toast("Campo 'cedula' vacio"); return; }
			if($scope.datos.clave==undefined) { $rootScope.toast("Campo 'clave' vacio");  return;}

			if(ValidCaptcha()==true) {
				$rootScope.token = {
					cedula: $scope.datos.cedula,
					clave : $rootScope.Base64.encode(md5($scope.datos.clave))
				};

				$rootScope.token = JSON.stringify($rootScope.token);
				$rootScope.token = $rootScope.Base64.encode($rootScope.token);

				$http.get($rootScope.sprintf('api/v1/login/%s',$rootScope.token)).then(function(response) {
					if(response.status == 200) {
						$rootScope.x = true;
						$rootScope.cedula = response.data.data[0].cedula;
						$rootScope.id_usuario = response.data.data[0].id_usuario;
						$localStorage.token = $rootScope.token;

						$rootScope.toast(response.statusText);
						
						$location.url('/');
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
				$rootScope.toast("El codigo introducido no coincide con el de la imagen");
			}
		});

		
			
			
		});
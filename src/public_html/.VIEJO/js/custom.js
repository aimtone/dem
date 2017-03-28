  var app = angular.module('app', ['ngRoute'])
  	// Configuracion de las rutas y sus respectivas plantillas
  app.config(function($routeProvider) {
	$routeProvider
		.when('/', {
		    templateUrl : 'public_html/view/home.html',
		    controller  : 'home'
		})
 
    .when('/agenda', {
        templateUrl : 'public_html/view/programador.html',
        controller  : 'agenda'
    })

    .when('/audiencia', {
        templateUrl : 'public_html/view/audiencia.html',
        controller  : 'audiencia'
    })


	});

  app.controller('main', function($scope){

    var formatDate = function(fecha, format) {
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


    $scope.meta = {
    	titulo : "DIRECCION EJECTIVA DE LA MAGISTRATURA",
    	anio : "2017",
      entidad : "",
      icono: "icon-home",
      fechaActual: formatDate(new Date(),"yyyy-MM-ddThh:mm:ss"),
    	links : {
    		home : "#!/",
    		login : "ingresar/",
        agenda: "#!/agenda/",
        sala: "#!/sala/",
        imputado: "#!/imputado/",
        juez: "#!/juez/",
        testigo: "#!/testigo/",
        defensor: "#!/defensor/",
        audiencia: "#!/audiencia/",
        sms: "#!/sms/",
        correo: "#!/correo/",
        mensajes: "#!/mensajes/"
    	}
    };
  });


  app.controller('login', function($scope){
  });

  app.controller('audiencia', function($scope){
    $scope.meta.entidad = "Audiencia";
    $scope.meta.icono = "icon-calendar";

    angular.element(document).ready(function() {
      
    });
  });

  app.controller('home', function($scope){
    $scope.meta.entidad = "Inicio";
    $scope.meta.icono = "icon-calendar";
  });

// Controlador de la entidad Usuario donde se incluiran cada una de sus funciones
    app.controller('agenda', function($scope,$http,$q) {



      // VARIABLES DE INICIO -- INICIO //
      $scope.meta.entidad = "Agenda de Eventos";
      $scope.meta.icono = "icon-calendar";

      // VARIABLES DE INICIO -- FIN //
          
      // FUNCION GET :  OBTIENE LOS DATOS NECESARIOS PARA VISUALIZAR EL CALENDARIO  -- INICIO //
      $scope.get = function(id, tabla){
          var defered = $q.defer();
          var promise = defered.promise;

          if(id=="") {
            $http.get("api/" + tabla).then(function (response) {
              defered.resolve(response.data.data);
              //Materialize.toast(response.data.statusMessage, 4000);
             


            }, function(response) {
              defered.reject(response);
            });
          } else {
            $http.get("api/" + tabla + "/" + id).then(function (response) {
                defered.resolve(response.data.data[0]);
                //Materialize.toast(response.data.statusMessage, 4000);
            }, function(response) {
              defered.reject(response);
            });
          }
          return promise;
      }
      // FUNCION GET :  OBTIENE LOS DATOS NECESARIOS PARA VISUALIZAR EL CALENDARIO  -- FIN //
      
      // FUNCION DE CONFIGURACION PARA EL PROGRAMADOR DE EVENTOS  -- INICIO //
      $scope.config = {
            schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
            now: new Date(),
            editable: true, // enable draggable events
            droppable: true, // this allows things to be dropped onto the calendar
            aspectRatio: 1.8,
            scrollTime: '00:00', // undo default 6am scrollTime
            header: {
              left: 'today prev,next',
              center: 'title',
              right: 'timelineDay,timelineThreeDays,agendaWeek,month'


            },
            defaultView: 'timelineDay',
            views: {
               timelineThreeDays: {
                type: 'timeline',
                duration: { days: 5 }
               }
            },
            resourceLabelText: 'Salas disponibles',
            resources : [],
            events: [],
            drop: function(date, jsEvent, ui, resourceId) {
              console.log('drop', date.format(), resourceId);

              // is the "remove after drop" checkbox checked?
              if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
              }
            },
            eventReceive: function(event) { // called when a proper external event is dropped
              console.log('eventReceive', event);
            },
            eventDrop: function(event) { // called when an event (already on the calendar) is moved
              console.log('eventDrop', event);
            }
      };
      // FUNCION DE CONFIGURACION PARA EL PROGRAMADOR DE EVENTOS  -- FIN //

      // FUNCION DE CARGAR EL CALENDARIO  -- INICIO //
      $scope.cargarCalendario = function(config) {
          $('#external-events .fc-event').each(function() {
            // store data so the calendar knows to render an event upon drop
            $(this).data('event', {
              title: $.trim($(this).text()), // use the element's text as the event title
              stick: true // maintain when user navigates (see docs on the renderEvent method)
            });
                  // make the event draggable using jQuery UI
            $(this).draggable({
              zIndex: 999,
              revert: true,      // will cause the event to go back to its
              revertDuration: 0  //  original position after the drag
            });
          });

            /* initialize the calendar
              -----------------------------------------------------------------*/
          $('#calendar').fullCalendar(config);
      }
      // FUNCION DE CARGAR EL CALENDARIO  -- FIN //   


      // FUNCION READY :  SE EJECUTA AL INICIO DE LA PAGINA  -- INICIO //
      angular.element(document).ready(function() {


       $scope.get('','sala').then(function(data) {
            $scope.config.resources = data;
        });

       $scope.get('','evento_sala').then(function(data) {
            $scope.config.events = data;
            $scope.cargarCalendario($scope.config);
            
        });
      
      
      });
      // FUNCION READY :  SE EJECUTA AL INICIO DE LA PAGINA  -- FIN //


      setInterval(function() {
        $scope.get('','sala').then(function(data) {
            $scope.config.resources = data;
        });

       $scope.get('','evento_sala').then(function(data) {
            $scope.config.events = data;
            $scope.cargarCalendario($scope.config);
            
        });

       console.log("hola");
      }, 10000);

    });

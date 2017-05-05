		app.controller('programador', function($rootScope,$scope,$http,$localStorage,$location,$window,$routeParams) {
			$rootScope.validateToken();
			$rootScope.objeto = "Programador de Actos";

            angular.element(document).ready(function() {
                

                adaptarCalendarioaPantalla();

                

                        $('#calendar').fullCalendar($scope.config);
                 
                    setInterval(function() {
                        $('#calendar').fullCalendar( 'rerenderEvents' );
                        $('#calendar').fullCalendar( 'refetchEvents' );
                        //$('#calendar').fullCalendar( 'refetchResources' );
                    },60000);

                    setInterval(function() {
                     
                        $('#calendar').fullCalendar( 'refetchResources' );
                    },300000);


                    if (typeof $routeParams.fecha !== 'undefined') {
						if($routeParams.fecha!='') {
                            var fecha = $.fullCalendar.moment($routeParams.fecha);
                            $('#calendar').fullCalendar( 'gotoDate', fecha );
                        }
                    }

                
                
                



            });

            $( window ).resize(function() {
                adaptarCalendarioaPantalla();
            });

            var adaptarCalendarioaPantalla = function() {
                var ancho_calendar = document.body.clientWidth * 0.90;
                var ancho_panel = screen.width * 0.09;
                

                $('#calendar').css({
                    width: ancho_calendar + 'px',
                    minWidth:  ancho_calendar + 'px',
                    maxWidth:  ancho_calendar + 'px',
                    marginLeft: ancho_panel + 'px',
                    right: '5px'
                });

                $('#external-events').css({
                    width: ancho_panel + 'px',
                    minWidth:  ancho_panel + 'px',
                    maxWidth:  ancho_panel + 'px'
                });
                
            };

            /* initialize the external events
                -----------------------------------------------------------------*/

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
            
            var filter_sala = {
                    campos : "id, descripcion AS title, color AS eventColor"
                };

            $scope.config = {
                        schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                        theme: true,
                        locale: 'es',
                        now: new Date(),
                        weekends: true,
                        weekNumbers: true,
                        weekNumbersWithinDays: true,
                        timezone: 'local',
                        businessHours: {
                            // days of week. an array of zero-based day of week integers (0=Sunday)
                            dow: [ 0, 1, 2, 3, 4, 5, 6 ], // Monday - Thursday

                            start: '08:00', // a start time (10am in this example)
                            end: '18:00', // an end time (6pm in this example)
                        },
                        showNonCurrentDates: false,
                        height: 650,
                        aspectRatio: 7,
                        editable: true, // enable draggable events
                        droppable: true, // this allows things to be dropped onto the calendar
                        aspectRatio: 1.8,
                        scrollTime: '00:00', // undo default 6am scrollTime
                        customButtons: {
                            btnNuevoActo: {
                                text: 'Nuevo acto',
                                click: function() {
                                    alert('Ir a la pagina cargar acto');
                                }
                            }
                        },
                        header: {
                            left: 'btnNuevoActo,today prev,next',
                            center: 'title',
                            right: 'agendaDay,agendaWeek,month,listWeek'


                        },
                        navLinks: true,
                        dayClick: function(date, jsEvent, view) {

                            console.log('Clicked on: ' + date.format());

                            console.log('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

                            console.log('Current view: ' + view.name);

                            // change the day's background color just for fun
                            //$(this).css('background-color', 'red');

                        },
                        selectable: true,
                        selectHelper: true,
                        unselectAuto: true,
                        unselectCancel: 'hola',
                        eventOverlap: false,
                        minTime: "08:00:00",
                        maxTime: "18:00:00",
                        slotEventOverlap: false,
                        slotDuration: "00:30:00",
                        noEventsMessage: "No hay eventos para mostrar",
                        nowIndicator: true,
                        defaultView: 'agendaDay',
                        validRange: function(nowDate) {
                            return {
                                start: nowDate,
                                end: nowDate.clone().add(900, 'months')
                            };
                        },
                        refetchResourcesOnNavigate: true,
                        resourceLabelText: 'Salas disponibles',
                        resources: function(callback, start, end, timezone) {
                            $.ajax({
                                url: 'api/sala?filter=' + JSON.stringify(filter_sala),
                                dataType: 'json',
                                beforeSend: function(request) {
                                    request.setRequestHeader("Authorization", $localStorage.token);
                                },
                                success: function(doc) {
                                    console.log(doc);
                                    callback(doc.data);
                                }
                            });
                        },
                        events: function(start, end, timezone, callback) {
                            $.ajax({
                                url: 'api/acto_sala',
                                dataType: 'json',
                                data: {
                                    // our hypothetical feed requires UNIX timestamps
                                    start: start.unix(),
                                    end: end.unix()
                                },
                                beforeSend: function(request) {
                                    request.setRequestHeader("Authorization", $localStorage.token);
                                },
                                success: function(doc) {
                                    
                                    callback(doc.data);
                                }
                            });
                        },
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
                            
                            var fecha_inicio = new Date(event._start._d);
                            var fecha_fin = new Date(event._start._d);
                            fecha_fin.setHours(fecha_inicio.getHours()+2);

                            var data = {
                                inicio: $rootScope.formatDate(fecha_inicio,"yyyy-MM-ddThh:mm:ss"),
                                fin: $rootScope.formatDate(fecha_fin,"yyyy-MM-ddThh:mm:ss"),
                                titulo: event.title,
                                descripcion: event.title,
                                id_sala: event.resourceId,
                            };
                            $rootScope.post('api/acto', data).then(function() {
                                $('#calendar').fullCalendar( 'removeEvents', event._id );
                                $('#calendar').fullCalendar( 'refetchEvents' );
                            });
                        
                        },
                        eventDrop: function(event) { // called when an event (already on the calendar) is moved
                            console.log('eventDrop', event);
                            
                            var data = {
                                id: event._id,
                                inicio: $rootScope.formatDate(event._start._d,"yyyy-MM-ddThh:mm:ss"),
                                fin: $rootScope.formatDate(event._end._d,"yyyy-MM-ddThh:mm:ss"),
                                titulo: event.title,
                                descripcion: event.title,
                                id_sala: event.resourceId,
                            };


                            $rootScope.put('api/acto/' + event._id, data).then(function(response) {
                                console.log(response);
                                $('#calendar').fullCalendar( 'rerenderEvents' );
                            });
                        },
                        eventResize: function(event) {
                            var data = {
                                id: event._id,
                                inicio: $rootScope.formatDate(event._start._d,"yyyy-MM-ddThh:mm:ss"),
                                fin: $rootScope.formatDate(event._end._d,"yyyy-MM-ddThh:mm:ss"),
                                titulo: event.title,
                                descripcion: event.title,
                                id_sala: event.resourceId,
                            };

                            $rootScope.put('api/acto/' + event._id, data).then(function(response) {
                                console.log(response);
                                $('#calendar').fullCalendar( 'rerenderEvents' );
                            });

                        },
                        select: function( start, end, jsEvent, view, resource) {
                  

                            var data = {
                                id: event._id,
                                inicio: $rootScope.formatDate(start._d,"yyyy-MM-ddThh:mm:ss"),
                                fin: $rootScope.formatDate(end._d,"yyyy-MM-ddThh:mm:ss"),
                                titulo: "",
                                descripcion: "",
                                id_sala: resource.id
                            };

                            $localStorage.evento = data;
                            $window.location.href= "#!/acto";
                           
                        }
                };
			
		});
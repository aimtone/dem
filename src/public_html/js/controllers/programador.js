		app.controller('programador', function($rootScope,$scope,$http,$localStorage,$location) {
			$rootScope.validateToken();
			$rootScope.objeto = "Programador de Actos";

            angular.element(document).ready(function() {
                

                var filter_sala = {
                    campos : "id, descripcion AS title, color AS eventColor"
                };

                    $rootScope.get('api/sala?filter=' + JSON.stringify(filter_sala)).then(function(response) {
                        $scope.config.resources = response;
                        console.log($scope.config);
                        $('#calendar').fullCalendar($scope.config);
                    });

                



            });

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


            $scope.config = {
                        schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                        locale: 'es',
                        now: new Date(),
                        weekends: true,
                        weekNumbers: true,
                        weekNumbersWithinDays: true,
                        timezone: 'UTC',
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
                        header: {
                            left: 'today prev,next',
                            center: 'title',
                            right: 'agendaDay,agendaWeek,month,listDay'


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
			
		});
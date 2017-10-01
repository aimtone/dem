		app.controller('programador', function($rootScope,$scope,$http,$localStorage,$location,$window,$routeParams) {
			$rootScope.validateToken();
			$rootScope.objeto = "Programador de Actos";

            var appWindow = angular.element($window);
            appWindow.bind('resize', function() {
                var arr = location.hash.split("/");
                if(arr[1]=="programador") {
                    if(innerWidth<=1154) {
                        $('.mensaje_de_error').html('Tu ordenador no cuenta con la resolución necesaria para mostrar el programador, por favor, visualizar el programador desde un ordenador con una resolución mayor o igual a 1155 pixeles');
                        $('.mensaje_de_error').css({
                            display:"block"
                        });
                        $('#wrap').css({
                            display: "none"
                        });

                    } else {
                        $('.mensaje_de_error').html('');
                        $('.mensaje_de_error').css({
                            display:"none"
                        });
                        $('#wrap').css({
                            display: "block"
                        });
                        $('#calendar').fullCalendar($scope.config);
                        setTimeout(function() {
                        $('#external-events .actos .fc-event').each(function() {

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
                        
                        
                    }, 1000);



                    }

                }
                
            });

             

            angular.element(document).ready(function() {
                adaptarCalendarioaPantalla();


                $rootScope.get('api/config_programador').then(function(response) {
                        delete response["0"].id;
                        $scope.config.locale = response["0"].locale;
                        $scope.config.start = response["0"].start;
                        $scope.config.end = response["0"].end;
                        $scope.config.minTime = response["0"].minTime;
                        $scope.config.maxTime = response["0"].maxTime;
                        $scope.config.slotDuration = response["0"].slotDuration;
                        $scope.config.noEventsMessage = response["0"].noEventsMessage;
                        $scope.config.defaultView = response["0"].defaultView;

                        if(response["0"].weekends=="1") {
                           $scope.config.weekends = true;
                        } else {
                            $scope.config.weekends = false;
                        }

                        if(response["0"].selectable=="1") {
                           $scope.config.selectable = true;
                        } else {
                            $scope.config.selectable = false;
                        }

                        if(response["0"].droppable=="1") {
                           $scope.config.droppable = true;
                        } else {
                            $scope.config.droppable = false;
                        }

                        if(response["0"].eventOverlap=="1") {
                           $scope.config.eventOverlap = true;
                        } else {
                            $scope.config.eventOverlap = false;
                        }

                        if(response["0"].weekNumbers=="1") {
                           $scope.config.weekNumbers = true;
                        } else {
                            $scope.config.weekNumbers = false;
                        }

                        if(response["0"].weekNumbersWithinDays=="1") {
                           $scope.config.weekNumbersWithinDays = true;
                        } else {
                            $scope.config.weekNumbersWithinDays = false;
                        }

                        if(response["0"].showNonCurrentDates=="1") {
                           $scope.config.showNonCurrentDates = true;
                        } else {
                            $scope.config.showNonCurrentDates = false;
                        }

                        if(response["0"].nowIndicator=="1") {
                           $scope.config.nowIndicator = true;
                        } else {
                            $scope.config.nowIndicator = false;
                        }


                        var dias_no_laborables = response["0"].hiddenDays.split(",");

                        ////console.log(dias_no_laborables);
                        var array_nuevo = [];
                        $.each(dias_no_laborables, function(index, value) {
                            if(typeof value == "string") {
                                var valor = parseInt(value);
                                array_nuevo.push(valor);

                            }
                        });

                        

                        $scope.config.hiddenDays = array_nuevo;
                        
                });

                
                if (typeof $routeParams.fecha == 'undefined') {
                    $("#calendar").html("<center id='preload'><div class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle'></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div><p>Cargando preferencias...</p></center>");
                }



                setTimeout(function() {
                    ////console.log($scope.config);
                    $('#preload').fadeOut("fast");
                    var arr = location.hash.split("/");
                        if(arr[1]=="programador") {
                            if(innerWidth<=1154) {
                                $('.mensaje_de_error').html('Tu ordenador no cuenta con la resolución necesaria para mostrar el programador, por favor, visualizar el programador desde un ordenador con una resolución mayor o igual a 1155 pixeles');
                                $('.mensaje_de_error').css({
                                    display:"block"
                                });
                                $('#wrap').css({
                                    display: "none"
                                });

                            } else {
                                $('.mensaje_de_error').html('');
                                $('.mensaje_de_error').css({
                                    display:"none"
                                });
                                $('#wrap').css({
                                    display: "block"
                                });
                                $('#calendar').fullCalendar($scope.config);

                            }

                        }

                    setTimeout(function() {
                        $( ".FINALIZADO" ).each(function() {

                                    $(this).css({
                                        background: "repeating-linear-gradient( 45deg, rgba(255,255,255,1) 20px, rgba(255,255,255,1) 40px, #DF6C4F 40px, #DF6C4F 60px )",
                                        border: "none"
                                    });


                                });

                    }, 500);
                    


                    if (typeof $routeParams.fecha !== 'undefined') {
                        if($routeParams.fecha!='') {
                            var fecha = $.fullCalendar.moment($routeParams.fecha);
                            $('#calendar').fullCalendar( 'gotoDate', fecha );
                        }
                    }
                }, 500);
                

               


             
                 
                    //setInterval(function() {
                      //  $('#calendar').fullCalendar( 'rerenderEvents' );
                       // $('#calendar').fullCalendar( 'refetchEvents' );
                        //$('#calendar').fullCalendar( 'refetchResources' );
                    //},60000);

                    //setInterval(function() {
                     
                      //  $('#calendar').fullCalendar( 'refetchResources' );
                    //},300000);


                
                
                cargarActoEspera();
                
                

                
                

                


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

            var cargarActoEspera = function() {
                var filter_acto_sala_espera = JSON.stringify({
                    donde: "where estatus = 'ESPERA'"
                });

                $rootScope.get('api/acto_sala?filter=' + filter_acto_sala_espera).then(function(response) {
                    $rootScope.JSONEspera = response;
                    ////console.log($rootScope.JSONEspera);
                });


                setTimeout(function() {
                    $('#external-events .actos .fc-event').each(function() {

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
                    
                    
                }, 1000);
            };

            /* initialize the external events
                -----------------------------------------------------------------*/

                
            
            


            var filter_sala = {
                    campos : "id, descripcion AS title, color AS eventColor"
                };
            
            var filter_acto_sala = {
                donde: "where estatus = 'ASIGNADO' or estatus = 'FINALIZADO'"
            };
            setTimeout(function() {
                //console.log($scope.config.now);
                //console.log("fecha");
            },5000);
            
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
                        //scrollTime: '08:00', // undo default 6am scrollTime
                        customButtons: {
                            btnNuevoActo: {
                                text: 'Nuevo acto',
                                click: function() {
                                    $localStorage.evento = undefined;
                                    $window.location.href= "#!/acto";

                                }
                            },
                            btnNuevoCaso: {
                                text: 'Nuevo caso',
                                click: function() {
                                    $rootScope.accion_caso=="registrar";
                                    $window.location.href= "#!/caso";
                                }
                            },
                            btnCasos: {
                                text: 'Casos',
                                click: function() {
                                    $window.location.href= "#!/casos";
                                }
                            },
                            btnActos: {
                                text: 'Actos',
                                click: function() {
                                    $window.location.href= "#!/actos";
                                }
                            }
                        },
                        header: {
                            left: 'btnNuevoCaso,btnNuevoActo,today prev,next',
                            center: 'title',
                            right: 'btnCasos,btnActos,agendaDay,agendaWeek,month,listWeek'


                        },
                        selectable: true,
                        selectHelper: true,
                        unselectAuto: true,
                        eventOverlap: false,
                        minTime: "08:00:00",
                        maxTime: "18:00:00",
                        slotEventOverlap: false,
                        slotDuration: "00:30:00",
                        noEventsMessage: "No hay eventos para mostrar",
                        nowIndicator: true,
                        defaultView: 'agendaDay',
                        allDaySlot: false,
                        
                        validRange: function() {
                            return {
                                start: $rootScope.formatDate(new Date(), "yyyy-MM-dd")                            
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

                                    callback(doc.data);
                                    setTimeout(function() {
                                        $( ".FINALIZADO" ).each(function() {
                                                    $(this).css({
                                                        background: "repeating-linear-gradient( 45deg, rgba(255,255,255,1) 20px, rgba(255,255,255,1) 40px, #DF6C4F 40px, #DF6C4F 60px )",
                                                        border: "none"
                                                    });
                                                });
                                    }, 100);

                                }
                            });
                        },
                        events: function(start, end, timezone, callback) {
                            $.ajax({
                                url: 'api/acto_sala?filter=' + JSON.stringify(filter_acto_sala),
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
                                    setTimeout(function() {
                                        $( ".FINALIZADO" ).each(function() {
                                                    $(this).css({
                                                        background: "repeating-linear-gradient( 45deg, rgba(255,255,255,1) 20px, rgba(255,255,255,1) 40px, #DF6C4F 40px, #DF6C4F 60px )",
                                                        border: "none"
                                                    });
                                                });
                                    }, 100);
                                                }
                            });
                        },
                        drop: function(date, jsEvent, ui, resourceId) {
                            $rootScope.id_evento_arrastrado = ui.helper["0"].id;

                            // is the "remove after drop" checkbox checked?
                            if ($('#drop-remove').is(':checked')) {
                                // if so, remove the element from the "Draggable Events" list
                                $(this).remove();
                            }
                        },
                        eventReceive: function(event, jsEvent) { // called when a proper external event is dropped
                            if($(".fc-view")["0"].classList[1]=="fc-agendaDay-view") {
                                var fecha_inicio = new Date(event._start._d);
                                var fecha_fin = new Date(event._start._d);
                                fecha_fin.setHours(fecha_inicio.getHours()+2);

                                if($rootScope.formatDate(fecha_inicio,"yyyy-MM-dd")==$rootScope.formatDate(new Date(),"yyyy-MM-dd")) {
                                    $('#calendar').fullCalendar( 'removeEvents', event._id );
                                    $rootScope.toast("Por favor, elija una fecha distinta a la de hoy");
                                    cargarActoEspera();
                                    var data = {};
                                    $(".FINALIZADO").css({
                                        background: "repeating-linear-gradient( 45deg, rgba(255,255,255,1) 20px, rgba(255,255,255,1) 40px, #DF6C4F 40px, #DF6C4F 60px )",
                                        border: "none"
                                    });
                                } else {
                                    
                                    var data = {
                                        id : null,
                                        inicio: $rootScope.formatDate(fecha_inicio,"yyyy-MM-ddThh:mm:ss"),
                                        fin: $rootScope.formatDate(fecha_fin,"yyyy-MM-ddThh:mm:ss"),
                                        id_sala: event.resourceId,
                                        estatus: "ASIGNADO"
                                    };


                                    $rootScope.put('api/acto/' + $rootScope.id_evento_arrastrado, data).then(function(response) {
                                        ////console.log(response);
                                        $('#calendar').fullCalendar( 'removeEvents', event._id );
                                        $('#calendar').fullCalendar( 'refetchEvents' );
                                    });

                                    

                                }

                            } else {
                                $('#calendar').fullCalendar( 'removeEvents', event._id );
                                    $rootScope.toast("No puedes asignar eventos en esta vista");
                                    cargarActoEspera();
                                    var data = {};

                                    $(".FINALIZADO").css({
                                        background: "repeating-linear-gradient( 45deg, rgba(255,255,255,1) 20px, rgba(255,255,255,1) 40px, #DF6C4F 40px, #DF6C4F 60px )",
                                        border: "none"
                                    });


                            }
                        
                        }, 
                        eventClick: function(event,jsEvent) {

                            if($(".fc-view")["0"].classList[1]=="fc-agendaDay-view") {
                                 $rootScope.get('api/acto_sala/'+event.id).then(function(response) {
                                ////console.log(response);
                                    var paramFecha = $rootScope.formatDate(response[0].start,"yyyy-MM-dd")
                                    $rootScope.LinkMasDetalles = "#!programador/" + paramFecha + "/" + response[0].id;
                                    
                                    $rootScope.event_card_data = response[0];

                                    if($rootScope.formatDate($rootScope.event_card_data.start,"dd/MM/yyyy")==$rootScope.formatDate(new Date(),"dd/MM/yyyy")) {
                                        $rootScope.event_card_data.fecha = "Hoy";
                                    } else {
                                        $rootScope.event_card_data.fecha = $rootScope.formatDate($rootScope.event_card_data.start,"dd/MM/yyyy");
                                    }

                                    $rootScope.event_card_data.titulo = $rootScope.event_card_data.title.substr(0,30);
                                    $rootScope.event_card_data.descripcion = $rootScope.event_card_data.descripcion.substr(0,90);

                             
                                    $rootScope.event_card_data.start = moment($rootScope.event_card_data.start).format("h:mm a");
                                    $rootScope.event_card_data.end = moment($rootScope.event_card_data.end).format("h:mm a");

                                    

                                    
                                    
                                    var display = $('.event-tooltip').css("display");

                                    
                                    $('.event-tooltip').fadeIn("fast");

                                    if(typeof $localStorage.eventClick != "undefined") {

                                        if($localStorage.eventClick!=event.id) {
                                            $('.event-tooltip').css({
                                                display:"block",
                                                top: (jsEvent.pageY + 10) + "px",
                                                left: (jsEvent.pageX - 5) + "px"
                                            });

                                            $('.triangulo-equilatero-bottom').css({
                                                left:"0px",
                                                top: "-20px",
                                                borderTop: "10px solid transparent",
                                                borderBottom: "10px solid black",
                                                borderLeft: "10px solid transparent",
                                                borderRight: "10px solid transparent"
                                            });
                                        } else {

                                            if(display!="none") {
                                                $('.event-tooltip').css({
                                                    display:"none",
                                                    top: (jsEvent.pageY + 10) + "px",
                                                    left: (jsEvent.pageX - 5) + "px"
                                                });
                                                $('.triangulo-equilatero-bottom').css({
                                                left:"0px",
                                                top: "-20px",
                                                borderTop: "10px solid transparent",
                                                borderBottom: "10px solid black",
                                                borderLeft: "10px solid transparent",
                                                borderRight: "10px solid transparent"
                                            });
                                            } else {
                                                $('.event-tooltip').css({
                                                    display:"block",
                                                    top: (jsEvent.pageY + 10) + "px",
                                                    left: (jsEvent.pageX - 5) + "px"
                                                });
                                                $('.triangulo-equilatero-bottom').css({
                                                left:"0px",
                                                top: "-20px",
                                                borderTop: "10px solid transparent",
                                                borderBottom: "10px solid black",
                                                borderLeft: "10px solid transparent",
                                                borderRight: "10px solid transparent"
                                            });
                                            }
                                            
                                            
                                            
                                        }
                                        
                                    } else {
                                        $('.event-tooltip').css({
                                                display:"block",
                                                top: (jsEvent.pageY + 10) + "px",
                                                left: (jsEvent.pageX - 5) + "px"
                                            });
                                            $('.triangulo-equilatero-bottom').css({
                                                left:"0px",
                                                top: "-20px",
                                                borderTop: "10px solid transparent",
                                                borderBottom: "10px solid black",
                                                borderLeft: "10px solid transparent",
                                                borderRight: "10px solid transparent"
                                            });
                                    }
                                    $localStorage.eventClick = event.id;

                               
                                        var right = $('.event-tooltip').css("right");
                                        right = right.substr(0,1);
                                        var bottom = $('.event-tooltip').css("bottom");
                                        bottom = bottom.substr(0,1);

                                        if(right==="-" && bottom==="-") {
                                            $('.event-tooltip').css({
                                                top: (jsEvent.pageY - 155) + "px",
                                                left: (jsEvent.pageX - 395) + "px"
                                            });

                                            $('.triangulo-equilatero-bottom').css({
                                                left:"380px",
                                                top: "146px",
                                                borderTop: "10px solid black",
                                                borderBottom: "10px solid transparent",
                                                borderLeft: "10px solid transparent",
                                                borderRight: "10px solid transparent"
                                            });
                                           
                                            
                                            return;
                                        }

                                        if(right==="-") {
                                            $('.event-tooltip').css({
                                                top: (jsEvent.pageY + 10) + "px",
                                                left: (jsEvent.pageX - 395) + "px"
                                            });

                                            $('.triangulo-equilatero-bottom').css({
                                                left:"380px",
                                                top: "-20px",
                                                borderTop: "10px solid transparent",
                                                borderBottom: "10px solid black",
                                                borderLeft: "10px solid transparent",
                                                borderRight: "10px solid transparent"
                                            });

                                        
                                            return;
                                        }

                                        if(bottom==="-") {
                                            $('.event-tooltip').css({
                                                top: (jsEvent.pageY - 155)  + "px",
                                                left: (jsEvent.pageX - 10) + "px"
                                            });

                                            $('.triangulo-equilatero-bottom').css({
                                                left:"0px",
                                                top: "146px",
                                                borderTop: "10px solid black",
                                                borderBottom: "10px solid transparent",
                                                borderLeft: "10px solid transparent",
                                                borderRight: "10px solid transparent"
                                            });

                                    
                                            return;
                                        }
           
                                    
                                   

                                });
                            

                            } 
                            
                           
                        },
                        eventDrop: function(event) { // called when an event (already on the calendar) is moved
                            

                            if($rootScope.formatDate(event._start._d,"yyyy-MM-dd")==$rootScope.formatDate(new Date(),"yyyy-MM-dd")) {
                                $('#calendar').fullCalendar( 'refetchEvents' );
                                $rootScope.toast("No se permite mover elementos en la fecha corriente");
                                var data = {};
                                $(".FINALIZADO").css({
                                        background: "repeating-linear-gradient( 45deg, rgba(255,255,255,1) 20px, rgba(255,255,255,1) 40px, #DF6C4F 40px, #DF6C4F 60px )",
                                        border: "none"
                                    });
                                
                            } else {
                                var data = {
                                    id: event._id,
                                    inicio: $rootScope.formatDate(event._start._d,"yyyy-MM-ddThh:mm:ss"),
                                    fin: $rootScope.formatDate(event._end._d,"yyyy-MM-ddThh:mm:ss"),
                                    id_sala: event.resourceId,
                                    id_usuario : $rootScope.id_usuario
                                };

                                $rootScope.put('api/acto/' + event._id, data).then(function(response) {
                                    ////console.log(response);
                                    $('#calendar').fullCalendar( 'rerenderEvents' );
                                    $(".FINALIZADO").css({
                                        background: "repeating-linear-gradient( 45deg, rgba(255,255,255,1) 20px, rgba(255,255,255,1) 40px, #DF6C4F 40px, #DF6C4F 60px )",
                                        border: "none"
                                    });
                                });

                            }

                            
                            
                            


                            
                        },
                        eventResize: function(event) {

                            if($rootScope.formatDate(event._start._d,"yyyy-MM-dd")==$rootScope.formatDate(new Date(),"yyyy-MM-dd")) {
                                $('#calendar').fullCalendar( 'refetchEvents' );
                                $rootScope.toast("No se permite esta acción en la fecha corriente");
                                var data = {};
                                
                            } else {
                                var data = {
                                    id: event._id,
                                    inicio: $rootScope.formatDate(event._start._d,"yyyy-MM-ddThh:mm:ss"),
                                    fin: $rootScope.formatDate(event._end._d,"yyyy-MM-ddThh:mm:ss"),
                                    descripcion: event.title,
                                    id_sala: event.resourceId,
                                    id_usuario : $rootScope.id_usuario
                                };

                                $rootScope.put('api/acto/' + event._id, data).then(function(response) {
                                    ////console.log(response);
                                    $('#calendar').fullCalendar( 'rerenderEvents' );
                                });
                            }
                            
                            $(".FINALIZADO").css({
                                        background: "repeating-linear-gradient( 45deg, rgba(255,255,255,1) 20px, rgba(255,255,255,1) 40px, #DF6C4F 40px, #DF6C4F 60px )",
                                        border: "none"
                                    });

                            

                        },
                        select: function( start, end, jsEvent, view, resource) {
                            //console.log(view);
                            if($rootScope.formatDate(start._d,"yyyy-MM-dd")==$rootScope.formatDate(new Date(),"yyyy-MM-dd")) {
                                $rootScope.toast("Por favor, elija una fecha distinta a la de hoy");
                                var data = {};
                            } else {
                                var data = {
                                    id: event._id,
                                    inicio: $rootScope.formatDate(start._d,"yyyy-MM-ddThh:mm:ss"),
                                    fin: $rootScope.formatDate(end._d,"yyyy-MM-ddThh:mm:ss"),
                                    descripcion: "",
                                    id_sala: resource.id,
                                    id_usuario : $rootScope.id_usuario
                                };

                                $localStorage.evento = data;
                                $window.location.href= "#!/acto";
                            }
                  
                            $(".FINALIZADO").css({
                                        background: "repeating-linear-gradient( 45deg, rgba(255,255,255,1) 20px, rgba(255,255,255,1) 40px, #DF6C4F 40px, #DF6C4F 60px )",
                                        border: "none"
                                    });

                            
                           
                        }
                };


                $rootScope.aEspera = function() {
                    if($rootScope.event_card_data.fecha == "Hoy") {
                        $rootScope.toast("El acto no puede ser enviado a espera");
                    } else {
                        $rootScope.adminConfirm(
                            function(response) {

                                var clave = $rootScope.sha1(md5(response));

                                var filter = JSON.stringify({
                                    donde: "where nivel = 'ADMINISTRADOR' and clave = '"+clave+"'"
                                });

                                $rootScope.get('api/usuario?filter='+filter).then(function(response) {
                                    console.log(response);

                                    if(typeof response != "undefined") {
                                        var data = {
                                            id : null,
                                            inicio: "0000-00-00T00:00:00",
                                            fin: "0000-00-00T00:00:00",
                                            id_sala: 1,
                                            estatus: "ESPERA"
                                        };


                                        $rootScope.put('api/acto/' + $rootScope.event_card_data.id, data).then(function(response) {
                                            ////console.log(response);
                                            $('.event-tooltip').fadeOut("fast");
                                            cargarActoEspera();
                                            $('#calendar').fullCalendar( 'removeEvents', event._id );
                                            $('#calendar').fullCalendar( 'refetchEvents' );
                                            $rootScope.alert("Éxito", "El acto ha sido movido a espera", "success");
                                        });
                                            
                                

                                    } else {
                                        $rootScope.timerAlert("Clave incorrecta","Tu clave de administrador no coincide",2000);
                                    }
                                });

                            }, 
                            function() {
                            // Al cancelar
                            }
                        );

                        

                    }

                    
                };

                $rootScope.eliminarActo = function() {
                    if($rootScope.event_card_data.fecha == "Hoy") {
                        $rootScope.toast("El acto no puede ser eliminado");
                    } else {
                        $rootScope.adminConfirm(
                            function(response) {

                                var clave = $rootScope.sha1(md5(response));

                                var filter = JSON.stringify({
                                    donde: "where nivel = 'ADMINISTRADOR' and clave = '"+clave+"'"
                                });

                                $rootScope.get('api/usuario?filter='+filter).then(function(response) {
                                    console.log(response);

                                    if(typeof response != "undefined") {
                                        $rootScope.delete('api/acto/' + $rootScope.event_card_data.id).then(function(response) {
                                            ////console.log(response);
                                            $('.event-tooltip').fadeOut("fast");
                                            cargarActoEspera();
                                            $('#calendar').fullCalendar( 'removeEvents', event._id );
                                            $('#calendar').fullCalendar( 'refetchEvents' );
                                            $rootScope.alert("Éxito", "El acto ha sido eliminado", "success");
                                        });
                                        
                                

                                    } else {
                                        $rootScope.timerAlert("Clave incorrecta","Tu clave de administrador no coincide",2000);
                                    }
                                });

                            }, 
                            function() {
                            // Al cancelar
                            }
                        );


                    }
                    

                };
			
		});
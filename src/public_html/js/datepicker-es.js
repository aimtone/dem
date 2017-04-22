/* French initialisation for the jQuery UI date picker plugin. */
/* Written by Keith Wood (kbwood{at}iinet.com.au),
			  Stéphane Nahmani (sholby@sholby.net),
			  Stéphane Raimbault <stephane.raimbault@gmail.com> */
( function( factory ) {
	if ( typeof define === "function" && define.amd ) {

		// AMD. Register as an anonymous module.
		define( [ "../widgets/datepicker" ], factory );
	} else {

		// Browser globals
		factory( jQuery.datepicker );
	}
}( function( datepicker ) {

datepicker.regional.es = {
	closeText: "Cerrar",
	prevText: "Anterior",
	nextText: "Siguiente",
	currentText: "Hoy",
	monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
		"Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
	monthNamesShort: [ "Ene.", "Feb.", "Mar", "Abr.", "May", "Jun",
		"Jul.", "Ago", "Sep.", "Oct.", "Nov.", "Dic." ],
	dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
	dayNamesShort: [ "Dom.", "Lun.", "Mar.", "Mie.", "Jue.", "Vie.", "Sab" ],
	dayNamesMin: [ "D","L","M","M","J","V","S" ],
	weekHeader: "Sem.",
	dateFormat: "dd/mm/yy",
	firstDay: 1,
	isRTL: false,
	showMonthAfterYear: false,
	yearSuffix: "" };
datepicker.setDefaults( datepicker.regional.fr );

return datepicker.regional.fr;

} ) );

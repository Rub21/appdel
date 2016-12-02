$(function() {
    //Set up date pickers
    var now = new Date();
    now = now.getDate() + '/' + now.getMonth() + '/' + now.getFullYear();
    $('#fecha').datepicker({
        dateFormat: 'dd/mm/yy', // formato de fecha que se usa en España
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado'], // días de la semana
        dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'], // días de la semana (versión super-corta)
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'], // días de la semana (versión corta)
        firstDay: 1, // primer día de la semana (Lunes)
        maxDate: new Date(), // fecha máxima
        minDate: '-2y',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'], // meses
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'], // meses
        navigationAsDateFormat: true,
    });
    //Set up hour pickers
    $('#hora').ptTimeSelect({
        hoursLabel: 'Horas',
        minutesLabel: 'Minutos',
        setButtonLabel: 'Establecer',
    });

    $("#fecha").attr('readonly', 'readonly');
    $("#hora").attr('readonly', 'readonly');
});


function Valida(formulario) {

}